// Mercedes V8 DJet Engine Simulator
// (C) andy@britishideas.com 2021

#ifndef _AIRTEMPSENSORH_
#define _AIRTEMPSENSORH_

// initializes the module
extern void AirTempSensor_Init
  (
  void  
  );

// gets the resistance for a specific temperature
// returns the resistance in ohms
extern int AirTempSensor_GetResistance
  (
  int TempF                                                // temperature in F
  );

#endif // _AIRTEMPSENSORH_
