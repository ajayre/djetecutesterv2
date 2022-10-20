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

typedef struct _dynamic_test_t
{
  uint16_t Steps;
  uint16_t StepTimeMs;

  uint16_t StartSpeed;
  int16_t SpeedStep;

  int16_t StartAirTemp;
  int16_t AirTempStep;

  int16_t StartCoolantTemp;
  int16_t CoolantTempStep;

  uint16_t StartStarter;
  uint16_t EndStarter;

  bool Running = false;
  unsigned long Timestamp;
  uint16_t StepNumber;
  unsigned long SendStatusTimestamp;
} dynamic_test_t;

extern dynamic_test_t EngineDynamicTest;

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

// sets the state of the starter motor
extern void Engine_SetStarterMotor
  (
  bool Running  // true if starter is running
  );

// gets thje state of the starter motor
extern bool Engine_GetStarterMotor
  (
  void  
  );

// set new engine parameters
extern void Engine_Set
  (
  int EngineSpeed,                                         // new speed in RPM
  int CoolantTempF,                                        // new coolant temperature in F
  int ThrottlePosition,                                    // new throttle position 0% -> 100%
  int Pressure                                             // new manifold pressure
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
  void
  );

// sets the engine to cranking with unstable RPMs
extern void Engine_CrankingUnstableRPM
  (
  void
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

// test function for debugging
extern void Engine_Test
  (
  void
  );

// disables the unstable rpms for cranking
extern void Engine_DisableUnstableCrankingRPM
  (
  void
  );

// starts a dynamic test
// before calling configure EngineDynamicTest with the settings
extern void Engine_StartDynamicTest
  (
  void
  );

// stops the dynamic test
extern void Engine_StopDynamicTest
  (
  void
  );

#endif // _ENGINEH_
