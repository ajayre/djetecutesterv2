// Mercedes V8 DJet Engine Simulator
// (C) andy@britishideas.com 2021-2022

#include <Arduino.h>
#include "Engine.h"
#include "AirTempSensor.h"
#include "CoolantTempSensor.h"
#include "Serial.h"
// source: https://github.com/jmalloc/arduino-mcp4xxx
#include "arduino-mcp4xxx-master/mcp4xxx.h"
#include "TimerOne-master/TimerOne.h"
// https://github.com/kmpelectronics/KMP_MCP23S08
#include "KMP_MCP23S08-main/KMP_MCP23S08.h"

using namespace icecave::arduino;

// special value to indicate no manifold pressure required
#define NO_PRESSURE -1

// default air temperature at start of simulation
#define DEFAULT_AIRTEMPF 32

// allowed range of air temperature in F
#define MIN_AIRTEMPF -21
#define MAX_AIRTEMPF 32

// allows range of coolant temperature in F
#define MIN_COOLANTTEMPF 15
#define MAX_COOLANTTEMPF 101

// default pulse generator pulse angle in degrees of distributor rotation
#define DEFAULT_PULSEANGLE 135

// mcu pins
#define PIN_STATUS_LED     A3  // PC3
#define PIN_AIRTEMPCS      A5  // PC5
#define PIN_COOLANTTEMPCS1 A4  // PC4
#define PIN_COOLANTTEMPCS2 8   // PB0
#define PIN_IOCS           A2  // PC2

// io expander pins
#define PIN_TPSACCEL2 2
#define PIN_TPSACCEL1 3
#define PIN_TPSIDLE   4
#define PIN_TPSWOT    5
#define PIN_START     6
#define PIN_FUELPUMP  7

#define PORT_TRIGGERGROUP1 PORTB
#define PORT_TRIGGERGROUP2 PORTD
#define PORT_TRIGGERGROUP3 PORTD
#define PORT_TRIGGERGROUP4 PORTD

#define PIN_TRIGGERGROUP1 1
#define PIN_TRIGGERGROUP2 5
#define PIN_TRIGGERGROUP3 6
#define PIN_TRIGGERGROUP4 3

#define DIR_TRIGGERGROUP1 DDRB
#define DIR_TRIGGERGROUP2 DDRD
#define DIR_TRIGGERGROUP3 DDRD
#define DIR_TRIGGERGROUP4 DDRD

#define FALSE 0
#define TRUE  1

// IO macros
#define STATUS_LED_ON           digitalWrite(PIN_STATUS_LED, LOW)
#define STATUS_LED_OFF          digitalWrite(PIN_STATUS_LED, HIGH);
#define IS_STATUS_LED_ON        (digitalRead(PIN_STATUS_LED) == 1 ? FALSE : TRUE)

#define TPS_WOT                 IOExpander.write(PIN_TPSWOT, 1);
#define TPS_NOTWOT              IOExpander.write(PIN_TPSWOT, 0);

#define TPS_IDLE                IOExpander.write(PIN_TPSIDLE, 1);
#define TPS_NOTIDLE             IOExpander.write(PIN_TPSIDLE, 0);

#define TPS_ACCEL1_ASSERT       IOExpander.write(PIN_TPSACCEL1, 1);
#define TPS_ACCEL1_DEASSERT     IOExpander.write(PIN_TPSACCEL1, 0);

#define TPS_ACCEL2_ASSERT       IOExpander.write(PIN_TPSACCEL2, 1);
#define TPS_ACCEL2_DEASSERT     IOExpander.write(PIN_TPSACCEL2, 0);

#define AIRTEMPCS_DEASSERT      digitalWrite(PIN_AIRTEMPCS,      HIGH);
#define COOLANTTEMPCS1_DEASSERT digitalWrite(PIN_COOLANTTEMPCS1, HIGH);
#define COOLANTTEMPCS2_DEASSERT digitalWrite(PIN_COOLANTTEMPCS2, HIGH);
#define IOCS_DEASSERT           digitalWrite(PIN_IOCS,           HIGH);

#define TRIGGERGROUP1_HIGH (PORT_TRIGGERGROUP1 &= ~(1 << PIN_TRIGGERGROUP1))
#define TRIGGERGROUP1_LOW  (PORT_TRIGGERGROUP1 |=  (1 << PIN_TRIGGERGROUP1))
#define TRIGGERGROUP2_HIGH (PORT_TRIGGERGROUP2 &= ~(1 << PIN_TRIGGERGROUP2))
#define TRIGGERGROUP2_LOW  (PORT_TRIGGERGROUP2 |=  (1 << PIN_TRIGGERGROUP2))
#define TRIGGERGROUP3_HIGH (PORT_TRIGGERGROUP3 &= ~(1 << PIN_TRIGGERGROUP3))
#define TRIGGERGROUP3_LOW  (PORT_TRIGGERGROUP3 |=  (1 << PIN_TRIGGERGROUP3))
#define TRIGGERGROUP4_HIGH (PORT_TRIGGERGROUP4 &= ~(1 << PIN_TRIGGERGROUP4))
#define TRIGGERGROUP4_LOW  (PORT_TRIGGERGROUP4 |=  (1 << PIN_TRIGGERGROUP4))

#define ASSERT   1
#define DEASSERT 0

// time between turning the status LED on or off in milliseconds
#define LED_FLASH_PERIOD_ENGINEOFF 1000
#define LED_FLASH_PERIOD_ENGINEON  250

// macro to check if engine is on
#define IS_ENGINE_ON (EngineSpeed > 0)

// number of milliseconds between 1% increase in throttle
#define THROTTLE_STEP_TIME_MS 20

// resolution of pulse generator timer in microseconds
#define PG_TIMER_PERIOD_US 1000

// defines an acceleration enrichment state
typedef struct _enrichment
{
  int ThrottleLow;                                         // % x10
  int ThrottleHigh;                                        // % x10
  int Accel1State;
  int Accel2State;
} enrichment_t;

typedef struct _airpotvalue_t
{
  byte     Wiper;
  uint16_t Resistance;
} airpotvalue_t;

typedef struct _coolantpotvalue_t
{
  byte     Wiper1;
  byte     Wiper2;
  uint16_t Resistance;
} coolantpotvalue_t;

// pulse generator trigger states for state machine
typedef enum _triggerstates { G1START, G1END, G2START, G2END, G3START, G3END, G4START, G4END } triggerstates_t;

static int EngineSpeed;                                    // RPM
static int AirTempF;
static int CoolantTempF;
static int ThrottlePosition;                               // %
static throttledirection_t ThrottleDirection;
static int Pressure;                                       // manifold, inHg
static MCP4XXX *AirTempPot;
static MCP4XXX *CoolantTempPot1;
static MCP4XXX *CoolantTempPot2;
static KMP_MCP23S08 IOExpander(PIN_IOCS);
static int PulseAngle;
static unsigned long LEDTimestamp;
static volatile unsigned int PGCounter;
static unsigned int G1On;
static unsigned int G1Off;
static unsigned int G2On;
static unsigned int G2Off;
static unsigned int G3On;
static unsigned int G3Off;
static unsigned int G4On;
static unsigned int G4Off;
static unsigned int FiringPeriod;

// this table represents the fingers inside the throttle
// position sensor. As the throttle is increased the
// fingers cause accel1 and accel2 to alternate low.
// Throttle percentages are multiplied by 10
// accel1 = ECU pin 9
// accel2 = ECU pin 20
static const enrichment_t Enrichment[] = {
  // thr low, thr high, accel1, accel2
  {0,   29,   DEASSERT, ASSERT},    // accel 2 finger 1
  {30,  44,   DEASSERT, DEASSERT},
  {45,  68,   ASSERT, DEASSERT},    // accel 1 finger 1
  {69,  83,   DEASSERT, DEASSERT},
  {84,  89,   DEASSERT, ASSERT},    // accel 2 finger 2
  {90,  104,  DEASSERT, DEASSERT},
  {105, 128,  ASSERT, DEASSERT},    // accel 1 finger 2
  {129, 143,  DEASSERT, DEASSERT},
  {144, 149,  DEASSERT, ASSERT},    // accel 2 finger 3
  {150, 164,  DEASSERT, DEASSERT},
  {165, 188,  ASSERT, DEASSERT},    // accel 1 finger 3
  {189, 203,  DEASSERT, DEASSERT},
  {204, 209,  DEASSERT, ASSERT},    // accel 2 finger 4
  {210, 224,  DEASSERT, DEASSERT},
  {225, 247,  ASSERT, DEASSERT},    // accel 1 finger 4
  {248, 262,  DEASSERT, DEASSERT},
  {263, 269,  DEASSERT, ASSERT},    // accel 2 finger 5
  {270, 283,  DEASSERT, DEASSERT},
  {284, 307,  ASSERT, DEASSERT},    // accel 1 finger 5
  {308, 323,  DEASSERT, DEASSERT},
  {324, 328,  DEASSERT, ASSERT},    // accel 2 finger 6
  {329, 343,  DEASSERT, DEASSERT},
  {344, 367,  ASSERT, DEASSERT},    // accel 1 finger 6
  {368, 382,  DEASSERT, DEASSERT},
  {383, 388,  DEASSERT, ASSERT},    // accel 2 finger 7
  {389, 403,  DEASSERT, DEASSERT},
  {404, 427,  ASSERT, DEASSERT},    // accel 1 finger 7
  {428, 442,  DEASSERT, DEASSERT},
  {443, 448,  DEASSERT, ASSERT},    // accel 2 finger 8
  {449, 463,  DEASSERT, DEASSERT},
  {464, 489,  ASSERT, DEASSERT},    // accel 1 finger 8
  {490, 502,  DEASSERT, DEASSERT},
  {503, 508,  DEASSERT, ASSERT},    // accel 2 finger 9
  {509, 523,  DEASSERT, DEASSERT},
  {524, 547,  ASSERT, DEASSERT},    // accel 1 finger 9
  {548, 562,  DEASSERT, DEASSERT},
  {563, 568,  DEASSERT, ASSERT},    // accel 2 finger 10
  {569, 583,  DEASSERT, DEASSERT},
  {584, 606,  ASSERT, DEASSERT},    // accel 1 finger 10
  {607, 1000, ASSERT, DEASSERT}     // beyond 90% throttle accel 1 stays low
};

// look-up table for air temperature resistance
static const airpotvalue_t AirTempTable[] PROGMEM = {
  // wiper, resistance
  {0, 643},
  {1, 681},
  {2, 718},
  {3, 755},
  {4, 794},
  {5, 832},
  {6, 869},
  {7, 906},
  {8, 941},
  {9, 978},
  {10, 1015},
  {11, 1052},
  {12, 1091},
  {13, 1128},
  {14, 1165},
  {15, 1202},
  {16, 1237},
  {17, 1274},
  {18, 1311},
  {19, 1348},
  {20, 1386},
  {21, 1423},
  {22, 1459},
  {23, 1496},
  {24, 1529},
  {25, 1565},
  {26, 1601},
  {27, 1637},
  {28, 1674},
  {29, 1709},
  {30, 1743},
  {31, 1778},
  {32, 1810},
  {33, 1845},
  {34, 1878},
  {35, 1911},
  {36, 1945},
  {37, 1977},
  {38, 2070},
  {39, 2110},
  {40, 2140}
};

// look-up table for coolant temperature resistance
static const coolantpotvalue_t CoolantTempTable[] PROGMEM = {
  // wiper1, wiper2, resistance
  {0, 0, 1276},
  {1, 0, 1314},
  {2, 0, 1351},
  {3, 0, 1388},
  {4, 0, 1425},
  {5, 0, 1461},
  {6, 0, 1498},
  {7, 0, 1535},
  {8, 0, 1568},
  {9, 0, 1603},
  {10, 0, 1640},
  {11, 0, 1676},
  {12, 0, 1710},
  {13, 0, 1745},
  {14, 0, 1779},
  {15, 0, 1812},
  {16, 0, 1845},
  {17, 0, 1878},
  {18, 0, 1911},
  {19, 0, 1943},
  {20, 0, 1976},
  {21, 0, 2080},
  {22, 0, 2120},
  {23, 0, 2160},
  {24, 0, 2200},
  {25, 0, 2230},
  {26, 0, 2270},
  {27, 0, 2310},
  {28, 0, 2350},
  {29, 0, 2380},
  {30, 0, 2420},
  {31, 0, 2460},
  {32, 0, 2500},
  {33, 0, 2530},
  {34, 0, 2570},
  {35, 0, 2610},
  {36, 0, 2650},
  {37, 0, 2680},
  {38, 0, 2720},
  {39, 0, 2760},
  {40, 0, 2800},
  {41, 0, 2830},
  {42, 0, 2870},
  {43, 0, 2910},
  {44, 0, 2950},
  {45, 0, 2980},
  {46, 0, 3020},
  {47, 0, 3060},
  {48, 0, 3090},
  {49, 0, 3130},
  {50, 0, 3170},
  {51, 0, 3200},
  {52, 0, 3240},
  {53, 0, 3280},
  {54, 0, 3320},
  {55, 0, 3360},
  {56, 0, 3390},
  {57, 0, 3430},
  {58, 0, 3470},
  {59, 0, 3500},
  {60, 0, 3540},
  {61, 0, 3580},
  {62, 0, 3610},
  {63, 0, 3650},
  {64, 0, 3690},
  {65, 0, 3720},
  {66, 0, 3760},
  {67, 0, 3800},
  {68, 0, 3830},
  {69, 0, 3870},
  {70, 0, 3910},
  {71, 0, 3950},
  {72, 0, 3980},
  {73, 0, 4020},
  {74, 0, 4060},
  {75, 0, 4090},
  {76, 0, 4130},
  {77, 0, 4170},
  {78, 0, 4200},
  {79, 0, 4240},
  {80, 0, 4280},
  {81, 0, 4310},
  {82, 0, 4350},
  {83, 0, 4390},
  {84, 0, 4420},
  {85, 0, 4460},
  {86, 0, 4500},
  {87, 0, 4530},
  {88, 0, 4570},
  {89, 0, 4610},
  {90, 0, 4640},
  {91, 0, 4680},
  {92, 0, 4720},
  {93, 0, 4750},
  {94, 0, 4790},
  {95, 0, 4820},
  {96, 0, 4860},
  {97, 0, 4900},
  {98, 0, 4930},
  {99, 0, 4970},
  {100, 0, 5000},
  {101, 0, 5040},
  {102, 0, 5080},
  {103, 0, 5110},
  {104, 0, 5150},
  {105, 0, 5180},
  {106, 0, 5220},
  {107, 0, 5250},
  {108, 0, 5290},
  {109, 0, 5320},
  {110, 0, 5360},
  {111, 0, 5400},
  {112, 0, 5430},
  {113, 0, 5460},
  {114, 0, 5500},
  {115, 0, 5530},
  {116, 0, 5570},
  {117, 0, 5600},
  {118, 0, 5640},
  {119, 0, 5670},
  {120, 0, 5710},
  {121, 0, 5740},
  {122, 0, 5780},
  {123, 0, 5810},
  {124, 0, 5850},
  {125, 0, 5880},
  {126, 0, 5910},
  {127, 0, 5950},
  {127, 1, 5990},
  {127, 2, 6020},
  {127, 3, 6050},
  {127, 4, 6090},
  {127, 5, 6120},
  {127, 6, 6160},
  {127, 7, 6190},
  {127, 8, 6220},
  {127, 9, 6250},
  {127, 10, 6290},
  {127, 11, 6320},
  {127, 12, 6350},
  {127, 13, 6380},
  {127, 14, 6420},
  {127, 15, 6450},
  {127, 16, 6480},
  {127, 17, 6510},
  {127, 18, 6540},
  {127, 19, 6570},
  {127, 20, 6610},
  {127, 21, 6640},
  {127, 22, 6670},
  {127, 23, 6700},
  {127, 24, 6720},
  {127, 25, 6760},
  {127, 26, 6790},
  {127, 27, 6810},
  {127, 28, 6850},
  {127, 29, 6880},
  {127, 30, 6910},
  {127, 31, 6940},
  {127, 32, 6960},
  {127, 33, 6990},
  {127, 34, 7020},
  {127, 35, 7050},
  {127, 36, 7080},
  {127, 37, 7110},
  {127, 38, 7140},
  {127, 39, 7160},
  {127, 40, 7190},
  {127, 41, 7220},
  {127, 42, 7240},
  {127, 43, 7270},
  {127, 44, 7300},
  {127, 45, 7330},
  {127, 46, 7350},
  {127, 47, 7380},
  {127, 48, 7400},
  {127, 49, 7430},
  {127, 50, 7450},
  {127, 51, 7480},
  {127, 52, 7510},
  {127, 53, 7530},
  {127, 54, 7560},
  {127, 55, 7580},
  {127, 56, 7600},
  {127, 57, 7630},
  {127, 58, 7650},
  {127, 59, 7670},
  {127, 60, 7700},
  {127, 61, 7720},
  {127, 62, 7750},
  {127, 63, 7770},
  {127, 64, 7790},
  {127, 65, 7810},
  {127, 66, 7840},
  {127, 67, 7860},
  {127, 68, 7880},
  {127, 69, 7900},
  {127, 70, 7920},
  {127, 71, 7950},
  {127, 72, 7970},
  {127, 73, 7990},
  {127, 74, 8010},
  {127, 75, 8030},
  {127, 76, 8050},
  {127, 77, 8070},
  {127, 78, 8090},
  {127, 79, 8110},
  {127, 80, 8130},
  {127, 81, 8150},
  {127, 82, 8170},
  {127, 83, 8190},
  {127, 84, 8210},
  {127, 85, 8230},
  {127, 86, 8250},
  {127, 87, 8270},
  {127, 88, 8290},
  {127, 89, 8310},
  {127, 90, 8320},
  {127, 91, 8340},
  {127, 92, 8360},
  {127, 93, 8380},
  {127, 94, 8400},
  {127, 95, 8410},
  {127, 96, 8430},
  {127, 97, 8450},
  {127, 98, 8470},
  {127, 99, 8480},
  {127, 100, 8500},
  {127, 101, 8520},
  {127, 102, 8530},
  {127, 103, 8550},
  {127, 104, 8570},
  {127, 105, 8590},
  {127, 106, 8600},
  {127, 107, 8620},
  {127, 108, 8630},
  {127, 109, 8650},
  {127, 110, 8660},
  {127, 111, 8680},
  {127, 112, 8690},
  {127, 113, 8710},
  {127, 114, 8720},
  {127, 115, 8740},
  {127, 116, 8750},
  {127, 117, 8770},
  {127, 118, 8780},
  {127, 119, 8800},
  {127, 120, 8810},
  {127, 121, 8820},
  {127, 122, 8840},
  {127, 123, 8850},
  {127, 124, 8870},
  {127, 125, 8880},
  {127, 126, 8890},
  {127, 127, 8910}
};

/////////////////////////////////////////////////////////////////////
// MODULE FUNCTIONS

// Gets the current time in milliseconds since last power on
static unsigned long GetTime
  (
  void
  )
{
  return millis();
}

// Checks if a timestamp is in the past, handles 32-bit timer overflow
static uint8_t IsTimeExpired
  (
  unsigned long timestamp            // timestamp to check
  )
{
  unsigned long time_now;

  time_now = millis();
  if (time_now >= timestamp)
  {
    if ((time_now - timestamp) < 0x80000000)
      return 1;
    else
      return 0;
  }
  else
  {
    if ((timestamp - time_now) >= 0x80000000)
      return 1;
    else
      return 0;
  }
}

// interrupt that handles the pulse generation
// called once per millisecond
static void PulseGenerator_Handler
  (
  void  
  )
{
  if (PGCounter == G1On)  TRIGGERGROUP1_LOW;
  if (PGCounter == G1Off) TRIGGERGROUP1_HIGH;
  if (PGCounter == G2On)  TRIGGERGROUP2_LOW;
  if (PGCounter == G2Off) TRIGGERGROUP2_HIGH;
  if (PGCounter == G3On)  TRIGGERGROUP3_LOW;
  if (PGCounter == G3Off) TRIGGERGROUP3_HIGH;
  if (PGCounter == G4On)  TRIGGERGROUP4_LOW;
  if (PGCounter == G4Off) TRIGGERGROUP4_HIGH;

  if (++PGCounter >= FiringPeriod)
  {
    PGCounter = 0;
  }

  // restart
  Timer1.setPeriod(PG_TIMER_PERIOD_US);
  Timer1.attachInterrupt(PulseGenerator_Handler);
}

// updates the triggers for the pulse generator waveforms
// based on a specific engine speed and pulse angle
static void UpdatePulseGeneratorTriggers
  (
  int EngineSpeed,                                         // RPM
  int PulseAngle                                           // degrees of distributor rotation
  )
{
  float RotationsPerSec = EngineSpeed / 60.0F;
  float FiringCyclesPerSec = RotationsPerSec / 2;
  
  FiringPeriod = 1 / FiringCyclesPerSec * 1000.0F;

  float DutyCycle = PulseAngle * 2.0F / 720.0F;
  float PulseLength = FiringPeriod * DutyCycle;

  // get group starts, 90 degrees out of phase
  float Group1Start = 0.0F;
  float Group2Start = FiringPeriod * 0.25F;
  float Group3Start = FiringPeriod * 0.5F;
  float Group4Start = FiringPeriod * 0.75F;

  float Group1End = Group1Start + PulseLength;
  if (Group1End > FiringPeriod) Group1End -= FiringPeriod;
  float Group2End = Group2Start + PulseLength;
  if (Group2End > FiringPeriod) Group2End -= FiringPeriod;
  float Group3End = Group3Start + PulseLength;
  if (Group3End > FiringPeriod) Group3End -= FiringPeriod;
  float Group4End = Group4Start + PulseLength;
  if (Group4End > FiringPeriod) Group4End -= FiringPeriod;

  G1On = Group1Start;
  G1Off = Group1End;
  G2On = Group2Start;
  G2Off = Group2End;
  G3On = Group3Start;
  G3Off = Group3End;
  G4On = Group4Start;
  G4Off = Group4End;
}

// generates idle and WOT switch states
static void UpdateThrottleSwitches
  (
  int ThrottlePos                                          // throttle position 0% -> 100%
  )
{
  // idle switch
  if (ThrottlePos <= 2)
  {
    TPS_IDLE;
  }
  else
  {
    TPS_NOTIDLE;
  }

  // wide open throttle switch
  if (ThrottlePos >= 81)
  {
    TPS_WOT;
  }
  else
  {
    TPS_NOTWOT;
  }
}

// generates throttle enrichment pulses
// https://www.sw-em.com/bosch_d-jetronic_injection.htm#reference_information_tps
static void UpdateThrottleEnrichment
  (
  int ThrottlePos                                          // throttle position 0% -> 100%
  )
{
  // adjust throttle position for calculation, avoids the need for floating point
  int T10 = ThrottlePos * 10;
  if (T10 < 0)    T10 = 0;
  if (T10 > 1000) T10 = 1000;

  // search for current enrichment setting
  int NumEnrichmentPos = sizeof(Enrichment) / sizeof(enrichment_t);
  for (int e = 0; e < NumEnrichmentPos; e++)
  {
    if ((T10 >= Enrichment[e].ThrottleLow) && (T10 <= Enrichment[e].ThrottleHigh))
    {
      if (Enrichment[e].Accel1State == ASSERT)
      {
        TPS_ACCEL1_ASSERT;
      }
      else
      {
        TPS_ACCEL1_DEASSERT;
      }

      if (Enrichment[e].Accel2State == ASSERT)
      {
        TPS_ACCEL2_ASSERT;
      }
      else
      {
        TPS_ACCEL2_DEASSERT;
      }

      break;
    }
  }
}

// gets the wiper value for a resistance for air temperature
// by using a lookup table
static void GetAirWiperForResistance
  (
  const airpotvalue_t *Table,        // lookup table,
  int NumTableEntries,               // number of entries in table
  uint16_t Resistance,               // resistance in ohms
  int *pWiper                        // filled with wiper value
  )
{
  int t;
  airpotvalue_t TableEntry;

  *pWiper = -1;

  Serial_printf("Getting air wiper for resistance=%d", Resistance);

  // smaller than the lowest value so use the lowest value
  memcpy_P(&TableEntry, &Table[0], sizeof(airpotvalue_t));
  if (Resistance <= TableEntry.Resistance)
  {
    *pWiper = TableEntry.Wiper;
    Serial_printf("Matched R=%d", TableEntry.Resistance);
    return;
  }

  // search table
  for (t = 0; t < NumTableEntries; t++)
  {
    memcpy_P(&TableEntry, &Table[t], sizeof(airpotvalue_t));
    if (Resistance <= TableEntry.Resistance)
    {
      *pWiper = TableEntry.Wiper;
      Serial_printf("Matched R=%d", TableEntry.Resistance);
      return;
    }
  }
      
  // not found in table so must be larger than the largest value
  // so use the largest value
  if (*pWiper == -1)
  {
    memcpy_P(&TableEntry, &Table[NumTableEntries - 1], sizeof(airpotvalue_t));
    *pWiper = TableEntry.Wiper;
    Serial_printf("Matched R=%d", TableEntry.Resistance);
  }
}

// gets the wiper value for a resistance for coolant temperature
// by using a lookup table
static void GetCoolantWiperForResistance
  (
  const coolantpotvalue_t *Table,    // lookup table,
  int NumTableEntries,               // number of entries in table
  uint16_t Resistance,               // resistance in ohms
  int *pWiper1,                      // filled with wiper 1 value
  int *pWiper2                       // filled with wiper 1 value
  )
{
  int t;
  coolantpotvalue_t TableEntry;

  *pWiper1 = *pWiper2 = -1;

  Serial_printf("Getting coolant wipers for resistance=%d", Resistance);

  Serial_printf("Lowest R=%d NumTableEntries=%d", Table[0].Resistance, NumTableEntries);

  // smaller than the lowest value so use the lowest value
  memcpy_P(&TableEntry, &Table[0], sizeof(coolantpotvalue_t));
  if (Resistance <= TableEntry.Resistance)
  {
    Serial_printf("%d <= %d", Resistance, TableEntry.Resistance);
    *pWiper1 = TableEntry.Wiper1;
    *pWiper2 = TableEntry.Wiper2;
    Serial_printf("Matched R=%d (0)", TableEntry.Resistance);
    return;
  }

  // search table
  for (t = 0; t < NumTableEntries; t++)
  {
    memcpy_P(&TableEntry, &Table[t], sizeof(coolantpotvalue_t));
    if (Resistance <= TableEntry.Resistance)
    {
      //Serial_printf("%d", Table[t].Resistance);
      //Serial_printf("%d", Table[t].Resistance);
      Serial_printf("%d <= %d", Resistance, TableEntry.Resistance);
      *pWiper1 = TableEntry.Wiper1;
      *pWiper2 = TableEntry.Wiper2;
      Serial_printf("Matched R=%d (%d) Wiper1=%d Wiper2=%d", TableEntry.Resistance, t, *pWiper1, *pWiper2);
      return;
    }
  }
      
  // not found in table so must be larger than the largest value
  // so use the largest value
  if (*pWiper1 == -1)
  {
    Serial_printf("No match, use largest value");
    memcpy_P(&TableEntry, &Table[NumTableEntries - 1], sizeof(coolantpotvalue_t));
    *pWiper1 = TableEntry.Wiper1;
    *pWiper2 = TableEntry.Wiper2;
    Serial_printf("Matched R=%d (%d)", TableEntry.Resistance, NumTableEntries - 1);
  }
}

/////////////////////////////////////////////////////////////////////
// PUBLIC FUNCTIONS

// set new engine parameters
void Engine_Set
  (
  int EngineSpeed,                                         // new speed in RPM
  int CoolantTempF,                                        // new coolant temperature in F
  int ThrottlePosition,                                    // new throttle position 0% -> 100%
  int Pressure                                             // new manifold pressure
  )
{
  Engine_SetEngineSpeed(EngineSpeed);
  Engine_SetCoolantTempF(CoolantTempF);
  Engine_SetThrottle(ThrottlePosition);
  Engine_SetManifoldPressure(Pressure);
}

// get current engine parameters
void Engine_Get
  (
  int *pEngineSpeed,                                       // speed in RPM
  int *pCoolantTempF,                                      // coolant temperature in F
  int *pThrottlePosition,                                  // throttle position 0% -> 100%
  throttledirection_t *pThrottleDirection,                 // throttle direction
  int *pPressure,                                          // manifold pressure
  int *pAirTempF,                                          // air temperature
  int *pPulseAngle                                         // pulse angle for pulse generator in degrees
  )
{
  *pEngineSpeed       = EngineSpeed;
  *pCoolantTempF      = CoolantTempF;
  *pThrottlePosition  = ThrottlePosition;
  *pThrottleDirection = ThrottleDirection;
  *pPressure          = Pressure;
  *pAirTempF          = AirTempF;
  *pPulseAngle        = PulseAngle;
}

// sets the pulse generator pulse angle in degrees of distributor rotation
void Engine_SetPulseAngle
  (
  int NewPulseAngle                                        // degrees of rotation
  )
{
  PulseAngle = NewPulseAngle;
  if (PulseAngle < MIN_PULSEANGLE) PulseAngle = MIN_PULSEANGLE;
  if (PulseAngle > MAX_PULSEANGLE) PulseAngle = MAX_PULSEANGLE;

  // update calculations for pulse generation
  Engine_SetEngineSpeed(EngineSpeed);
}

// sets the engine speed
void Engine_SetEngineSpeed
  (
  int NewSpeed                                             // new speed in RPM
  )
{
  // stop pulse generation
  Timer1.stop();
  TRIGGERGROUP1_HIGH;
  TRIGGERGROUP2_HIGH;
  TRIGGERGROUP3_HIGH;
  TRIGGERGROUP4_HIGH;

  EngineSpeed = NewSpeed;

  if (EngineSpeed > 0)
  {
    UpdatePulseGeneratorTriggers(EngineSpeed, PulseAngle);

    // restart pulse generation
    PGCounter = 0;
    Timer1.setPeriod(PG_TIMER_PERIOD_US);
    Timer1.start();
  }
}

// test function for debugging
void Engine_Test
  (
  void
  )
{
  static int call = 0;
  byte b;

  b = IOExpander.getPullup();
  Serial_printf("pu=%2.2X", b);

  switch (call)
  {
    case 0:
      TPS_NOTWOT;
      TPS_NOTIDLE;
      TPS_ACCEL1_DEASSERT;
      TPS_ACCEL2_DEASSERT;
      Serial_printf("WOT low, idle low, ac1 low, ac2 low");
      break;

    case 1:
      TPS_WOT;
      Serial_printf("WOT high");
      break;

    case 2:
      TPS_IDLE;
      Serial_printf("Idle high");
      break;

    case 3:
      TPS_ACCEL1_ASSERT;
      Serial_printf("Ac1 high");
      break;

    case 4:
      TPS_ACCEL2_ASSERT;
      Serial_printf("Ac2 high");
      break; 
  }

   call++;
}

// sets the air temperature
void Engine_SetAirTempF
  (
  int NewAirTempF                                          // new air temperature in F
  )
{
  int Wiper = -1;

  if (NewAirTempF < MIN_AIRTEMPF) NewAirTempF = MIN_AIRTEMPF;
  if (NewAirTempF > MAX_AIRTEMPF) NewAirTempF = MAX_AIRTEMPF;

  AirTempF = NewAirTempF;

  Serial_printf("airtemp=%d", AirTempF);

  int R = AirTempSensor_GetResistance(AirTempF);

  Serial_printf("Calc R = %d", R);

  GetAirWiperForResistance(AirTempTable, sizeof(AirTempTable) / sizeof(airpotvalue_t), R, &Wiper);

  Serial_printf("Wiper=%d", Wiper);

  AirTempPot->set(Wiper);
}

// sets the coolant temperature 
void Engine_SetCoolantTempF
  (
  int NewCoolantTempF                                      // new coolant temperature in F
  )
{
  int Wiper1;
  int Wiper2;
  int R;

  if (NewCoolantTempF < MIN_COOLANTTEMPF) NewCoolantTempF = MIN_COOLANTTEMPF;
  if (NewCoolantTempF > MAX_COOLANTTEMPF) NewCoolantTempF = MAX_COOLANTTEMPF;

  CoolantTempF = NewCoolantTempF;

  Serial_printf("coolanttemp=%d", CoolantTempF);

  R = CoolantTempSensor_GetResistance(CoolantTempF);

  Serial_printf("Calc R = %d", R);

  GetCoolantWiperForResistance(CoolantTempTable, sizeof(CoolantTempTable) / sizeof(coolantpotvalue_t), R, &Wiper1, &Wiper2);

  Serial_printf("Wiper1=%d Wiper2=%d", Wiper1, Wiper2);

  CoolantTempPot1->set(Wiper1);
  CoolantTempPot2->set(Wiper2);
}

// sets the throttle position and direction
void Engine_SetThrottle
  (
  int NewThrottlePosition                                  // new throttle position 0% -> 100%
  )
{
  int Throttle;
  unsigned long Timestamp;

  // if no change in throttle
  if (NewThrottlePosition == ThrottlePosition)
  {
    // special case - if no throttle then always go back to
    // starting enrichment state
    if (NewThrottlePosition == 0)
    {
      UpdateThrottleEnrichment(NewThrottlePosition);
    }

    UpdateThrottleSwitches(NewThrottlePosition);
    return;
  }

  // work out direction of throttle movement
  if (NewThrottlePosition > ThrottlePosition)
  {
    ThrottleDirection = THROTTLE_ACCELERATING;
  }
  else
  {
    ThrottleDirection = THROTTLE_DECELERATING;
  }

  if (ThrottleDirection == THROTTLE_ACCELERATING)
  {
    // increase throttle 1% at a time to generate all of the enrichment pulses
    for (Throttle = ThrottlePosition; Throttle <= NewThrottlePosition; Throttle++)
    {
      UpdateThrottleSwitches(Throttle);
      UpdateThrottleEnrichment(Throttle);

      Timestamp = GetTime();
      while (!IsTimeExpired(Timestamp + THROTTLE_STEP_TIME_MS))
      {
        Serial_Process();
      }

      Serial_SendThrottle(Throttle);
      Serial_Process();
    }
  }
  else
  {
    // no pulses when decelerating
    TPS_ACCEL1_DEASSERT;
    TPS_ACCEL2_DEASSERT;

    UpdateThrottleSwitches(NewThrottlePosition);

    // back to starting condition for enrichment
    if (NewThrottlePosition == 0)
    {
      UpdateThrottleEnrichment(NewThrottlePosition);
    }
  }

  ThrottlePosition = NewThrottlePosition;
}

// sets the new pressure level from the manifold
void Engine_SetManifoldPressure
  (
  int NewPressure                                          // new pressure level in inHg
  )
{
   Pressure = NewPressure;
}

// sets the engine to cold idle state
void Engine_ColdIdle
  (
  void  
  )
{
  Engine_Set(1200, DEFAULT_AIRTEMPF, 0, 15);
}

// sets the engine to hot idle state
void Engine_HotIdle
  (
  void  
  )
{
  Engine_Set(700, 185, 0, 15);
}

// sets the engine to cruising at 30 MPH
void Engine_Cruise30MPH
  (
  void  
  )
{

  Engine_Set(1400, 185, 17, 11);
}

// sets the engine to cruising at 70 MPH
void Engine_Cruise70MPH
  (
  void  
  )
{
  Engine_Set(3000, 185, 25, 11);
}

// sets the engine to gentle acceleration
void Engine_GentleAcceleration
  (
  void  
  )
{
  Engine_Set(1800, 185, 30, 9);
}

// sets the engine to moderate acceleration
void Engine_ModerateAcceleration
  (
  void  
  )
{
  Engine_Set(3500, 185, 50, 7);
}

// sets the engine to hard acceleration
void Engine_HardAcceleration
  (
  void  
  )
{
  Engine_Set(6000, 185, 95, 2);
}

// turns the engine off
void Engine_Off
  (
  void  
  )
{
  Engine_Set(0, DEFAULT_AIRTEMPF, 0, 0);
}

// sets the engine to cranking
void Engine_Cranking
  (
  int EngineSpeed                                          // new speed in RPM
  )
{
  Engine_Set(EngineSpeed, DEFAULT_AIRTEMPF, 0, 0);
}

// initializes engine simulation
void Engine_Init
   (
   void
   )
{
  // set up outputs
  pinMode(PIN_STATUS_LED,    OUTPUT);
  STATUS_LED_OFF;
  DIR_TRIGGERGROUP1 |= (1 << PIN_TRIGGERGROUP1);
  TRIGGERGROUP1_HIGH;
  DIR_TRIGGERGROUP2 |= (1 << PIN_TRIGGERGROUP2);
  TRIGGERGROUP2_HIGH;
  DIR_TRIGGERGROUP3 |= (1 << PIN_TRIGGERGROUP3);
  TRIGGERGROUP3_HIGH;
  DIR_TRIGGERGROUP4 |= (1 << PIN_TRIGGERGROUP4);
  TRIGGERGROUP4_HIGH;
  //pinMode(PIN_TPSWOT,        OUTPUT);
  //TPS_NOTWOT;
  //pinMode(PIN_TPSIDLE,       OUTPUT);
  //TPS_NOTIDLE;
  //pinMode(PIN_TPSACCEL1,     OUTPUT);
  //TPS_ACCEL1_DEASSERT;
  //pinMode(PIN_TPSACCEL2,     OUTPUT);
  //TPS_ACCEL2_DEASSERT;
  pinMode(PIN_AIRTEMPCS,     OUTPUT);
  AIRTEMPCS_DEASSERT;
  pinMode(PIN_COOLANTTEMPCS1, OUTPUT);
  COOLANTTEMPCS1_DEASSERT;
  pinMode(PIN_COOLANTTEMPCS2, OUTPUT);
  COOLANTTEMPCS2_DEASSERT;
  pinMode(PIN_IOCS,           OUTPUT);
  IOCS_DEASSERT;

  AirTempSensor_Init();
  CoolantTempSensor_Init();

  AirTempPot      = new MCP4XXX(PIN_AIRTEMPCS, icecave::arduino::MCP4XXX::pot_0, icecave::arduino::MCP4XXX::res_7bit);
  CoolantTempPot1 = new MCP4XXX(PIN_COOLANTTEMPCS1, icecave::arduino::MCP4XXX::pot_0, icecave::arduino::MCP4XXX::res_7bit);
  CoolantTempPot2 = new MCP4XXX(PIN_COOLANTTEMPCS2, icecave::arduino::MCP4XXX::pot_0, icecave::arduino::MCP4XXX::res_7bit);

  //IOExpander.begin();
  IOExpander.pinMode(PIN_TPSACCEL2, OUTPUT);
  IOExpander.pinMode(PIN_TPSACCEL1, OUTPUT);
  IOExpander.pinMode(PIN_TPSIDLE,   OUTPUT);
  IOExpander.pinMode(PIN_TPSWOT,    OUTPUT);
  IOExpander.pinMode(PIN_START,     INPUT);
  IOExpander.pinMode(PIN_FUELPUMP,  INPUT);
  IOExpander.setPullup((1 << PIN_TPSACCEL2) | (1 << PIN_TPSACCEL1) | (1 << PIN_TPSIDLE) | (1 << PIN_TPSWOT));

  // set up pulse generator
  Timer1.initialize(0);
  Timer1.attachInterrupt(PulseGenerator_Handler);
  Timer1.stop();

  PulseAngle = DEFAULT_PULSEANGLE;

  ThrottlePosition = 0;

  Engine_Off();
  Engine_SetAirTempF(DEFAULT_AIRTEMPF);

  LEDTimestamp = GetTime() + LED_FLASH_PERIOD_ENGINEOFF;
}

// call repeatedly to implement the engine simulation
void Engine_Process
  (
  void
  )
{
  // flash status LED to show we are alive
  if (IsTimeExpired(LEDTimestamp))
  {
    if (IS_STATUS_LED_ON)
    {
      STATUS_LED_OFF;
    }
    else
    {
      STATUS_LED_ON;
    }
    
    if (IS_ENGINE_ON)
    {
      LEDTimestamp = GetTime() + LED_FLASH_PERIOD_ENGINEON;
    }
    else
    {
      LEDTimestamp = GetTime() + LED_FLASH_PERIOD_ENGINEOFF;
    }
  }
}
