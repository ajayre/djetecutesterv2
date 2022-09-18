// Mercedes V8 DJet Engine Simulator
// (C) andy@britishideas.com 2021

#include "AirTempSensor.h"
#include <math.h>

// steinhart-hart coefficients
// from Brad Cushman
#define COEFF_A 0.001806885
#define COEFF_B 0.000261256
#define COEFF_C 0.000000615

// initializes air temp sensor module
void AirTempSensor_Init
  (
  void  
  )
{
}

// gets the resistance for a specific temperature
// returns the resistance in ohms
int AirTempSensor_GetResistance
  (
  int TempF                                                // temperature in F
  )
{
  float TempK = ((TempF - 32) * 5 / 9) + 273.15;
  float Alpha = (COEFF_A - (1 / TempK)) / COEFF_C;
  float Beta = sqrt(pow(COEFF_B / (3 * COEFF_C), 3) + ((Alpha * Alpha) / 4));
  float R = exp(pow(Beta - (Alpha / 2), 1.0 / 3.0) - pow(Beta + (Alpha / 2), 1.0 / 3.0));

  return (int)R;
}
