// Mercedes V8 DJet Engine Simulator
// (C) andy@britishideas.com 2021-2022

#include <Arduino.h>
#include "Engine.h"
#include "Menu.h"

#define VERSION 6

#define BAUDRATE 57600

#define MAX_INPUTBUFFER_SIZE 10

#define CHAR_BS 8
#define CHAR_LF 10
#define CHAR_CR 13

#define MENU_TOP_LEVEL        0
#define MENU_SHOW_SETTINGS    1
#define MENU_OFF              2
#define MENU_CRANKING         3
#define MENU_COLD_IDLE        4
#define MENU_HOT_IDLE         5
#define MENU_CRUISE_30MPH     6
#define MENU_CRUISE_70MPH     7
#define MENU_GENTLE_ACCEL     8
#define MENU_MODERATE_ACCEL   9
#define MENU_HARD_ACCEL       10
#define MENU_SET_COOLANT_TEMP 11
#define MENU_SET_AIR_TEMP     12
#define MENU_SET_ENGINE_SPEED 13
#define MENU_SET_THROTTLE     14
#define MENU_SET_PULSE_ANGLE  15

// limits
// note that temp limits come from the resistance range of the
// hardware
#define MIN_COOLANT_TEMP      39
#define MAX_COOLANT_TEMP      193
#define MIN_AIR_TEMP          0
#define MAX_AIR_TEMP          77
#define MIN_ENGINE_SPEED      500
#define MAX_ENGINE_SPEED      6500
#define MIN_THROTTLE_POSITION 0
#define MAX_THROTTLE_POSITION 100

#define DEFAULT_CRANKING_RPM 300

static char InputBuffer[MAX_INPUTBUFFER_SIZE];
static int InputBufferIdx = 0;
static int CurrentMenuLevel = MENU_TOP_LEVEL;
static int ThrottlePos;

// shows the banner
static void ShowBanner
  (
  void
  )
{
  Serial.println(F("Mercedes V8 DJet ECU Tester"));
  Serial.print(F("Version "));
  Serial.println(VERSION);
  Serial.println(F("(C) andy@britishideas.com 2021"));
  Serial.println();
}

// show the current menu to the user
static void ShowMenu
  (
  )
{
  switch (CurrentMenuLevel)
  {
    case MENU_TOP_LEVEL:
      Serial.println();
      Serial.println(F("MAIN MENU"));
      Serial.println(F("   1. Show current settings"));
      Serial.println(F("Presets:"));
      Serial.println(F("   2. Off"));
      Serial.println(F("   3. Cranking"));
      Serial.println(F("   4. Cold idle"));
      Serial.println(F("   5. Hot idle"));
      Serial.println(F("   6. Cruise 30MPH"));
      Serial.println(F("   7. Cruise 70MPH"));
      Serial.println(F("   8. Gentle acceleration"));
      Serial.println(F("   9. Moderate acceleration"));
      Serial.println(F("  10. Hard acceleration"));
      Serial.println(F("Customize:"));
      Serial.println(F("  11. Set coolant temp"));
      Serial.println(F("  12. Set air temp"));
      Serial.println(F("  13. Set engine speed"));
      Serial.println(F("  14. Set throttle"));
      Serial.println(F("  15. Set pulse generator dwell"));
      Serial.println();
      Serial.println(F("Enter a number and press Enter:"));
      break;

    case MENU_SET_COOLANT_TEMP:
      Serial.print(F("Enter new coolant temp in deg F ("));
      Serial.print(MIN_COOLANT_TEMP);
      Serial.print(F("-"));
      Serial.print(MAX_COOLANT_TEMP);
      Serial.print(F("):"));
      break;
    
    case MENU_SET_AIR_TEMP:
      Serial.print(F("Enter new air temp in deg F ("));
      Serial.print(MIN_AIR_TEMP);
      Serial.print(F("-"));
      Serial.print(MAX_AIR_TEMP);
      Serial.print(F("):"));
      break;

    case MENU_SET_ENGINE_SPEED:
      Serial.print(F("Enter new engine speed in RPM ("));
      Serial.print(MIN_ENGINE_SPEED);
      Serial.print(F("-"));
      Serial.print(MAX_ENGINE_SPEED);
      Serial.print(F("):"));
      break;

    case MENU_SET_THROTTLE:
      Serial.print(F("Enter new throttle position ("));
      Serial.print(MIN_THROTTLE_POSITION);
      Serial.print(F("-"));
      Serial.print(MAX_THROTTLE_POSITION);
      Serial.print(F("):"));
      break;

    case MENU_SET_PULSE_ANGLE:
      Serial.print(F("Enter new dwell in degrees ("));
      Serial.print(MIN_PULSEANGLE);
      Serial.print(F("-"));
      Serial.print(MAX_PULSEANGLE);
      Serial.print(F("):"));
      break;
  }
}

// shows the current settings
static void ShowSettings
  (
  void  
  )
{
  Serial.println();

  // get current engine parameters
  int EngineSpeed;
  int CoolantTempF;
  int ThrottlePosition;
  throttledirection_t ThrottleDirection;
  int Pressure;
  int AirTempF;
  bool Cranking;
  int PulseAngle;
  Engine_Get(&EngineSpeed, &CoolantTempF, &ThrottlePosition, &ThrottleDirection, &Pressure, &AirTempF, &Cranking, &PulseAngle);

  Serial.print(F("Settings: airtemp="));
  Serial.print(AirTempF);
  Serial.print(F(", coolanttemp="));
  Serial.print(CoolantTempF);
  Serial.print(F(", throttlepos="));
  Serial.print(ThrottlePosition);
  Serial.print(F("%, throttledir="));
  switch (ThrottleDirection)
  {
    default:
    case THROTTLE_ACCELERATING: Serial.print(F("accel")); break;
    case THROTTLE_DECELERATING: Serial.print(F("decel")); break;
  }
  Serial.print(F(", engspeed="));
  Serial.print(EngineSpeed);
  Serial.print(F(", cranking="));
  Serial.print(Cranking ? F("yes") : F("no"));
  Serial.print(F(", pulsegendwell="));
  Serial.println(PulseAngle);
}

// executes a top level menu item
static void Execute_Top_Level_Menu_Item
  (
  int ItemNumber                                           // menu item number
  )
{
  switch (ItemNumber)
  {
    case MENU_SHOW_SETTINGS:
      ShowSettings();
      CurrentMenuLevel = MENU_TOP_LEVEL;
      ShowMenu();
      break;

    case MENU_OFF:
      Engine_Off();
      Serial.println(F("Engine turned off"));
      ShowSettings();
      CurrentMenuLevel = MENU_TOP_LEVEL;
      ShowMenu();
      break;

    case MENU_CRANKING:
      Engine_Cranking(DEFAULT_CRANKING_RPM);
      Serial.println(F("Set to cranking"));
      ShowSettings();
      CurrentMenuLevel = MENU_TOP_LEVEL;
      ShowMenu();
      break;

    case MENU_COLD_IDLE:
      Engine_ColdIdle();
      Serial.println(F("Set to cold idle"));
      ShowSettings();
      CurrentMenuLevel = MENU_TOP_LEVEL;
      ShowMenu();
      break;
    
    case MENU_HOT_IDLE:
      Engine_HotIdle();
      Serial.println(F("Set to hot idle"));
      ShowSettings();
      CurrentMenuLevel = MENU_TOP_LEVEL;
      ShowMenu();
      break;

    case MENU_CRUISE_30MPH:
      Engine_Cruise30MPH();
      Serial.println(F("Set to cruise at 30MPH"));
      ShowSettings();
      CurrentMenuLevel = MENU_TOP_LEVEL;
      ShowMenu();
      break;

    case MENU_CRUISE_70MPH:
      Engine_Cruise70MPH();
      Serial.println(F("Set to cruise at 70MPH"));
      ShowSettings();
      CurrentMenuLevel = MENU_TOP_LEVEL;
      ShowMenu();
      break;

    case MENU_GENTLE_ACCEL:
      Engine_GentleAcceleration();
      Serial.println(F("Set to gentle acceleration"));
      ShowSettings();
      CurrentMenuLevel = MENU_TOP_LEVEL;
      ShowMenu();
      break;

    case MENU_MODERATE_ACCEL:
      Engine_ModerateAcceleration();
      Serial.println(F("Set to moderate acceleration"));
      ShowSettings();
      CurrentMenuLevel = MENU_TOP_LEVEL;
      ShowMenu();
      break;

    case MENU_HARD_ACCEL:
      Engine_HardAcceleration();
      Serial.println(F("Set to hard acceleration"));
      ShowSettings();
      CurrentMenuLevel = MENU_TOP_LEVEL;
      ShowMenu();
      break;

    case MENU_SET_COOLANT_TEMP:
    case MENU_SET_AIR_TEMP:
    case MENU_SET_ENGINE_SPEED:
    case MENU_SET_THROTTLE:
    case MENU_SET_PULSE_ANGLE:
      CurrentMenuLevel = ItemNumber;
      ShowMenu();
      break;

    default:
      Serial.println(F("ERROR: Invalid input"));
      ShowMenu();
  }
}

// processes the input given by the user
static void Process_User_Input
  (
  char *Input                                              // null terminated input string
  )
{
  switch (CurrentMenuLevel)
  {
    case MENU_SET_COOLANT_TEMP:
      {
        int CoolantTemp = atol(Input);
        if (CoolantTemp < MIN_COOLANT_TEMP || CoolantTemp > MAX_COOLANT_TEMP)
        {
          Serial.println();
          Serial.println();
          Serial.println(F("ERROR: Entered value is outside of allowed range"));
        }
        else
        {
          Engine_SetCoolantTempF(CoolantTemp);
          Serial.println(F("Coolant temperature set"));
          ShowSettings();
        }
        CurrentMenuLevel = MENU_TOP_LEVEL;
        ShowMenu();
      }
      break;

    case MENU_SET_AIR_TEMP:
      {
        int AirTemp = atol(Input);
        if (AirTemp < MIN_AIR_TEMP || AirTemp > MAX_AIR_TEMP)
        {
          Serial.println();
          Serial.println();
          Serial.println(F("ERROR: Entered value is outside of allowed range"));
        }
        else
        {
          Engine_SetAirTempF(AirTemp);
          Serial.println(F("Air temperature set"));
          ShowSettings();
        }
        CurrentMenuLevel = MENU_TOP_LEVEL;
        ShowMenu();
      }
      break;

    case MENU_SET_ENGINE_SPEED:
      {
        int EngineSpeed = atol(Input);
        if (EngineSpeed < MIN_ENGINE_SPEED || EngineSpeed > MAX_ENGINE_SPEED)
        {
          Serial.println();
          Serial.println();
          Serial.println(F("ERROR: Entered value is outside of allowed range"));
        }
        else
        {
          Engine_SetEngineSpeed(EngineSpeed);
          Serial.println(F("Engine speed set"));
          ShowSettings();
        }
        CurrentMenuLevel = MENU_TOP_LEVEL;
        ShowMenu();
      }
      break;

    case MENU_SET_PULSE_ANGLE:
      {
        int PulseAngle = atol(Input);
        if (PulseAngle < MIN_PULSEANGLE || PulseAngle > MAX_PULSEANGLE)
        {
          Serial.println();
          Serial.println();
          Serial.println(F("ERROR: Entered value is outside of allowed range"));
        }
        else
        {
          Engine_SetPulseAngle(PulseAngle);
          Serial.println(F("Pulse angle for pulse generator set"));
          ShowSettings();
        }
        CurrentMenuLevel = MENU_TOP_LEVEL;
        ShowMenu();
      }
      break;

    case MENU_SET_THROTTLE:
      {
        ThrottlePos = atol(Input);
        if ((ThrottlePos < MIN_THROTTLE_POSITION) || (ThrottlePos > MAX_THROTTLE_POSITION))
        {
          Serial.println();
          Serial.println();
          Serial.println(F("ERROR: Entered value is outside of allowed range"));
        
          CurrentMenuLevel = MENU_TOP_LEVEL;
          ShowMenu();
        }
        else
        {
          Engine_SetThrottle(ThrottlePos);
          Serial.println(F("Throttle position set"));
          ShowSettings();

          CurrentMenuLevel = MENU_TOP_LEVEL;
          ShowMenu();
        }
      }
      break;
  }
}

// initializes the user interface
void Menu_Init
  (
  void
  )
{
  // start serial output
  Serial.begin(BAUDRATE);
  while (!Serial) delay(1);
  Serial.flush();

  ShowBanner();

  CurrentMenuLevel = MENU_TOP_LEVEL;
  ShowMenu();
}

// operates the user interface
void Menu_Process
  (
  void
  )
{
  // if key pressed
  if (Serial.peek() != -1)
  {
    // get next char
    int InChar = Serial.read();

    // echo back
    Serial.print((char)InChar);

    if (InChar != CHAR_LF)
    {
      // if number entered then store it
      if (InChar >= '0')
      {
        // store in buffer
        InputBuffer[InputBufferIdx++] = InChar;
        if (InputBufferIdx == MAX_INPUTBUFFER_SIZE - 1) InputBufferIdx = 0;
      }
      // if backspace pressed then delete last char
      else if (InChar == CHAR_BS)
      {
        if (InputBufferIdx > 0) InputBufferIdx--;
      }
      // anything else entered
      else
      {
        Serial.flush();
        InputBuffer[InputBufferIdx] = 0;
        InputBufferIdx = 0;

        // no choice made, show top level menu
        if (InputBuffer[0] == 0)
        {
          ShowBanner();
          CurrentMenuLevel = MENU_TOP_LEVEL;
          ShowMenu();
        }
        // user made choice from top level menu
        else if (CurrentMenuLevel == MENU_TOP_LEVEL)
        {
          int MenuChoice = atoi(InputBuffer);
          Execute_Top_Level_Menu_Item(MenuChoice);
        }
        else
        {
          Process_User_Input(InputBuffer);
        }
      }
    }
  }
}
