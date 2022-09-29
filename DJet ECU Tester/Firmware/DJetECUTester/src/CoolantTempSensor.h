// Mercedes V8 DJet Engine Simulator
// (C) andy@britishideas.com 2021-2022

#ifndef _COOLANTTEMPSENSORH_
#define _COOLANTTEMPSENSORH_

// initializes the module
extern void CoolantTempSensor_Init
  (
  void  
  );

// gets the resistance for a specific temperature
// returns the resistance in ohms
extern int CoolantTempSensor_GetResistance
  (
  int TempF                                                // temperature in F
  );

#endif // _COOLANTTEMPSENSORH_
