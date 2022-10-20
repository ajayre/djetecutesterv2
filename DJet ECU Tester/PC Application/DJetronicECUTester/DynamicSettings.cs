using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DJetronicStudio
{
    public class DynamicSettings
    {
        public const uint INVALID_STARTER_TIME = 0xFFFF;

        public uint Duration;
        public uint Resolution;

        public bool UseSpeed;
        public bool UseAirTemp;
        public bool UseCoolantTemp;
        public bool UseStarter;

        public uint StartSpeed;
        public uint EndSpeed;
        public int StartAirTemp;
        public int EndAirTemp;
        public int StartCoolantTemp;
        public int EndCoolantTemp;
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
            int AirTempStep = 0;
            int CoolantTempStep = 0;

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

            if (UseAirTemp)
            {
                if (EndAirTemp > StartAirTemp)
                {
                    AirTempStep = (int)(((double)EndAirTemp - (double)StartAirTemp + 1) * 100 / Steps);
                }
                else if (StartAirTemp > EndAirTemp)
                {
                    AirTempStep = -(int)(((double)StartAirTemp - (double)EndAirTemp + 1) * 100 / Steps);
                }
            }

            if (UseCoolantTemp)
            {
                if (EndCoolantTemp > StartCoolantTemp)
                {
                    CoolantTempStep = (int)(((double)EndCoolantTemp - (double)StartCoolantTemp + 1) * 100 / Steps);
                }
                else if (StartAirTemp > EndAirTemp)
                {
                    CoolantTempStep = -(int)(((double)StartCoolantTemp - (double)EndCoolantTemp + 1) * 100 / Steps);
                }
            }

            if (!UseStarter)
            {
                StartStarter = INVALID_STARTER_TIME;
                EndStarter = INVALID_STARTER_TIME;
            }

            byte[] Table = new byte[20];

            Table[0]  = (byte)(Steps & 0xFF);
            Table[1]  = (byte)((Steps >> 8) & 0xFF);

            Table[2]  = (byte)(Resolution & 0xFF);
            Table[3]  = (byte)((Resolution >> 8) & 0xFF);

            Table[4]  = (byte)(StartSpeed & 0xFF);
            Table[5]  = (byte)((StartSpeed >> 8) & 0xFF);
            Table[6]  = (byte)(SpeedStep & 0xFF);
            Table[7]  = (byte)((SpeedStep >> 8) & 0xFF);

            Table[8]  = (byte)(StartAirTemp & 0xFF);
            Table[9]  = (byte)((StartAirTemp >> 8) & 0xFF);
            Table[10] = (byte)(AirTempStep & 0xFF);
            Table[11] = (byte)((AirTempStep >> 8) & 0xFF);

            Table[12] = (byte)(StartCoolantTemp & 0xFF);
            Table[13] = (byte)((StartCoolantTemp >> 8) & 0xFF);
            Table[14] = (byte)(CoolantTempStep & 0xFF);
            Table[15] = (byte)((CoolantTempStep >> 8) & 0xFF);

            Table[16] = (byte)(StartStarter & 0xFF);
            Table[17] = (byte)((StartStarter >> 8) & 0xFF);
            Table[18] = (byte)(EndStarter & 0xFF);
            Table[19] = (byte)((EndStarter >> 8) & 0xFF);

            return Table;
        }
    }
}
