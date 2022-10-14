﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.InteropServices;

namespace DJetronicECUTester
{
    public struct Status
    {
        public UInt32 EngineSpeed;
        public Int32 CoolantTemperature;
        public Int32 AirTemperature;
        public UInt32 Throttle;
        public UInt32 DwellAngle;
        public bool FuelPumpOn;
        public bool ColdStartOn;
        public UInt16 PulseWidth_I;     // us
        public UInt16 PulseWidth_II;    // us
        public UInt16 PulseWidth_III;   // us
        public UInt16 PulseWidth_IV;    // us
        public UInt32 Pressure;
    };
}
