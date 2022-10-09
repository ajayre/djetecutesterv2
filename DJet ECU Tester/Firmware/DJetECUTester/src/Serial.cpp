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
  EngineTest = 0x11
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
  uint32_t Cranking;
  uint32_t PulseWidth_I;
  uint32_t PulseWidth_II;
  uint32_t PulseWidth_III;
  uint32_t PulseWidth_IV;
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
  bool Cranking,
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
  Status.Cranking = Cranking ? 1 : 0;
  Status.PulseWidth_I = 0;
  Status.PulseWidth_II = 0;
  Status.PulseWidth_III = 0;
  Status.PulseWidth_IV = 0;
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
  status_t Status;
  int EngineSpeed;
  int CoolantTemp;
  int ThrottlePos;
  throttledirection_t ThrottleDirection;
  int Pressure;
  int AirTemp;
  bool Cranking;
  int PulseAngle;

  Engine_Get(&EngineSpeed, &CoolantTemp, &ThrottlePos, &ThrottleDirection, &Pressure,
    &AirTemp, &Cranking, &PulseAngle);

  SendStatus(EngineSpeed, CoolantTemp, Throttle, ThrottleDirection, Pressure,
    AirTemp, Cranking, PulseAngle);
}

// sends the current status
void Serial_SendStatus
  (
  void  
  )
{
  status_t Status;
  int EngineSpeed;
  int CoolantTemp;
  int ThrottlePos;
  throttledirection_t ThrottleDirection;
  int Pressure;
  int AirTemp;
  bool Cranking;
  int PulseAngle;

  Engine_Get(&EngineSpeed, &CoolantTemp, &ThrottlePos, &ThrottleDirection, &Pressure,
    &AirTemp, &Cranking, &PulseAngle);

  SendStatus(EngineSpeed, CoolantTemp, ThrottlePos, ThrottleDirection, Pressure,
    AirTemp, Cranking, PulseAngle);
}
