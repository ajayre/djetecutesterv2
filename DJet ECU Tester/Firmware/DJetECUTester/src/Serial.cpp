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
  CurrentStarterMotorState = 0x13,
  CurrentFuelPumpOutput = 0x14,
  CurrentPulseWidths = 0x15,
  SetStarterMotor = 0x16,
  UnstableCranking = 0x17,
  StartDynamicTest = 0x18,
  EngineName = 0x19,
  RequestEngineName = 0x1A,
  StopDynamicTest = 0x1B,
  DynamicTestEnded = 0x1C
} messageids_t;

typedef struct _status_t
{
  uint32_t EngineSpeed;
  int32_t CoolantTemperature;
  int32_t AirTemperature;
  uint32_t Throttle;
  uint32_t PulseAngle;
  uint32_t Pressure;
} status_t __attribute__ ((aligned (1)));

// the name of the engine
static char *CurrentEngineName;

// starts the dynamic test
static void StartDynamic
  (
  byte argc,
  byte *argv
  )
{
  EngineDynamicTest.Steps      = (uint16_t)((argv[0] | ((uint16_t)argv[1] << 8)));
  EngineDynamicTest.StepTimeMs = (uint16_t)((argv[2] | ((uint16_t)argv[3] << 8)));

  EngineDynamicTest.StartSpeed = (uint16_t)((argv[4] | ((int16_t)argv[5] << 8)));
  EngineDynamicTest.SpeedStep  = (int16_t)((argv[6] | ((int16_t)argv[7] << 8)));

  EngineDynamicTest.StartAirTemp = (uint16_t)((argv[8] | ((int16_t)argv[9] << 8)));
  EngineDynamicTest.AirTempStep  = (int16_t)((argv[10] | ((int16_t)argv[11] << 8)));

  Serial_printf("Steps=%u StepTimeMs=%u StartSpeed=%u SpeedStep=%d", EngineDynamicTest.Steps,
    EngineDynamicTest.StepTimeMs, EngineDynamicTest.StartSpeed, EngineDynamicTest.SpeedStep);

  Engine_StartDynamicTest();
}

// stops the dynamic test
static void StopDynamic
  (
  void
  )
{
  Engine_StopDynamicTest();
}

// sends the name of the engine being tested
static void SendEngineName
  (
  )
{
  Firmata.sendSysex(EngineName, strlen(CurrentEngineName), (byte *)CurrentEngineName);
}

// called when a sysex message is received
// processes the message
static void sysexCallback(byte command, byte argc, byte *argv)
{
  int Temp;
  int Throttle;
  int Speed;
  int Angle;
  bool StarterMotorState;

  switch (command)
  {
    case EngineTest:
      Engine_Test();
      break;

    case RequestStatus:
      Serial_SendStatus();
      break;

    case RequestEngineName:
      SendEngineName();
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
      Engine_DisableUnstableCrankingRPM();
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

    case SetStarterMotor:
      StarterMotorState = (bool)argv[0];
      Engine_SetStarterMotor(StarterMotorState);
      Serial_printf("Set starter motor state to %s", StarterMotorState ? "on" : "off");
      break;
    
    case EngineOff:
      Engine_Off();
      Serial_printf("Turned engine off");
      Serial_SendStatus();
      break;

    case Cranking:
      Engine_Cranking();
      Serial_printf("Engine cranking");
      Serial_SendStatus();
      break;

    case UnstableCranking:
      Engine_CrankingUnstableRPM();
      Serial_printf("Engine cranking with unstable RPMs");
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

    case StartDynamicTest:
      StartDynamic(argc, argv);
      Serial_printf("Running dynamic test");
      Serial_SendStatus();
      break;

    case StopDynamicTest:
      StopDynamic();
      Serial_printf("Dynamic test stopped");
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
  int FirmwareMinorVersion,
  char *EngineName
  )
{
  // store name to send later
  CurrentEngineName = EngineName;

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

// sends notification that the dynamic test has ended
void Serial_SendDynamicTestEnded
  (
  void
  )
{
  byte Buffer[1];

  Buffer[0] = 0x00;
  Firmata.sendSysex(DynamicTestEnded, 1, Buffer);
}

// sends the starter motor state
void Serial_SendStarterMotorState
  (
  bool Running   // true = starter running
  )
{
  byte Buffer[1];

  Buffer[0] = (byte)Running & 0xFF;
  Firmata.sendSysex(CurrentStarterMotorState, 1, Buffer);
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
  uint16_t Width_I,    // pulse width in us, group I
  uint16_t Width_II,   // pulse width in us, group II
  uint16_t Width_III,  // pulse width in us, group III
  uint16_t Width_IV    // pulse width in us, group IV
  )
{
  byte Buffer[16];

  Buffer[0] = Width_I & 0xFF;
  Buffer[1] = (Width_I >> 8) & 0xFF;

  Buffer[2] = Width_II & 0xFF;
  Buffer[3] = (Width_II >> 8) & 0xFF;

  Buffer[4] = Width_III & 0xFF;
  Buffer[5] = (Width_III >> 8) & 0xFF;

  Buffer[6] = Width_IV & 0xFF;
  Buffer[7] = (Width_IV >> 8) & 0xFF;

  //Serial_printf("%2.2X %2.2X", (byte)(Width_IV & 0xFF), (byte)((Width_IV >> 8) & 0xFF));

  //Serial_printf("%2.2X %2.2X %2.2X %2.2X", Buffer[12], Buffer[13], Buffer[14], Buffer[15]);

  Firmata.sendSysex(CurrentPulseWidths, 8, Buffer);
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
