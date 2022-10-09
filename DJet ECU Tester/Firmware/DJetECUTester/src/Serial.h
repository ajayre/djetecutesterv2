// Mercedes V8 DJet Engine Simulator
// (C) andy@britishideas.com 2021-2022

#ifndef _SERIALH_
#define _SERIALH_

// initializes the module
extern void Serial_Init
  (
  int FirmwareMajorVersion,
  int FirmwareMinorVersion
  );

// operates the module
extern void Serial_Process
  (
  void
  );

// sends the current status
extern void Serial_SendStatus
  (
  void  
  );

// sends the throttle status
extern void Serial_SendThrottle
  (
  int Throttle   // throttle position as a percentage
  );

// func: debug_printf
// desc: outputs a debug line and has the same prototype as printf
extern int Serial_printf
  (
  char const *format,
  ...
  );

#endif // _SERIALH_
