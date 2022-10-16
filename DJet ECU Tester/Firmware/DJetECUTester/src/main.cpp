// Mercedes V8 DJet Engine Simulator
// (C) andy@britishideas.com 2021-2022

#include <Arduino.h>
#include "Engine.h"
#include "Serial.h"

#define MAJOR_VERSION 2
#define MINOR_VERSION 1

// initialization
void setup() {
  Serial_Init(MAJOR_VERSION, MINOR_VERSION);
  Engine_Init();
}

// continually called
void loop() {
  Serial_Process();
  Engine_Process();
}
