using System;
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
        public UInt32 PulseAngle;
        public bool FuelPumpOn;
        public bool ColdStartOn;
        public UInt32 PulseWidth;
        public bool Cranking;
    };
}
