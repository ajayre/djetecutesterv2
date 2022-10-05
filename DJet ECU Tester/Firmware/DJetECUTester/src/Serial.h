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

#endif // _SERIALH_
