using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Solid.Arduino.Firmata;
using Solid.Arduino;

namespace DJetronicECUTester
{
    public class ECUTester
    {
        private ArduinoSession Session = null;
        private ISerialConnection Connection = null;

        private const byte SysExStart = 0xF0;
        private const byte SysExEnd = 0xF7;

        // limits
        // note that temp limits come from the resistance range of the
        // hardware
        private const int MIN_COOLANT_TEMP_F = 39;
        private const int MAX_COOLANT_TEMP_F = 193;
        private const int MIN_AIR_TEMP_F = 0;
        private const int MAX_AIR_TEMP_F = 77;
        private const int MIN_ENGINE_SPEED_RPM = 500;
        private const int MAX_ENGINE_SPEED_RPM = 6500;
        private const int MIN_PULSE_ANGLE_DEG = 100;
        private const int MAX_PULSE_ANGLE_DEG = 190;

        private enum MessageIds
        {
            GetSettings = 0x01,
            EngineOff = 0x02,
            Cranking = 0x03,
            ColdIdle = 0x04,
            HotIdle = 0x05,
            Cruise30MPH = 0x06,
            Cruise70MPH = 0x07,
            GentleAcceleration = 0x08,
            ModerateAcceleration = 0x09,
            HardAcceleration = 0x0A,
            SetCoolantTemp = 0x0B,
            SetAirTemp = 0x0C,
            SetEngineSpeed = 0x0D,
            SetThrottle = 0x0E,
            SetPulseAngle = 0x0F
        }

        public delegate void OnConnectedHandler(object sender, string PortName, int Baudrate, int MajorVersion, int MinorVersion);
        public event OnConnectedHandler OnConnected = null;

        public delegate void OnDisconnectedHandler(object sender);
        public event OnDisconnectedHandler OnDisconnected = null;

        public delegate void OnShowMessageHandler(object sender, string Message);
        public event OnShowMessageHandler OnShowMessage = null;

        /// <summary>
        /// true if connected to the tester
        /// </summary>
        public bool IsConnected
        {
            get
            {
                return (Connection != null) && Connection.IsOpen;
            }
        }

        /// <summary>
        /// Finds and connects to the tester
        /// </summary>
        public void Connect
            (
            )
        {
            if (Connection != null && Connection.IsOpen)
            {
                return;
            }

            Connection = EnhancedSerialConnection.Find();
            if (Connection == null)
            {
                throw new Exception("No ECU tester found. Is it connected to the PC?");
            }

            Session = new ArduinoSession(Connection);
            Session.MessageReceived += Session_MessageReceived;

            var firmware = Session.GetFirmware();

            if (OnConnected != null)
            {
                OnConnected(this, Connection.PortName, Connection.BaudRate, firmware.MajorVersion, firmware.MinorVersion);
            }
        }

        /// <summary>
        /// Disconnects from the tester
        /// </summary>
        public void Disconnect
            (
            )
        {
            if (Connection == null || !Connection.IsOpen)
            {
                return;
            }

            Session.MessageReceived -= Session_MessageReceived;
            Connection.Close();
            Connection = null;
            Session = null;

            if (OnDisconnected != null)
            {
                OnDisconnected(this);
            }
        }

        /// <summary>
        /// Sets the coolant temperature
        /// </summary>
        /// <param name="TemperatureF">New temperature in deg F</param>
        public void SetCoolantTemperature
            (
            int TemperatureF
            )
        {
            if (TemperatureF < MIN_COOLANT_TEMP_F) TemperatureF = MIN_COOLANT_TEMP_F;
            if (TemperatureF > MAX_COOLANT_TEMP_F) TemperatureF = MAX_COOLANT_TEMP_F;

            byte[] Buffer = new byte[5] { SysExStart, (byte)MessageIds.SetCoolantTemp, (byte)(TemperatureF & 0xFF), (byte)((TemperatureF >> 8) & 0xFF), SysExEnd };
            Connection.Write(Buffer, 0, 5);
        }

        /// <summary>
        /// Sets the air temperature
        /// </summary>
        /// <param name="TemperatureF">New temperature in deg F</param>
        public void SetAirTemperature
            (
            int TemperatureF
            )
        {
            if (TemperatureF < MIN_AIR_TEMP_F) TemperatureF = MIN_AIR_TEMP_F;
            if (TemperatureF > MAX_AIR_TEMP_F) TemperatureF = MAX_AIR_TEMP_F;

            byte[] Buffer = new byte[5] { SysExStart, (byte)MessageIds.SetAirTemp, (byte)(TemperatureF & 0xFF), (byte)((TemperatureF >> 8) & 0xFF), SysExEnd };
            Connection.Write(Buffer, 0, 5);
        }

        /// <summary>
        /// Sets the engine speed
        /// </summary>
        /// <param name="SpeedRPM">New speed in RPM</param>
        public void SetEngineSpeed
            (
            int SpeedRPM
            )
        {
            if (SpeedRPM < MIN_ENGINE_SPEED_RPM) SpeedRPM = MIN_ENGINE_SPEED_RPM;
            if (SpeedRPM > MAX_ENGINE_SPEED_RPM) SpeedRPM = MAX_ENGINE_SPEED_RPM;

            byte[] Buffer = new byte[5] { SysExStart, (byte)MessageIds.SetEngineSpeed, (byte)(SpeedRPM & 0xFF), (byte)((SpeedRPM >> 8) & 0xFF), SysExEnd };
            Connection.Write(Buffer, 0, 5);
        }

        /// <summary>
        /// Sets the throttle position
        /// </summary>
        /// <param name="PositionPcent">New position in percentage</param>
        public void SetThrottle
            (
            int PositionPcent
            )
        {
            if (PositionPcent < 0) PositionPcent = 0;
            if (PositionPcent > 100) PositionPcent = 100;

            byte[] Buffer = new byte[5] { SysExStart, (byte)MessageIds.SetThrottle, (byte)(PositionPcent & 0xFF), (byte)((PositionPcent >> 8) & 0xFF), SysExEnd };
            Connection.Write(Buffer, 0, 5);
        }

        /// <summary>
        /// Sets the pulse generate dwell angle
        /// </summary>
        /// <param name="AngleDeg">New angle in degrees</param>
        public void SetPulseAngle
            (
            int AngleDeg
            )
        {
            if (AngleDeg < MIN_PULSE_ANGLE_DEG) AngleDeg = MIN_PULSE_ANGLE_DEG;
            if (AngleDeg > MAX_PULSE_ANGLE_DEG) AngleDeg = MAX_PULSE_ANGLE_DEG;

            byte[] Buffer = new byte[4] { SysExStart, (byte)MessageIds.SetPulseAngle, (byte)AngleDeg, SysExEnd };
            Connection.Write(Buffer, 0, 4);
        }

        /// <summary>
        /// Uses a preset
        /// </summary>
        /// <param name="Preset">Preset to use</param>
        private void UsePreset
            (
            MessageIds Preset
            )
        {
            byte[] Buffer = new byte[3] { SysExStart, (byte)Preset, SysExEnd };
            Connection.Write(Buffer, 0, 3);
        }

        /// <summary>
        /// Turns engine off
        /// </summary>
        public void UsePreset_EngineOff() { UsePreset(MessageIds.EngineOff); }
        /// <summary>
        /// Sets engine to cranking
        /// </summary>
        public void UsePreset_Cranking() { UsePreset(MessageIds.Cranking); }
        /// <summary>
        /// Sets engine to cold idle
        /// </summary>
        public void UsePreset_ColdIdle() { UsePreset(MessageIds.ColdIdle); }
        /// <summary>
        /// Sets engine to hot idle
        /// </summary>
        public void UsePreset_HotIdle() { UsePreset(MessageIds.HotIdle); }
        /// <summary>
        /// Sets engine to 30MPH cruise
        /// </summary>
        public void UsePreset_Cruise30MPH() { UsePreset(MessageIds.Cruise30MPH); }
        /// <summary>
        /// Sets engine to 70MPH cruise
        /// </summary>
        public void UsePreset_Cruise70MPH() { UsePreset(MessageIds.Cruise70MPH); }
        /// <summary>
        /// Sets engine to gentle acceleration
        /// </summary>
        public void UsePreset_GentleAcceleration() { UsePreset(MessageIds.GentleAcceleration); }
        /// <summary>
        /// Sets entine to moderate acceleration
        /// </summary>
        public void UsePreset_ModerateAcceleration() { UsePreset(MessageIds.ModerateAcceleration); }
        /// <summary>
        /// Sets engine to hard acceleration
        /// </summary>
        public void UsePreset_HardAcceleration() { UsePreset(MessageIds.HardAcceleration); }

        /// <summary>
        /// Called when a message is received from the tester
        /// </summary>
        /// <param name="sender">Sending session</param>
        /// <param name="eventArgs">Received message</param>
        private void Session_MessageReceived(object sender, FirmataMessageEventArgs eventArgs)
        {
            if (eventArgs.Value.Type == MessageType.StringData)
            {
                if (OnShowMessage != null) OnShowMessage(this, (eventArgs.Value.Value as StringData).Text);
            }
            else if (eventArgs.Value.Type == MessageType.SysEx)
            {
                byte[] Buffer = eventArgs.Value.Value as byte[];
            }
        }
    }
}
