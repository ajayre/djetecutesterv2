using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;

namespace DJetronicStudio
{
    public class ChartSettings
    {
        public string YAxisTitle;
        public double MinY;
        public double MaxY;
        public Color YColor;

        public bool EnableSecondYAxis;
        public string SecondYAxisTitle;
        public double SecondYAxisMin;
        public double SecondYAxisMax;
        public Color SecondYAxisColor;
        public bool SecondYAxisShowPulseWidthI;
        public bool SecondYAxisShowPulseWidthII;
        public bool SecondYAxisShowPulseWidthIII;
        public bool SecondYAxisShowPulseWidthIV;
        public bool SecondYAxisShowFuelPump;
        public bool SecondYAxisShowEngineSpeed;
        public bool SecondYAxisShowThrottle;
        public bool SecondYAxisShowCoolantTemperature;
        public bool SecondYAxisShowAirTemperature;
        public bool SecondYAxisShowVacuum;
        public bool SecondYAxisShowStaterMotor;

        public ChartSettings
            (
            )
        {
            YAxisTitle = "Value";
            MinY = 0;
            MaxY = 15;
            YColor = Color.Black;

            EnableSecondYAxis = false;
            SecondYAxisTitle = "Value";
            SecondYAxisMin = 0;
            SecondYAxisMax = 15;
            SecondYAxisColor = Color.Orange;
        }
    }
}
