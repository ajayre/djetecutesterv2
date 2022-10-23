using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Solid.Arduino.Firmata;
using Solid.Arduino;

namespace DJetronicStudio
{
    public class ECUTester
    {
        private ArduinoSession Session = null;
        private ISerialConnection Connection = null;
        private Status CurrentStatus = new Status();

        private bool _DynamicTestRunning = false;
        public bool DynamicTestRunning
        {
            get { return _DynamicTestRunning; }
        }

        private const byte SysExStart = 0xF0;
        private const byte SysExEnd = 0xF7;

        // limits
        // note that temp limits come from the resistance range of the
        // hardware
        private const int MIN_COOLANT_TEMP_F = 15;
        private const int MAX_COOLANT_TEMP_F = 101;
        private const int MIN_AIR_TEMP_F = -21;
        private const int MAX_AIR_TEMP_F = 32;
        private const int MIN_ENGINE_SPEED_RPM = 0;
        private const int MAX_ENGINE_SPEED_RPM = 6500;
        private const int MIN_PULSE_ANGLE_DEG = 100;
        private const int MAX_PULSE_ANGLE_DEG = 190;

        private enum MessageIds
        {
            RequestStatus = 0x01,
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
            SetPulseAngle = 0x0F,
            CurrentStatus = 0x10,
            EngineTest = 0x11,
            CurrentThrottle = 0x12,
            CurrentStarterMotorState = 0x13,
            CurrentFuelPumpOutput = 0x14,
            CurrentPulseWidths = 0x15,
            SetStarterMotor = 0x16,
            UnstableCranking = 0x17,
            StartDynamicTest = 0x18,
            EngineName = 0x19,
            RequestEngineName = 0x1A,
            StopDynamicTest = 0x1B,
            DynamicTestEnded = 0x1C
        }

        public delegate void OnConnectedHandler(object sender, string PortName, int Baudrate, int MajorVersion, int MinorVersion);
        public event OnConnectedHandler OnConnected = null;

        public delegate void OnDisconnectedHandler(object sender);
        public event OnDisconnectedHandler OnDisconnected = null;

        public delegate void OnShowMessageHandler(object sender, string Message);
        public event OnShowMessageHandler OnShowMessage = null;

        public delegate void OnReceivedStatusHandler(object sender, Status CurrentStatus);
        public event OnReceivedStatusHandler OnReceivedStatus = null;

        public delegate void OnReceivedEngineNameHandler(object sender, string EngineName);
        public event OnReceivedEngineNameHandler OnReceivedEngineName = null;

        public delegate void OnDynamicTestStartedHandler(object sender);
        public event OnDynamicTestStartedHandler OnDynamicTestStarted = null;

        public delegate void OnDynamicTestStoppedHandler(object sender);
        public event OnDynamicTestStoppedHandler OnDynamicTestStopped = null;

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

            try
            {
                Connection = EnhancedSerialConnection.Find();
                if (Connection == null)
                {
                    throw new Exception("No ECU tester found. Is it connected to the PC?");
                }

                Session = new ArduinoSession(Connection);
                Session.MessageReceived += Session_MessageReceived;

                var firmware = Session.GetFirmware();

                _DynamicTestRunning = false;

                if (OnConnected != null)
                {
                    OnConnected(this, Connection.PortName, Connection.BaudRate, firmware.MajorVersion, firmware.MinorVersion);
                }

                RequestEngineName();
                RequestStatus();
            }
            catch
            {
                throw new Exception("Unable to connect to ECU tester. Please try again");
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

            if (DynamicTestRunning)
            {
                StopDynamicTest();
                DateTime Wait = DateTime.Now.AddMilliseconds(1000);
                while (DateTime.Now < Wait) ;
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
        /// Tells the tester to send the current status
        /// </summary>
        private void RequestStatus
            (
            )
        {
            byte[] Buffer = new byte[3] { SysExStart, (byte)MessageIds.RequestStatus, SysExEnd };
            Connection.Write(Buffer, 0, 3);
        }

        /// <summary>
        /// Tells the tester to send the engine name
        /// </summary>
        private void RequestEngineName
            (
            )
        {
            byte[] Buffer = new byte[3] { SysExStart, (byte)MessageIds.RequestEngineName, SysExEnd };
            Connection.Write(Buffer, 0, 3);
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
            uint SpeedRPM
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
            uint PositionPcent
            )
        {
            if (PositionPcent < 0) PositionPcent = 0;
            if (PositionPcent > 100) PositionPcent = 100;

            byte[] Buffer = new byte[5] { SysExStart, (byte)MessageIds.SetThrottle, (byte)(PositionPcent & 0xFF), (byte)((PositionPcent >> 8) & 0xFF), SysExEnd };
            Connection.Write(Buffer, 0, 5);
        }

        /// <summary>
        /// Sets the pulse generator dwell angle
        /// </summary>
        /// <param name="AngleDeg">New angle in degrees</param>
        public void SetDwellAngle
            (
            uint AngleDeg
            )
        {
            if (AngleDeg < MIN_PULSE_ANGLE_DEG) AngleDeg = MIN_PULSE_ANGLE_DEG;
            if (AngleDeg > MAX_PULSE_ANGLE_DEG) AngleDeg = MAX_PULSE_ANGLE_DEG;

            byte[] Buffer = new byte[4] { SysExStart, (byte)MessageIds.SetPulseAngle, (byte)AngleDeg, SysExEnd };
            Connection.Write(Buffer, 0, 4);
        }

        /// <summary>
        /// Sets the starter motor state
        /// </summary>
        /// <param name="Running">true if starter is running</param>
        public void SetStarterMotorState
            (
            bool Running
            )
        {
            byte State = (byte)(Running ? 1 : 0);

            byte[] Buffer = new byte[4] { SysExStart, (byte)MessageIds.SetStarterMotor, State, SysExEnd };
            Connection.Write(Buffer, 0, 4);
        }

        /// <summary>
        /// Sends the engine test command
        /// Used for debugging
        /// </summary>
        public void EngineTest
            (
            )
        {
            byte[] Buffer = new byte[3] { SysExStart, (byte)MessageIds.EngineTest, SysExEnd };
            Connection.Write(Buffer, 0, 3);
        }

        /// <summary>
        /// Stops a currently running dynamic test
        /// </summary>
        public void StopDynamicTest
            (
            )
        {
            byte[] Buffer = new byte[3] { SysExStart, (byte)MessageIds.StopDynamicTest, SysExEnd };
            Connection.Write(Buffer, 0, 3);

            _DynamicTestRunning = false;
            if (OnDynamicTestStopped != null) OnDynamicTestStopped(this);
        }

        /// <summary>
        /// Starts the use of dynamic settings
        /// </summary>
        /// <param name="Settings">Settings to use</param>
        public void StartDynamicTest
            (
            DynamicSettings Settings
            )
        {
            if (Settings.UseSpeed)
            {
                if (Settings.StartSpeed > MAX_ENGINE_SPEED_RPM) Settings.StartSpeed = MAX_ENGINE_SPEED_RPM;
                if (Settings.EndSpeed > MAX_ENGINE_SPEED_RPM) Settings.EndSpeed = MAX_ENGINE_SPEED_RPM;
            }

            if (Settings.UseAirTemp)
            {
                if (Settings.StartAirTemp < MIN_AIR_TEMP_F) Settings.StartAirTemp = MIN_AIR_TEMP_F;
                if (Settings.StartAirTemp > MAX_AIR_TEMP_F) Settings.StartAirTemp = MAX_AIR_TEMP_F;
                if (Settings.EndAirTemp < MIN_AIR_TEMP_F) Settings.EndAirTemp = MIN_AIR_TEMP_F;
                if (Settings.EndAirTemp > MAX_AIR_TEMP_F) Settings.EndAirTemp = MAX_AIR_TEMP_F;
            }

            if (Settings.UseCoolantTemp)
            {
                if (Settings.StartCoolantTemp < MIN_COOLANT_TEMP_F) Settings.StartCoolantTemp = MIN_COOLANT_TEMP_F;
                if (Settings.StartCoolantTemp > MAX_COOLANT_TEMP_F) Settings.StartCoolantTemp = MAX_COOLANT_TEMP_F;
                if (Settings.EndCoolantTemp < MIN_COOLANT_TEMP_F) Settings.EndCoolantTemp = MIN_COOLANT_TEMP_F;
                if (Settings.EndCoolantTemp > MAX_COOLANT_TEMP_F) Settings.EndCoolantTemp = MAX_COOLANT_TEMP_F;
            }

            if (Settings.UseStarter)
            {
                if (Settings.StartStarter > Settings.Duration) Settings.StartStarter = Settings.Duration;
                if (Settings.EndStarter > Settings.Duration) Settings.EndStarter = Settings.Duration;
            }

            byte[] Table = Settings.GenerateTable();

            byte[] Buffer = new byte[Table.Length + 3];
            Buffer[0] = SysExStart;
            Buffer[1] = (byte)MessageIds.StartDynamicTest;
            Array.Copy(Table, 0, Buffer, 2, Table.Length);
            Buffer[Table.Length + 2] = SysExEnd;

            Connection.Write(Buffer, 0, Buffer.Length);

            _DynamicTestRunning = true;
            if (OnDynamicTestStarted != null) OnDynamicTestStarted(this);
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
        /// Sets engine to cranking with unstable RPM
        /// </summary>
        public void UsePreset_UnstableCranking() { UsePreset(MessageIds.UnstableCranking); }
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

                if (Buffer[0] == (byte)MessageIds.CurrentStatus)
                {
                    if (Buffer.Length == 25)
                    {
                        CurrentStatus.EngineSpeed = (uint)BitConverter.ToInt32(Buffer, 1);
                        CurrentStatus.CoolantTemperature = (int)BitConverter.ToInt32(Buffer, 5);
                        CurrentStatus.AirTemperature = (int)BitConverter.ToInt32(Buffer, 9);
                        CurrentStatus.Throttle = (uint)BitConverter.ToInt32(Buffer, 13);
                        CurrentStatus.DwellAngle = (uint)BitConverter.ToInt32(Buffer, 17);
                        CurrentStatus.Vacuum = (uint)BitConverter.ToInt32(Buffer, 21);

                        if (OnReceivedStatus != null)
                        {
                            OnReceivedStatus(this, CurrentStatus);
                        }
                    }
                }
                else if ((Buffer[0] == (byte)MessageIds.CurrentThrottle) && (Buffer.Length == 2))
                {
                    CurrentStatus.Throttle = (uint)Buffer[1];
                    if (OnReceivedStatus != null)
                    {
                        OnReceivedStatus(this, CurrentStatus);
                    }
                }
                else if ((Buffer[0] == (byte)MessageIds.CurrentStarterMotorState) && (Buffer.Length == 2))
                {
                    CurrentStatus.StarterMotorOn = Buffer[1] > 0 ? true : false;
                    if (OnReceivedStatus != null)
                    {
                        OnReceivedStatus(this, CurrentStatus);
                    }
                }
                else if ((Buffer[0] == (byte)MessageIds.CurrentFuelPumpOutput) && (Buffer.Length == 2))
                {
                    CurrentStatus.FuelPumpOn = Buffer[1] > 0 ? true : false;
                    if (OnReceivedStatus != null)
                    {
                        OnReceivedStatus(this, CurrentStatus);
                    }
                }
                else if ((Buffer[0] == (byte)MessageIds.CurrentPulseWidths) && (Buffer.Length == 9))
                {
                    CurrentStatus.PulseWidth_I = (UInt16)BitConverter.ToInt16(Buffer, 1);
                    CurrentStatus.PulseWidth_II = (UInt16)BitConverter.ToInt16(Buffer, 3);
                    CurrentStatus.PulseWidth_III = (UInt16)BitConverter.ToInt16(Buffer, 5);
                    CurrentStatus.PulseWidth_IV = (UInt16)BitConverter.ToInt16(Buffer, 7);
                    if (OnReceivedStatus != null)
                    {
                        OnReceivedStatus(this, CurrentStatus);
                    }
                }
                else if (Buffer[0] == (byte)MessageIds.EngineName)
                {
                    string EngineName = Encoding.ASCII.GetString(Buffer, 1, Buffer.Length - 1);
                    if (OnReceivedEngineName != null) OnReceivedEngineName(this, EngineName);
                }
                else if (Buffer[0] == (byte)MessageIds.DynamicTestEnded)
                {
                    _DynamicTestRunning = false;
                    if (OnDynamicTestStopped != null) OnDynamicTestStopped(this);
                }
            }
        }
    }
}
