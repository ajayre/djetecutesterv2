// Mercedes V8 DJet Engine Simulator
// (C) andy@britishideas.com 2021-2022

#include <Arduino.h>
#include "Engine.h"
#include "AirTempSensor.h"
#include "CoolantTempSensor.h"
#include "arduino-mcp4xxx-master/mcp4xxx.h"
#include "TimerOne-master/TimerOne.h"

using namespace icecave::arduino;

// special value to indicate no manifold pressure required
#define NO_PRESSURE -1

// default air temperature at start of simulation
#define DEFAULT_AIRTEMPF 72

// default pulse generator pulse angle in degrees of distributor rotation
#define DEFAULT_PULSEANGLE 135

// pins
#define PIN_STATUS_LED    A3  // PC3
#define PIN_START         7   // PD7
#define PIN_TPSWOT        8   // PB0
#define PIN_TPSIDLE       A0  // PC0
#define PIN_TPSACCEL1     A2  // PC2
#define PIN_TPSACCEL2     A1  // PC1
#define PIN_VAC1          4   // PD4
#define PIN_VAC2          2   // PD2
#define PIN_AIRTEMPCS     A5  // PC5
#define PIN_COOLANTTEMPCS A4  // PC4

#define PORT_TRIGGERGROUP1 PORTB
#define PORT_TRIGGERGROUP2 PORTD
#define PORT_TRIGGERGROUP3 PORTD
#define PORT_TRIGGERGROUP4 PORTD

#define PIN_TRIGGERGROUP1 1
#define PIN_TRIGGERGROUP2 6
#define PIN_TRIGGERGROUP3 5
#define PIN_TRIGGERGROUP4 3

#define DIR_TRIGGERGROUP1 DDRB
#define DIR_TRIGGERGROUP2 DDRD
#define DIR_TRIGGERGROUP3 DDRD
#define DIR_TRIGGERGROUP4 DDRD

#define FALSE 0
#define TRUE  1

// IO macros
#define STATUS_LED_ON          digitalWrite(PIN_STATUS_LED, LOW)
#define STATUS_LED_OFF         digitalWrite(PIN_STATUS_LED, HIGH);
#define IS_STATUS_LED_ON       (digitalRead(PIN_STATUS_LED) == 1 ? FALSE : TRUE)

#define STARTING               digitalWrite(PIN_START, HIGH);
#define NOTSTARTING            digitalWrite(PIN_START, LOW);

#define TPS_WOT                digitalWrite(PIN_TPSWOT, HIGH);
#define TPS_NOTWOT             digitalWrite(PIN_TPSWOT, LOW);

#define TPS_IDLE               digitalWrite(PIN_TPSIDLE, HIGH);
#define TPS_NOTIDLE            digitalWrite(PIN_TPSIDLE, LOW);

#define TPS_ACCEL1_ASSERT      digitalWrite(PIN_TPSACCEL1, HIGH);
#define TPS_ACCEL1_DEASSERT    digitalWrite(PIN_TPSACCEL1, LOW);

#define TPS_ACCEL2_ASSERT      digitalWrite(PIN_TPSACCEL2, HIGH);
#define TPS_ACCEL2_DEASSERT    digitalWrite(PIN_TPSACCEL2, LOW);

#define VAC1_ASSERT            digitalWrite(PIN_VAC1, HIGH);
#define VAC1_DEASSERT          digitalWrite(PIN_VAC1, LOW);

#define VAC2_ASSERT            digitalWrite(PIN_VAC2, HIGH);
#define VAC2_DEASSERT          digitalWrite(PIN_VAC2, LOW);

#define AIRTEMPCS_DEASSERT     digitalWrite(PIN_AIRTEMPCS, HIGH);
#define COOLANTTEMPCS_DEASSERT digitalWrite(PIN_COOLANTTEMPCS, HIGH);

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

// resistance of wiper
// obtained by trial and error
#define DIGITAL_POT_WIPER_R_AIR     232
#define DIGITAL_POT_WIPER_R_COOLANT 233

// minimum and maximum resistance in ohms that the hardware can generate
// these values correspond to a wiper position of 0 -> max_value()-1
// and were obtained by measurement
// from the Steinhart-Hart spreadsheets:
// Air:     4960 Ohms = -46.3F, 248 Ohms = 77.5F
// Coolant: 4960 Ohms = 39F,    248 Ohms = 193F
// the corresponding temp ranges must be reflected in MIN_xxx_TEMP and
// MAX_xxx_TEMP in Menu.cpp
#define AIRTEMP_MIN_R     (248  - DIGITAL_POT_WIPER_R_AIR)
#define AIRTEMP_MAX_R     (4960 - DIGITAL_POT_WIPER_R_AIR)
#define COOLANTTEMP_MIN_R (248  - DIGITAL_POT_WIPER_R_COOLANT)
#define COOLANTTEMP_MAX_R (4960 - DIGITAL_POT_WIPER_R_COOLANT)

// number of bits of resolution for digital pot
#define DIGITAL_POT_RESOLUTION 256

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

// pulse generator trigger states for state machine
typedef enum _triggerstates { G1START, G1END, G2START, G2END, G3START, G3END, G4START, G4END } triggerstates_t;

static int EngineSpeed;                                    // RPM
static int AirTempF;
static int CoolantTempF;
static int ThrottlePosition;                               // %
static throttledirection_t ThrottleDirection;
static int Pressure;                                       // manifold, inHg
static bool Cranking;
// source: https://github.com/jmalloc/arduino-mcp4xxx
static MCP4XXX *AirTempPot;
static MCP4XXX *CoolantTempPot;
static int PulseAngle;
static unsigned long LEDTimestamp;
static float AirRperW;
static float CoolantRperW;
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
static enrichment_t Enrichment[] = {
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

/////////////////////////////////////////////////////////////////////
// PUBLIC FUNCTIONS

// set new engine parameters
void Engine_Set
  (
  int EngineSpeed,                                         // new speed in RPM
  int CoolantTempF,                                        // new coolant temperature in F
  int ThrottlePosition,                                    // new throttle position 0% -> 100%
  int Pressure,                                            // new manifold pressure
  bool Cranking                                            // new cranking state
  )
{
  Engine_SetEngineSpeed(EngineSpeed);
  Engine_SetCoolantTempF(CoolantTempF);
  Engine_SetThrottle(ThrottlePosition);
  Engine_SetManifoldPressure(Pressure);
  Engine_SetCranking(Cranking);
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
  bool *pCranking,                                         // cranking state
  int *pPulseAngle                                         // pulse angle for pulse generator in degrees
  )
{
  *pEngineSpeed       = EngineSpeed;
  *pCoolantTempF      = CoolantTempF;
  *pThrottlePosition  = ThrottlePosition;
  *pThrottleDirection = ThrottleDirection;
  *pPressure          = Pressure;
  *pAirTempF          = AirTempF;
  *pCranking          = Cranking;
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

// sets the air temperature
void Engine_SetAirTempF
  (
  int NewAirTempF                                          // new air temperature in F
  )
{
  if (NewAirTempF != AirTempF)
  {
    AirTempF = NewAirTempF;

    int R = AirTempSensor_GetResistance(AirTempF);
    if (R < AIRTEMP_MIN_R) R = AIRTEMP_MIN_R;
    if (R > AIRTEMP_MAX_R) R = AIRTEMP_MAX_R;

    R -= DIGITAL_POT_WIPER_R_AIR;

    int Wiper = (int)(R / AirRperW);
    if (Wiper > (DIGITAL_POT_RESOLUTION - 1)) Wiper = DIGITAL_POT_RESOLUTION - 1;
    if (Wiper < 0) Wiper = 0;

    AirTempPot->set(Wiper);
  }
}

// sets the coolant temperature 
void Engine_SetCoolantTempF
  (
  int NewCoolantTempF                                      // new coolant temperature in F
  )
{
  if (NewCoolantTempF != CoolantTempF)
  {
    CoolantTempF = NewCoolantTempF;

    int R = CoolantTempSensor_GetResistance(CoolantTempF);
    if (R < COOLANTTEMP_MIN_R) R = COOLANTTEMP_MIN_R;
    if (R > COOLANTTEMP_MAX_R) R = COOLANTTEMP_MAX_R;

    R -= DIGITAL_POT_WIPER_R_COOLANT;

    int Wiper = (int)(R / CoolantRperW);
    if (Wiper > (DIGITAL_POT_RESOLUTION - 1)) Wiper = DIGITAL_POT_RESOLUTION - 1;
    if (Wiper < 0) Wiper = 0;

    CoolantTempPot->set(Wiper);
  }
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
      while (!IsTimeExpired(Timestamp + THROTTLE_STEP_TIME_MS));
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
  if (NewPressure != NO_PRESSURE)
  {
    Serial.print(F("*** ACTION: MANUALLY SET PRESSURE TO "));
    Serial.print(NewPressure);
    Serial.println(F(" INHG ***"));
  }
  else if (NewPressure == 0)
  {
    Serial.println(F("*** ACTION: RELEASE ALL PRESSURE ***"));
  }

   Pressure = NewPressure;
}

// sets the cranking state
extern void Engine_SetCranking
  (
  bool NewCranking                                         // true if cranking
  )
{
  Cranking = NewCranking;

  if (Cranking)
  {
    STARTING;
  }
  else
  {
    NOTSTARTING;
  }
}

// sets the engine to cold idle state
void Engine_ColdIdle
  (
  void  
  )
{
  Engine_Set(1200, DEFAULT_AIRTEMPF, 0, 15, false);
}

// sets the engine to hot idle state
void Engine_HotIdle
  (
  void  
  )
{
  Engine_Set(700, 185, 0, 15, false);
}

// sets the engine to cruising at 30 MPH
void Engine_Cruise30MPH
  (
  void  
  )
{

  Engine_Set(1400, 185, 17, 11, false);
}

// sets the engine to cruising at 70 MPH
void Engine_Cruise70MPH
  (
  void  
  )
{
  Engine_Set(3000, 185, 25, 11, false);
}

// sets the engine to gentle acceleration
void Engine_GentleAcceleration
  (
  void  
  )
{
  Engine_Set(1800, 185, 30, 9, false);
}

// sets the engine to moderate acceleration
void Engine_ModerateAcceleration
  (
  void  
  )
{
  Engine_Set(3500, 185, 50, 7, false);
}

// sets the engine to hard acceleration
void Engine_HardAcceleration
  (
  void  
  )
{
  Engine_Set(6000, 185, 95, 2, false);
}

// turns the engine off
void Engine_Off
  (
  void  
  )
{
  Engine_Set(0, DEFAULT_AIRTEMPF, 0, NO_PRESSURE, false);
}

// sets the engine to cranking
void Engine_Cranking
  (
  int EngineSpeed                                          // new speed in RPM
  )
{
  Engine_Set(EngineSpeed, DEFAULT_AIRTEMPF, 0, NO_PRESSURE, true);
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
  pinMode(PIN_START,         OUTPUT);
  NOTSTARTING;
  DIR_TRIGGERGROUP1 |= (1 << PIN_TRIGGERGROUP1);
  TRIGGERGROUP1_HIGH;
  DIR_TRIGGERGROUP2 |= (1 << PIN_TRIGGERGROUP2);
  TRIGGERGROUP2_HIGH;
  DIR_TRIGGERGROUP3 |= (1 << PIN_TRIGGERGROUP3);
  TRIGGERGROUP3_HIGH;
  DIR_TRIGGERGROUP4 |= (1 << PIN_TRIGGERGROUP4);
  TRIGGERGROUP4_HIGH;
  pinMode(PIN_TPSWOT,        OUTPUT);
  TPS_NOTWOT;
  pinMode(PIN_TPSIDLE,       OUTPUT);
  TPS_NOTIDLE;
  pinMode(PIN_TPSACCEL1,     OUTPUT);
  TPS_ACCEL1_DEASSERT;
  pinMode(PIN_TPSACCEL2,     OUTPUT);
  TPS_ACCEL2_DEASSERT;
  pinMode(PIN_VAC1,          OUTPUT);
  VAC1_DEASSERT;
  pinMode(PIN_VAC2,          OUTPUT);
  VAC2_DEASSERT;
  pinMode(PIN_AIRTEMPCS,     OUTPUT);
  AIRTEMPCS_DEASSERT;
  pinMode(PIN_COOLANTTEMPCS, OUTPUT);
  COOLANTTEMPCS_DEASSERT;
 
  AirTempSensor_Init();
  CoolantTempSensor_Init();

  AirTempPot     = new MCP4XXX(PIN_AIRTEMPCS);
  CoolantTempPot = new MCP4XXX(PIN_COOLANTTEMPCS);

  // calculate ratio of resistance (Ohms) per step in wiper position
  AirRperW     = (AIRTEMP_MAX_R - AIRTEMP_MIN_R)         / (float)DIGITAL_POT_RESOLUTION;
  CoolantRperW = (COOLANTTEMP_MAX_R - COOLANTTEMP_MIN_R) / (float)DIGITAL_POT_RESOLUTION;

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
