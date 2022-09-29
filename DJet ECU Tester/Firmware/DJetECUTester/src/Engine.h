// Mercedes V8 DJet Engine Simulator
// (C) andy@britishideas.com 2021-2022

#ifndef _ENGINEH_
#define _ENGINEH_

// pulse angle limits
#define MIN_PULSEANGLE 39
#define MAX_PULSEANGLE (360 - 39)

typedef enum _throttledirection
{
  THROTTLE_ACCELERATING,
  THROTTLE_DECELERATING
} throttledirection_t;

// initializes engine simulation
// initially cold idle
extern void Engine_Init
   (
   void
   );

// call repeatedly to implement the engine simulation
extern void Engine_Process
  (
  void
  );

// sets the pulse generator pulse angle in degrees of distributor rotation
extern void Engine_SetPulseAngle
  (
  int NewPulseAngle                                        // degrees of rotation
  );

// sets the engine speed
extern void Engine_SetEngineSpeed
  (
  int NewSpeed                                             // new speed in RPM
  );

// sets the air temperature
extern void Engine_SetAirTempF
  (
  int NewAirTempF                                          // new air temperature in F
  );

// sets the coolant temperature 
extern void Engine_SetCoolantTempF
  (
  int NewCoolantTempF                                      // new coolant temperature in F
  );

// sets the throttle position and direction
extern void Engine_SetThrottle
  (
  int NewThrottlePosition                                  // new throttle position 0% -> 100%
  );

// sets the new pressure level from the manifold
extern void Engine_SetManifoldPressure
  (
  int NewPressure                                          // new pressure level in inHg
  );

// sets the cranking state
extern void Engine_SetCranking
  (
  bool Cranking                                            // true if cranking
  );

// set new engine parameters
extern void Engine_Set
  (
  int EngineSpeed,                                         // new speed in RPM
  int CoolantTempF,                                        // new coolant temperature in F
  int ThrottlePosition,                                    // new throttle position 0% -> 100%
  int Pressure,                                            // new manifold pressure
  bool Cranking                                            // new cranking state
  );

// get current engine parameters
extern void Engine_Get
  (
  int *pEngineSpeed,                                       // speed in RPM
  int *pCoolantTempF,                                      // coolant temperature in F
  int *pThrottlePosition,                                  // throttle position 0% -> 100%
  throttledirection_t *pThrottleDirection,                 // throttle direction
  int *pPressure,                                          // manifold pressure
  int *pAirTempF,                                          // air temperature
  bool *pCranking,                                         // cranking state
  int *pPulseAngle                                         // pulse angle for pulse generator in degrees
  );

// turns the engine off
extern void Engine_Off
  (
  void  
  );

// sets the engine to cranking
extern void Engine_Cranking
  (
  int EngineSpeed                                          // new speed in RPM
  );

// sets the engine to cold idle state
extern void Engine_ColdIdle
  (
  void  
  );

// sets the engine to hot idle state
extern void Engine_HotIdle
  (
  void  
  );

// sets the engine to cruising at 30 MPH
extern void Engine_Cruise30MPH
  (
  void  
  );

// sets the engine to cruising at 70 MPH
extern void Engine_Cruise70MPH
  (
  void  
  );

// sets the engine to gentle acceleration
extern void Engine_GentleAcceleration
  (
  void  
  );

// sets the engine to moderate acceleration
extern void Engine_ModerateAcceleration
  (
  void  
  );

// sets the engine to hard acceleration
extern void Engine_HardAcceleration
  (
  void  
  );

#endif // _ENGINEH_
