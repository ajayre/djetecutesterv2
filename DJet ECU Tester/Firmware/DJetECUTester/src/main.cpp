// Mercedes V8 DJet Engine Simulator
// (C) andy@britishideas.com 2021-2022

#include <Arduino.h>
#include "Engine.h"
#include "Serial.h"

#define MAJOR_VERSION 2
#define MINOR_VERSION 3
#define ENGINE_NAME "Mercedes V8"
#define PRODUCT_UID   0x01   // ECU Tester

// initialization
void setup() {
  Serial_Init(MAJOR_VERSION, MINOR_VERSION, PRODUCT_UID, ENGINE_NAME);
  Engine_Init();
}

// continually called
void loop() {
  Serial_Process();
  Engine_Process();
}
