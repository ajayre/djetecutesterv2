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

namespace DJetronicStudio
{
    public partial class MainForm : Form
    {
        private const int DEFAULT_DYNAMIC_TIME_MS = 10000;
        private const int DEFAULT_DYNAMIC_RESOLUTION_MS = 50;

        private ECUTester Tester = new ECUTester();
        private Simulator Sim = new Simulator();

        private DataBuffer Buffer = new DataBuffer();

        private Color Orange = Color.FromArgb(202, 81, 0);
        private bool FirstStatus = true;
        private bool Recording = false;
        private DateTime RecordingStartTime;

        private bool IsConnected
        {
            get
            {
                if (Tester.IsConnected || Sim.IsConnected)
                    return true;
                else
                    return false;
            }
        }

        public MainForm()
        {
            InitializeComponent();

            Tester.OnConnected += Tester_OnConnected;
            Tester.OnDisconnected += Tester_OnDisconnected;
            Tester.OnShowMessage += Tester_OnShowMessage;
            Tester.OnReceivedStatus += Tester_OnReceivedStatus;
            Tester.OnReceivedEngineName += Tester_OnReceivedEngineName;
            Tester.OnDynamicTestStarted += Tester_OnDynamicTestStarted;
            Tester.OnDynamicTestStopped += Tester_OnDynamicTestStopped;

            Sim.OnConnected += Sim_OnConnected;
            Sim.OnDisconnected += Sim_OnDisconnected;

            ConnectionStatus.Text = "Not connected";
            ConnectionStatus.Image = null;
            TesterInfoBox.Text = "";
            EngineNameLabel.Text = "";

#if DEBUG
            Gallery.ImageFolder = Path.GetDirectoryName(Application.ExecutablePath) + @"\..\..\Documentation";
#else
            Tabs.TabPages.Remove(DebugOutputPage);
            Gallery.ImageFolder = Path.GetDirectoryName(Application.ExecutablePath) + @"\Documentation";
#endif
            Gallery.OnShowImage += Gallery_OnShowImage;

            DynamicProgressBar.Style = ProgressBarStyle.Continuous;

            Buffer.OnDataAdded += Buffer_OnDataAdded;
            Buffer.OnDataCleared += Buffer_OnDataCleared;

            Buffer.Clear();

            Chart.Buffer = Buffer;

            ShowInitialSettings();

            UpdateUI();
        }

        /// <summary>
        /// Called when buffer is cleared
        /// </summary>
        /// <param name="sender"></param>
        private void Buffer_OnDataCleared(object sender)
        {
            BufferStatus.Text = "Empty";
            exportCSVToolStripMenuItem.Enabled = false;
            ExportCSVBtn.Enabled = false;
        }

        /// <summary>
        /// Called when data is added to the buffer
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="NumPoints"></param>
        private void Buffer_OnDataAdded(object sender, int NumPoints, DataPoint NewPoint)
        {
            BufferStatus.Text = NumPoints.ToString() + " entries";
            exportCSVToolStripMenuItem.Enabled = true;
            ExportCSVBtn.Enabled = true;
        }

        /// <summary>
        /// The dynamic test has stopped
        /// </summary>
        /// <param name="sender"></param>
        private void Tester_OnDynamicTestStopped(object sender)
        {
            if (InvokeRequired)
            {
                BeginInvoke(new Action<object>(Tester_OnDynamicTestStopped), sender);
                return;
            }

            DynamicProgressBar.Style = ProgressBarStyle.Continuous;
            DynamicStartStopBtn.Text = "Start";
        }

        /// <summary>
        /// A dynamic test has started
        /// </summary>
        /// <param name="sender"></param>
        private void Tester_OnDynamicTestStarted(object sender)
        {
            DynamicProgressBar.Style = ProgressBarStyle.Marquee;
            DynamicStartStopBtn.Text = "Stop";
        }

        /// <summary>
        /// Called when the engine name has been sent from the tester
        /// Displays the name in the window
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="EngineName"></param>
        private void Tester_OnReceivedEngineName(object sender, string EngineName)
        {
            EngineNameLabel.Text = EngineName;
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

            string StatusText = string.Format("Air temp={0}°F, Coolant temp={1}°F, Eng speed={2}RPM, Throttle={3}% PG Angle={4}°, Vacuum={5}inHg, Starter motor={6}",
                CurrentStatus.AirTemperature, CurrentStatus.CoolantTemperature, CurrentStatus.EngineSpeed, CurrentStatus.Throttle,
                CurrentStatus.DwellAngle, CurrentStatus.Pressure, CurrentStatus.StartSignal ? "on" : "off");

            UInt32 AveragePulseWidth = (UInt32)((CurrentStatus.PulseWidth_I + CurrentStatus.PulseWidth_II + CurrentStatus.PulseWidth_III + CurrentStatus.PulseWidth_IV) / 4.0);

            StatusText += Environment.NewLine + string.Format("Fuel pump={0}, Pulse widths I={1:N2}ms II={2:N2}ms III={3:N2}ms IV={4:N2}ms Ave={5:N2}ms",
                CurrentStatus.FuelPumpOn ? "on" : "off",
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

            if (Recording)
            {
                double Timestamp = (DateTime.Now - RecordingStartTime).TotalMilliseconds;
                Buffer.Add(Timestamp, CurrentStatus);
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
            ConnectionStatus.Image = null;
            EngineNameLabel.Text = "";
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
            ConnectionStatus.Text = string.Format("Connected to ECU tester V{0}.{1} on {2}", MajorVersion, MinorVersion, PortName);
            ConnectionStatus.Image = Properties.Resources.tester_24;
            Tester.UsePreset_EngineOff();
            PresetSelector.SelectedIndex = PresetSelector.Items.IndexOf("Engine Off");
            UpdateUI();
        }

        /// <summary>
        /// Called when connected to the simulator
        /// </summary>
        /// <param name="sender">Simulation object</param>
        private void Sim_OnDisconnected(object sender)
        {
            ConnectionStatus.Text = "Not connected";
            ConnectionStatus.Image = null;
            EngineNameLabel.Text = "";
            UpdateUI();
        }

        /// <summary>
        /// Called when connected to the simulator
        /// </summary>
        /// <param name="sender">Simulation object</param>
        private void Sim_OnConnected(object sender)
        {
            ConnectionStatus.Text = string.Format("Connected to simulator");
            ConnectionStatus.Image = Properties.Resources.simulation_24;
            UpdateUI();
        }

        /// <summary>
        /// Called when user clicks on connect button
        /// Finds and connects to tester or simulation
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ConnectBtn_Click(object sender, EventArgs e)
        {
            Connect();
        }

        /// <summary>
        /// Prompts the user to choose what to connect to
        /// </summary>
        private void Connect
            (
            )
        {
            ConnectForm CForm = new ConnectForm();
            if (CForm.ShowDialog() == DialogResult.OK)
            {
                try
                {
                    TesterInfoBox.Text = "";
                    OutputBox.Text = "";
                    Buffer.Clear();

                    if (CForm.UseTester == true)
                    {
                        Tester.Connect();
                    }
                    else if (CForm.UseSimulation == true)
                    {
                        Sim.Connect();
                    }
                }
                catch (Exception Exc)
                {
                    MessageBox.Show(Exc.Message, Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                }
            }
        }

        /// <summary>
        /// Disconnects from hardware/simulator
        /// </summary>
        private void Disconnect
            (
            )
        {
            Tester.Disconnect();
            Sim.Disconnect();
            TesterInfoBox.Text = "";
            Recording = false;
            UpdateUI();
        }

        /// <summary>
        /// Called when user clicks on the disconnect button
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void DisconnectBtn_Click(object sender, EventArgs e)
        {
            Disconnect();
        }

        /// <summary>
        /// Updates the user interface with the current settings
        /// </summary>
        private void UpdateUI
            (
            )
        {
            ConnectBtn.Enabled = !IsConnected;
            connectToolStripMenuItem.Enabled = !IsConnected;
            DisconnectBtn.Enabled = IsConnected;
            disconnectToolStripMenuItem.Enabled = IsConnected;
            CopyInfoBtn.Enabled = IsConnected;

            foreach (TabPage Page in Tabs.TabPages)
            {
                if (Page == DocumentationPage) continue;
                if (Page == DebugOutputPage) continue;
                if (Page == DocumentationPage) continue;

                if ((Page == AutomatedTestPage) && Tester.IsConnected) continue;

                foreach (Control Ctl in Page.Controls)
                {
                    Ctl.Enabled = IsConnected;
                }
            }

            if (IsConnected)
            {
                if (Tester.IsConnected)
                {
                    TesterInfoBoxPanel.BackColor = TesterInfoBox.BackColor = Orange;
                }
                else if (Sim.IsConnected)
                {
                    TesterInfoBoxPanel.BackColor = TesterInfoBox.BackColor = Color.CornflowerBlue;
                }
            }
            else
            {
                TesterInfoBoxPanel.BackColor = TesterInfoBox.BackColor = Color.LightGray;
            }

            startRecordingDataToolStripMenuItem.Enabled = !Recording && IsConnected;
            RecordBtn.Enabled = !Recording && IsConnected;
            stopRecordingDataToolStripMenuItem.Enabled = Recording && IsConnected;
            StopBtn.Enabled = Recording && IsConnected;

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

            StartStarterInput.Enabled = StarterEnable.Checked;
            EndStarterInput.Enabled = StarterEnable.Checked;
            StartStarterLabel1.Enabled = StarterEnable.Checked;
            EndStarterLabel1.Enabled = StarterEnable.Checked;
            StartStarterLabel2.Enabled = StarterEnable.Checked;
            EndStarterLabel2.Enabled = StarterEnable.Checked;

            DynamicProgressBar.Style = ProgressBarStyle.Continuous;
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
            Disconnect();
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
            Connect();
        }

        /// <summary>
        /// Called when user chooses Hardware->Disconnect
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void disconnectToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Disconnect();
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

        private void startRecordingDataToolStripMenuItem_Click(object sender, EventArgs e)
        {
            StartRecording();
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
            Settings.UseStarter = StarterEnable.Checked;

            Settings.StartSpeed = 0;
            Settings.EndSpeed = 0;
            Settings.StartAirTemp = 0;
            Settings.EndAirTemp = 0;
            Settings.StartCoolantTemp = 0;
            Settings.EndCoolantTemp = 0;
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

            Tester.StartDynamicTest(Settings);
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

        private void DynamicStartStopBtn_Click(object sender, EventArgs e)
        {
            if (Tester.DynamicTestRunning)
            {
                Tester.StopDynamicTest();
            }
            else
            {
                StartDynamic();
            }
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

        /// <summary>
        /// Called when user clicks on the record button
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void RecordBtn_Click(object sender, EventArgs e)
        {
            StartRecording();
        }

        /// <summary>
        /// Starts data recording
        /// </summary>
        private void StartRecording
            (
            )
        {
            if (!Recording)
            {
                Recording = true;
                Buffer.Clear();
                RecordingStartTime = DateTime.Now;
                UpdateUI();
            }
        }

        /// <summary>
        /// Stops data recording
        /// </summary>
        private void StopRecording
            (
            )
        {
            if (Recording)
            {
                Recording = false;
                UpdateUI();
            }
        }

        /// <summary>
        /// Called when user chooses to stop recording from the menu
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void stopRecordingDataToolStripMenuItem_Click(object sender, EventArgs e)
        {
            StopRecording();
        }

        /// <summary>
        /// Called when user clicks on the stop recording button
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void StopBtn_Click(object sender, EventArgs e)
        {
            StopRecording();
        }

        private void menuStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        /// <summary>
        /// Exports the recorded data as a CSV file
        /// </summary>
        private void ExportCSV
            (
            )
        {
            if (ExportCSVDialog.ShowDialog() == DialogResult.OK)
            {
                Buffer.ExportCSV(ExportCSVDialog.FileName);
            }
        }

        /// <summary>
        /// Called when user chooses the export csv menu option
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void exportCSVToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ExportCSV();
        }

        /// <summary>
        /// Called when user clicks on the export csv button
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ExportCSVBtn_Click(object sender, EventArgs e)
        {
            ExportCSV();
        }
    }
}
