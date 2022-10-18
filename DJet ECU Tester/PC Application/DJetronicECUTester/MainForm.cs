using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Windows.Forms;

namespace DJetronicECUTester
{
    public partial class MainForm : Form
    {
        private const int DEFAULT_DYNAMIC_TIME_MS = 10000;
        private const int DEFAULT_DYNAMIC_RESOLUTION_MS = 50;

        private ECUTester Tester = new ECUTester();

        private Color Orange = Color.FromArgb(202, 81, 0);
        private bool FirstStatus = true;

        public MainForm()
        {
            InitializeComponent();

            Tester.OnConnected += Tester_OnConnected;
            Tester.OnDisconnected += Tester_OnDisconnected;
            Tester.OnShowMessage += Tester_OnShowMessage;
            Tester.OnReceivedStatus += Tester_OnReceivedStatus;

            ConnectionStatus.Text = "Not connected";
            TesterInfoBox.Text = "";

#if DEBUG
            Gallery.ImageFolder = Path.GetDirectoryName(Application.ExecutablePath) + @"\..\..\Documentation";
#else
            Tabs.TabPages.Remove(DebugOutputPage);
            Gallery.ImageFolder = Path.GetDirectoryName(Application.ExecutablePath);
#endif
            Gallery.OnShowImage += Gallery_OnShowImage;

            ShowInitialSettings();

            UpdateUI();
        }

        // from: https://stackoverflow.com/questions/76993/how-to-double-buffer-net-controls-on-a-form
        protected override CreateParams CreateParams
        {
            get
            {
                var cp = base.CreateParams;
                cp.ExStyle |= 0x02000000;    // Turn on WS_EX_COMPOSITED
                return cp;
            }
        }

        /// <summary>
        /// Shows the initial settings
        /// </summary>
        private void ShowInitialSettings
            (
            )
        {
            DynamicTimePeriod.Text = DEFAULT_DYNAMIC_TIME_MS.ToString();
            DynamicResolutionInput.Text = DEFAULT_DYNAMIC_RESOLUTION_MS.ToString();
        }

        /// <summary>
        /// Called when user wishes to view an image from the documentation
        /// </summary>
        /// <param name="sender">Gallery</param>
        /// <param name="FileName">Path and name of image</param>
        private void Gallery_OnShowImage(object sender, string FileName, Image image)
        {
            ImageViewerForm Viewer = new ImageViewerForm();
            Viewer.DisplayImage = image;
            Viewer.ImageTitle = Path.GetFileNameWithoutExtension(FileName);
            Viewer.ShowDialog();
        }

        /// <summary>
        /// Status received from tester
        /// </summary>
        /// <param name="sender">Tester that received the status</param>
        /// <param name="CurrentStatus">Current tester status</param>
        private void Tester_OnReceivedStatus(object sender, Status CurrentStatus)
        {
            if (InvokeRequired)
            {
                BeginInvoke(new Action<object, Status>(Tester_OnReceivedStatus), sender, CurrentStatus);
                return;
            }

            string StatusText = string.Format("Air temp={0}°F, Coolant temp={1}°F, Eng speed={2}RPM, Throttle={3}% PG Angle={4}°, Vacuum={5}inHg, Fuel pump={6}, Starter motor={7}",
                CurrentStatus.AirTemperature, CurrentStatus.CoolantTemperature, CurrentStatus.EngineSpeed, CurrentStatus.Throttle,
                CurrentStatus.DwellAngle, CurrentStatus.Pressure, CurrentStatus.FuelPumpOn ? "on" : "off", CurrentStatus.StartSignal ? "on" : "off");

            UInt32 AveragePulseWidth = (UInt32)((CurrentStatus.PulseWidth_I + CurrentStatus.PulseWidth_II + CurrentStatus.PulseWidth_III + CurrentStatus.PulseWidth_IV) / 4.0);

            StatusText += Environment.NewLine + string.Format("Pulse widths I={0:N2}ms II={1:N2}ms III={2:N2}ms IV={3:N2}ms Ave={4:N2}ms",
                CurrentStatus.PulseWidth_I / 1000.0, CurrentStatus.PulseWidth_II / 1000.0, CurrentStatus.PulseWidth_III / 1000.0, CurrentStatus.PulseWidth_IV / 1000.0,
                AveragePulseWidth / 1000.0);

            PressureValue.Text = CurrentStatus.Pressure.ToString();

            if (Tester.IsConnected)
            {
                TesterInfoBox.Text = StatusText;
            }

            if (FirstStatus)
            {
                AirTempInput.Text = CurrentStatus.AirTemperature.ToString();
                CoolantTempInput.Text = CurrentStatus.CoolantTemperature.ToString();
                EngineSpeedInput.Text = CurrentStatus.EngineSpeed.ToString();
                ThrottlePositionInput.Text = CurrentStatus.Throttle.ToString();
                DwellAngleInput.Text = CurrentStatus.DwellAngle.ToString();

                FirstStatus = false;
            }
        }

        /// <summary>
        /// Called when the tester wants to show a message to the user
        /// </summary>
        /// <param name="sender">Tester sending the message</param>
        /// <param name="Message">Message to show</param>
        private void Tester_OnShowMessage(object sender, string Message)
        {
            if (InvokeRequired)
            {
                BeginInvoke(new Action<object, string>(Tester_OnShowMessage), sender, Message);
                return;
            }

            OutputBox.AppendText(Message + Environment.NewLine);
        }

        /// <summary>
        /// Called when disconnected from the tester
        /// </summary>
        /// <param name="sender">Tester object</param>
        private void Tester_OnDisconnected(object sender)
        {
            ConnectionStatus.Text = "Not connected";
            UpdateUI();
        }

        /// <summary>
        /// Called when connected to the tester
        /// </summary>
        /// <param name="sender">Tester object</param>
        /// <param name="PortName">Name of COM port</param>
        /// <param name="Baudrate">Connection speed in bps</param>
        private void Tester_OnConnected(object sender, string PortName, int Baudrate, int MajorVersion, int MinorVersion)
        {
            ConnectionStatus.Text = string.Format("Connected to ECU tester V{0}.{1} on {2} at {3} baud", MajorVersion, MinorVersion, PortName, Baudrate);
            Tester.UsePreset_EngineOff();
            PresetSelector.SelectedIndex = PresetSelector.Items.IndexOf("Engine Off");
            UpdateUI();
        }

        /// <summary>
        /// Called when user clicks on connect button
        /// Finds and connects to tester
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ConnectBtn_Click(object sender, EventArgs e)
        {
            try
            {
                TesterInfoBox.Text = "";
                OutputBox.Text = "";
                Tester.Connect();
            }
            catch (Exception Exc)
            {
                MessageBox.Show(Exc.Message, Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
        }

        /// <summary>
        /// Called when user clicks on the disconnect button
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void DisconnectBtn_Click(object sender, EventArgs e)
        {
            Tester.Disconnect();
            TesterInfoBox.Text = "";
            UpdateUI();
        }

        /// <summary>
        /// Updates the user interface with the current settings
        /// </summary>
        private void UpdateUI
            (
            )
        {
            ConnectBtn.Enabled = !Tester.IsConnected;
            connectToolStripMenuItem.Enabled = !Tester.IsConnected;
            DisconnectBtn.Enabled = Tester.IsConnected;
            disconnectToolStripMenuItem.Enabled = Tester.IsConnected;
            CopyInfoBtn.Enabled = Tester.IsConnected;

            foreach (TabPage Page in Tabs.TabPages)
            {
                if (Page == DocumentationPage) continue;
                if (Page == DebugOutputPage) continue;
                if (Page == DocumentationPage) continue;

                foreach (Control Ctl in Page.Controls)
                {
                    Ctl.Enabled = Tester.IsConnected;
                }
            }

            if (Tester.IsConnected)
            {
                TesterInfoBoxPanel.BackColor = TesterInfoBox.BackColor = Orange;
            }
            else
            {
                TesterInfoBoxPanel.BackColor = TesterInfoBox.BackColor = Color.LightGray;
            }

            RecordBtn.Enabled = Tester.IsConnected;
            startRecordingDataToolStripMenuItem.Enabled = Tester.IsConnected;
            StopBtn.Enabled = Tester.IsConnected;
            stopRecordingDataToolStripMenuItem.Enabled = Tester.IsConnected;

            StartSpeedInput.Enabled = SpeedEnable.Checked;
            EndSpeedInput.Enabled = SpeedEnable.Checked;
            StartSpeedLabel1.Enabled = SpeedEnable.Checked;
            StartSpeedLabel2.Enabled = SpeedEnable.Checked;
            EndSpeedLabel1.Enabled = SpeedEnable.Checked;
            EndSpeedLabel2.Enabled = SpeedEnable.Checked;

            StartAirTempInput.Enabled = AirTempEnable.Checked;
            EndAirTempInput.Enabled = AirTempEnable.Checked;
            StartAirTempLabel1.Enabled = AirTempEnable.Checked;
            EndAirTempLabel2.Enabled = AirTempEnable.Checked;
            StartAirTempLabel2.Enabled = AirTempEnable.Checked;
            EndAirTempLabel1.Enabled = AirTempEnable.Checked;

            StartCoolantTempInput.Enabled = CoolantTempEnable.Checked;
            EndCoolantTempInput.Enabled = CoolantTempEnable.Checked;
            StartCoolantTempLabel1.Enabled = CoolantTempEnable.Checked;
            EndCoolantTempLabel1.Enabled = CoolantTempEnable.Checked;
            StartCoolantTempLabel2.Enabled = CoolantTempEnable.Checked;
            EndCoolantTempLabel2.Enabled = CoolantTempEnable.Checked;

            StartThrottleInput.Enabled = ThrottleEnable.Checked;
            EndThrottleInput.Enabled = ThrottleEnable.Checked;
            StartThrottleLabel1.Enabled = ThrottleEnable.Checked;
            EndThrottleLabel1.Enabled = ThrottleEnable.Checked;
            StartThrottleLabel2.Enabled = ThrottleEnable.Checked;
            EndThrottleLabel2.Enabled = ThrottleEnable.Checked;

            StartStarterInput.Enabled = StarterEnable.Checked;
            EndStarterInput.Enabled = StarterEnable.Checked;
            StartStarterLabel1.Enabled = StarterEnable.Checked;
            EndStarterLabel1.Enabled = StarterEnable.Checked;
            StartStarterLabel2.Enabled = StarterEnable.Checked;
            EndStarterLabel2.Enabled = StarterEnable.Checked;
        }

        /// <summary>
        /// Called when user applies the custom settings
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void CustomSettingsApplyBtn_Click(object sender, EventArgs e)
        {
            int CoolantTemp = 0;
            int.TryParse(CoolantTempInput.Text, out CoolantTemp);

            int AirTemp = 0;
            int.TryParse(AirTempInput.Text, out AirTemp);

            uint ThrottlePosition = 0;
            uint.TryParse(ThrottlePositionInput.Text, out ThrottlePosition);

            uint DwellAngle = 135;
            uint.TryParse(DwellAngleInput.Text, out DwellAngle);

            uint EngineSpeed = 1200;
            uint.TryParse(EngineSpeedInput.Text, out EngineSpeed);

            if (StarterMotorInput.Checked && (EngineSpeed < 1 || EngineSpeed > 300))
            {
                DialogResult Result = MessageBox.Show("The engine speed does not match a running starter motor. Are you sure you wish to use these settings?",
                    Application.ProductName, MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
                if (Result != DialogResult.OK)
                {
                    return;
                }
            }

            Tester.SetCoolantTemperature(CoolantTemp);
            Tester.SetAirTemperature(AirTemp);
            Tester.SetThrottle(ThrottlePosition);
            Tester.SetDwellAngle(DwellAngle);
            Tester.SetEngineSpeed(EngineSpeed);
            Tester.SetStarterMotorState(StarterMotorInput.Checked);
        }

        /// <summary>
        /// Called when user chooses File->Exit
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Tester.Disconnect();
            Close();
        }

        /// <summary>
        /// Called when user chooses Help->About
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void aboutToolStripMenuItem_Click(object sender, EventArgs e)
        {
            AboutForm AForm = new AboutForm();
            AForm.Version = string.Format("Version {0}", Application.ProductVersion);
            AForm.ShowDialog();
        }

        /// <summary>
        /// Called when user chooses Hardware->Connect
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void connectToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                TesterInfoBox.Text = "";
                OutputBox.Text = "";
                Tester.Connect();
            }
            catch (Exception Exc)
            {
                MessageBox.Show(Exc.Message, Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
        }

        /// <summary>
        /// Called when user chooses Hardware->Disconnect
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void disconnectToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Tester.Disconnect();
        }

        /// <summary>
        /// Called when user clicks on the copy button
        /// Copies the current tester status to the clipboard
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void CopyInfoBtn_Click(object sender, EventArgs e)
        {
            Clipboard.SetText(TesterInfoBox.Text);
        }

        private void startRecordingPulseWidthsToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Called when user clicks on apply to set a preset
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ApplyPresetBtn_Click(object sender, EventArgs e)
        {
            string Preset = (string)PresetSelector.SelectedItem;

            if (Preset == "Engine Off") Tester.UsePreset_EngineOff();
            else if (Preset == "Cranking") Tester.UsePreset_Cranking();
            else if (Preset == "Cold Idle") Tester.UsePreset_ColdIdle();
            else if (Preset == "Hot Idle") Tester.UsePreset_HotIdle();
            else if (Preset == "Cruise 30MPH") Tester.UsePreset_Cruise30MPH();
            else if (Preset == "Cruise 70MPH") Tester.UsePreset_Cruise70MPH();
            else if (Preset == "Gentle Acceleration") Tester.UsePreset_GentleAcceleration();
            else if (Preset == "Moderate Acceleration") Tester.UsePreset_ModerateAcceleration();
            else if (Preset == "Hard Acceleration") Tester.UsePreset_HardAcceleration();
            else if (Preset == "Cranking (Unstable RPM)") Tester.UsePreset_UnstableCranking();
        }

        /// <summary>
        /// Starts the dynamic simulation
        /// </summary>
        private void StartDynamic
            (
            )
        {
            DynamicSettings Settings = new DynamicSettings();

            if (!uint.TryParse(DynamicTimePeriod.Text, out Settings.Duration))
            {
                MessageBox.Show("Invalid period for dynamic test", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }
            
            if (Settings.Duration < 100)
            {
                MessageBox.Show("Dynamic test must be at least 100ms long", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }

            if (!uint.TryParse(DynamicResolutionInput.Text, out Settings.Resolution))
            {
                Settings.Resolution = 10;
            }

            Settings.UseSpeed = SpeedEnable.Checked;
            Settings.UseAirTemp = AirTempEnable.Checked;
            Settings.UseCoolantTemp = CoolantTempEnable.Checked;
            Settings.UseThrottle = ThrottleEnable.Checked;
            Settings.UseStarter = StarterEnable.Checked;

            Settings.StartSpeed = 0;
            Settings.EndSpeed = 0;
            Settings.StartAirTemp = 0;
            Settings.EndAirTemp = 0;
            Settings.StartCoolantTemp = 0;
            Settings.EndCoolantTemp = 0;
            Settings.StartThrottle = 0;
            Settings.EndThrottle = 0;
            Settings.StartStarter = 0;
            Settings.EndStarter = 0;

            if (SpeedEnable.Checked)
            {
                if (!uint.TryParse(StartSpeedInput.Text, out Settings.StartSpeed)) Settings.UseSpeed = false;
                if (!uint.TryParse(EndSpeedInput.Text, out Settings.EndSpeed)) Settings.UseSpeed = false;
            }

            if (AirTempEnable.Checked)
            {
                if (!int.TryParse(StartAirTempInput.Text, out Settings.StartAirTemp)) Settings.UseAirTemp = false;
                if (!int.TryParse(EndAirTempInput.Text, out Settings.EndAirTemp)) Settings.UseAirTemp = false;
            }

            if (CoolantTempEnable.Checked)
            {
                if (!int.TryParse(StartCoolantTempInput.Text, out Settings.StartCoolantTemp)) Settings.UseCoolantTemp = false;
                if (!int.TryParse(EndCoolantTempInput.Text, out Settings.EndCoolantTemp)) Settings.UseCoolantTemp = false;
            }

            if (ThrottleEnable.Checked)
            {
                if (!uint.TryParse(StartThrottleInput.Text, out Settings.StartThrottle)) Settings.UseThrottle = false;
                if (!uint.TryParse(EndThrottleInput.Text, out Settings.EndThrottle)) Settings.UseThrottle = false;
            }

            if (StarterEnable.Checked)
            {
                if (!uint.TryParse(StartStarterInput.Text, out Settings.StartStarter)) Settings.UseStarter = false;
                if (!uint.TryParse(EndStarterInput.Text, out Settings.EndStarter)) Settings.UseStarter = false;
            }

            if (Settings.StartStarter > Settings.EndStarter)
            {
                MessageBox.Show("Starter motor off time must be later than the on time", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }

            Tester.UseDynamicSettings(Settings);
        }

        /// <summary>
        /// Called when user clicks on the engine test button
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void EngineTestBtn_Click(object sender, EventArgs e)
        {
            Tester.EngineTest();
        }

        private void DynamicStartBtn_Click(object sender, EventArgs e)
        {
            StartDynamic();
        }

        private void SpeedEnable_CheckedChanged(object sender, EventArgs e)
        {
            UpdateUI();
        }

        private void StarterEnable_CheckedChanged(object sender, EventArgs e)
        {
            UpdateUI();
        }

        private void AirTempEnable_CheckedChanged(object sender, EventArgs e)
        {
            UpdateUI();
        }

        private void CoolantTempEnable_CheckedChanged(object sender, EventArgs e)
        {
            UpdateUI();
        }

        private void ThrottleEnable_CheckedChanged(object sender, EventArgs e)
        {
            UpdateUI();
        }
    }
}
