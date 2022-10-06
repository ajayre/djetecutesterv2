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
  CurrentStatus = 0x10
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

// func: debug_printf
// desc: outputs a debug line and has the same prototype as printf
static int Serial_printf(char *format, ...)
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

//static void stringCallback(char *myString)
//{
//  Firmata.sendString(myString);
//}

// sends the current status
static void SendStatus
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

// called when a sysex message is received
// processes the message
static void sysexCallback(byte command, byte argc, byte *argv)
{
  switch (command)
  {
    case RequestStatus:
      SendStatus();
      break;

    case SetCoolantTemp:
      int Temp = argv[0] | ((int)argv[1] << 8);
      Engine_SetCoolantTempF(Temp);
      Serial_printf("Set coolant temp to %d F", Temp);
      SendStatus();
      break;
  }

  Firmata.sendSysex(command, argc, argv);
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
