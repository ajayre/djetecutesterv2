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
        public UInt32 DwellAngle;
        public bool FuelPumpOn;
        public bool ColdStartOn;
        public UInt32 PulseWidth_I;
        public UInt32 PulseWidth_II;
        public UInt32 PulseWidth_III;
        public UInt32 PulseWidth_IV;
        public UInt32 Pressure;
    };
}
