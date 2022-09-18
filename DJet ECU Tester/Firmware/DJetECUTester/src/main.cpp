// Mercedes V8 DJet Engine Simulator
// (C) andy@britishideas.com 2021

#include <Arduino.h>
#include "Engine.h"
#include "Menu.h"

// initialization
void setup() {
  Menu_Init();
  Engine_Init();
}

// continually called
void loop() {
  Menu_Process();
  Engine_Process();
}
