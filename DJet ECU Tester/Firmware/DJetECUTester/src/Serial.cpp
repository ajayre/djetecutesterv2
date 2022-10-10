// Mercedes V8 DJet Engine Simulator
// (C) andy@britishideas.com 2021-2022

#include <Arduino.h>
#include <Firmata.h>
#include "Engine.h"
#include "Serial.h"

#define MAX_DEBUG_LINE_LENGTH 128

// sysex message identifiers
typedef enum _messageids_t
{
  RequestStatus = 0x01,
  EngineOff = 0x02,
  Cranking = 0x03,
  ColdIdle = 0x04,
  HotIdle = 0x05,
  Cruise30MPH = 0x06,
  Cruise70MPH = 0x07,
  GentleAcceleration = 0x08,
  ModerateAcceleration = 0x09,
  HardAcceleration = 0x0A,
  SetCoolantTemp = 0x0B,
  SetAirTemp = 0x0C,
  SetEngineSpeed = 0x0D,
  SetThrottle = 0x0E,
  SetPulseAngle = 0x0F,
  CurrentStatus = 0x10,
  EngineTest = 0x11,
  CurrentThrottle = 0x12,
  CurrentStartOutput = 0x13,
  CurrentFuelPumpOutput = 0x14,
  CurrentPulseWidths = 0x15
} messageids_t;

typedef struct _status_t
{
  uint32_t EngineSpeed;
  int32_t CoolantTemperature;
  int32_t AirTemperature;
  uint32_t Throttle;
  uint32_t PulseAngle;
  uint32_t FuelPumpOn;
  uint32_t ColdStartOn;
  uint32_t PulseWidth_I;
  uint32_t PulseWidth_II;
  uint32_t PulseWidth_III;
  uint32_t PulseWidth_IV;
  uint32_t Pressure;
} status_t __attribute__ ((aligned (1)));

// called when a sysex message is received
// processes the message
static void sysexCallback(byte command, byte argc, byte *argv)
{
  int Temp;
  int Throttle;
  int Speed;
  int Angle;

  switch (command)
  {
    case EngineTest:
      Engine_Test();
      break;

    case RequestStatus:
      Serial_SendStatus();
      break;

    case SetCoolantTemp:
      Temp = (int)(argv[0] | ((int)argv[1] << 8));
      Engine_SetCoolantTempF(Temp);
      Serial_printf("Set coolant temp to %d F", Temp);
      Serial_SendStatus();
      break;

    case SetAirTemp:
      Temp = (int)(argv[0] | ((int)argv[1] << 8));
      Engine_SetAirTempF(Temp);
      Serial_printf("Set air temp to %d F", Temp);
      Serial_SendStatus();
      break;

    case SetThrottle:
      Throttle = argv[0] | ((int)argv[1] << 8);
      Engine_SetThrottle(Throttle);
      Serial_printf("Set throttle to %d", Throttle);
      Serial_SendStatus();
      break;

    case SetEngineSpeed:
      Speed = argv[0] | ((int)argv[1] << 8);
      Engine_SetEngineSpeed(Speed);
      Serial_printf("Set engine speed to %d RPM", Speed);
      Serial_SendStatus();
      break;

    case SetPulseAngle:
      Angle = argv[0];
      Engine_SetPulseAngle(Angle);
      Serial_printf("Set pulse dwell angle to %d deg", Angle);
      Serial_SendStatus();
      break;
    
    case EngineOff:
      Engine_Off();
      Serial_printf("Turned engine off");
      Serial_SendStatus();
      break;

    case Cranking:
      Engine_Cranking(300);
      Serial_printf("Engine cranking at 300RPM");
      Serial_SendStatus();
      break;

    case ColdIdle:
      Engine_ColdIdle();
      Serial_printf("Cold idle");
      Serial_SendStatus();
      break;

    case HotIdle:
      Engine_HotIdle();
      Serial_printf("Hot idle");
      Serial_SendStatus();
      break;

    case Cruise30MPH:
      Engine_Cruise30MPH();
      Serial_printf("Cruise at 30MPH");
      Serial_SendStatus();
      break;

    case Cruise70MPH:
      Engine_Cruise70MPH();
      Serial_printf("Cruise at 70MPH");
      Serial_SendStatus();
      break;

    case GentleAcceleration:
      Engine_GentleAcceleration();
      Serial_printf("Gentle acceleration");
      Serial_SendStatus();
      break;

    case ModerateAcceleration:
      Engine_ModerateAcceleration();
      Serial_printf("Moderate acceleration");
      Serial_SendStatus();
      break;

    case HardAcceleration:
      Engine_HardAcceleration();
      Serial_printf("Hard acceleration");
      Serial_SendStatus();
      break;
  }

  Firmata.sendSysex(command, argc, argv);
}

// sends the current status
static void SendStatus
  (
  int EngineSpeed,
  int CoolantTemp,
  int ThrottlePos,
  throttledirection_t ThrottleDirection,
  int Pressure,
  int AirTemp,
  int PulseAngle
  )
{
  status_t Status;

  Status.AirTemperature = AirTemp;
  Status.CoolantTemperature = CoolantTemp;
  Status.EngineSpeed = EngineSpeed;
  Status.PulseAngle = PulseAngle;
  Status.Throttle = ThrottlePos;
  Status.ColdStartOn = 0;
  Status.FuelPumpOn = 0;
  Status.PulseWidth_I = 0;
  Status.PulseWidth_II = 0;
  Status.PulseWidth_III = 0;
  Status.PulseWidth_IV = 0;
  Status.Pressure = Pressure;
  Firmata.sendSysex(CurrentStatus, sizeof(status_t), (byte *)&Status);
}

/////////////////////////////////////////////////////////////////////
// PUBLIC FUNCTIONS

// func: debug_printf
// desc: outputs a debug line and has the same prototype as printf
int Serial_printf
  (
  char const *format,
  ...
  )
{
  va_list args;
  int charswritten = 0;
  char line[MAX_DEBUG_LINE_LENGTH];

  // construct line
  va_start(args, format);
  charswritten = vsnprintf(line, MAX_DEBUG_LINE_LENGTH, format, args);
  va_end(args);

  Firmata.sendString(line);

  return charswritten;
}

// initializes the module
void Serial_Init
  (
  int FirmwareMajorVersion,
  int FirmwareMinorVersion
  )
{
  Firmata.setFirmwareVersion(FirmwareMajorVersion, FirmwareMinorVersion);
  //Firmata.attach(STRING_DATA, stringCallback);
  Firmata.attach(START_SYSEX, sysexCallback);
  Firmata.begin(57600);
}

// operates module
void Serial_Process
  (
  void
  )
{
  while (Firmata.available())
  {
    Firmata.processInput();
  }
}

// sends the throttle status
void Serial_SendThrottle
  (
  int Throttle   // throttle position as a percentage
  )
{
  byte Buffer[1];

  Buffer[0] = Throttle & 0xFF;
  Firmata.sendSysex(CurrentThrottle, 1, Buffer);
}

// sends the start output state
void Serial_SendStartOutput
  (
  bool StartOutput   // start output, high = on
  )
{
  byte Buffer[1];

  Buffer[0] = (byte)StartOutput & 0xFF;
  Firmata.sendSysex(CurrentStartOutput, 1, Buffer);
}

// sends the fuel pump output state
void Serial_SendFuelPumpOutput
  (
  bool FuelPumpOutput   // fuel pump output, high = on
  )
{
  byte Buffer[1];

  Buffer[0] = (byte)FuelPumpOutput & 0xFF;
  Firmata.sendSysex(CurrentFuelPumpOutput, 1, Buffer);
}

// sends the latest pulse width measurements
void Serial_SendPulseWidths2
  (
  uint32_t Width_I,    // pulse width in us, group I
  uint32_t Width_II,   // pulse width in us, group II
  uint32_t Width_III,  // pulse width in us, group III
  uint32_t Width_IV    // pulse width in us, group IV
  )
{
  byte Buffer[16];

  Buffer[0] = Width_I & 0xFF;
  Buffer[1] = (Width_I >> 8) & 0xFF;
  Buffer[2] = (Width_I >> 16) & 0xFF;
  Buffer[3] = (Width_I >> 24) & 0xFF;

  Buffer[4] = Width_II & 0xFF;
  Buffer[5] = (Width_II >> 8) & 0xFF;
  Buffer[6] = (Width_II >> 16) & 0xFF;
  Buffer[7] = (Width_II >> 24) & 0xFF;

  Buffer[8] = Width_III & 0xFF;
  Buffer[9] = (Width_III >> 8) & 0xFF;
  Buffer[10] = (Width_III >> 16) & 0xFF;
  Buffer[11] = (Width_III >> 24) & 0xFF;

  Buffer[12] = Width_IV & 0xFF;
  Buffer[13] = (Width_IV >> 8) & 0xFF;
  Buffer[14] = (Width_IV >> 16) & 0xFF;
  Buffer[15] = (Width_IV >> 24) & 0xFF;

  Firmata.sendSysex(CurrentPulseWidths, 16, Buffer);
}

// sends the current status
void Serial_SendStatus
  (
  void  
  )
{
  int EngineSpeed;
  int CoolantTemp;
  int ThrottlePos;
  throttledirection_t ThrottleDirection;
  int Pressure;
  int AirTemp;
  int PulseAngle;

  Engine_Get(&EngineSpeed, &CoolantTemp, &ThrottlePos, &ThrottleDirection, &Pressure,
    &AirTemp, &PulseAngle);

  SendStatus(EngineSpeed, CoolantTemp, ThrottlePos, ThrottleDirection, Pressure,
    AirTemp, PulseAngle);
}
