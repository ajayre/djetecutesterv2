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

// sends the start output state
extern void Serial_SendStartOutput
  (
  bool StartOutput   // start output, high = on
  );

// sends the fuel pump output state
extern void Serial_SendFuelPumpOutput
  (
  bool FuelPumpOutput   // fuel pump output, high = on
  );

// sends the latest pulse width measurements
extern void Serial_SendPulseWidths2
  (
  uint32_t Width_I,    // pulse width in ms, group I
  uint32_t Width_II,   // pulse width in ms, group II
  uint32_t Width_III,  // pulse width in ms, group III
  uint32_t Width_IV    // pulse width in ms, group IV
  );

// func: debug_printf
// desc: outputs a debug line and has the same prototype as printf
extern int Serial_printf
  (
  char const *format,
  ...
  );

#endif // _SERIALH_
