using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DJetronicECUTester
{
    public class DynamicSettings
    {
        public uint Duration;
        public uint Resolution;

        public bool UseSpeed;
        public bool UseAirTemp;
        public bool UseCoolantTemp;
        public bool UseThrottle;
        public bool UseStarter;

        public uint StartSpeed;
        public uint EndSpeed;
        public int StartAirTemp;
        public int EndAirTemp;
        public int StartCoolantTemp;
        public int EndCoolantTemp;
        public uint StartThrottle;
        public uint EndThrottle;
        public uint StartStarter;
        public uint EndStarter;

        /// <summary>
        /// Converts the settings into a lookup table
        /// </summary>
        /// <returns></returns>
        public byte[] GenerateTable
            (
            )
        {
            uint Steps = Duration / Resolution;
            int SpeedStep = 0;

            if (UseSpeed)
            {
                if (EndSpeed > StartSpeed)
                {
                    SpeedStep = (int)(((double)EndSpeed - (double)StartSpeed + 1) * 10.0 / Steps);
                }
                else if (StartSpeed > EndSpeed)
                {
                    SpeedStep = -(int)(((double)StartSpeed - (double)EndSpeed + 1) * 10.0 / Steps);
                }
            }

            byte[] Table = new byte[8];

            Table[0] = (byte)(Steps & 0xFF);
            Table[1] = (byte)((Steps >> 8) & 0xFF);

            Table[2] = (byte)(Resolution & 0xFF);
            Table[3] = (byte)((Resolution >> 8) & 0xFF);

            Table[4] = (byte)(StartSpeed & 0xFF);
            Table[5] = (byte)((StartSpeed >> 8) & 0xFF);
            Table[6] = (byte)(SpeedStep & 0xFF);
            Table[7] = (byte)((SpeedStep >> 8) & 0xFF);

            return Table;
        }
    }
}
