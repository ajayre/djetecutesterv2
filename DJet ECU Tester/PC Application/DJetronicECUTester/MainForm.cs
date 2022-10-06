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
        private ECUTester Tester = new ECUTester();

        private Color Orange = Color.FromArgb(202, 81, 0);

        public MainForm()
        {
            InitializeComponent();

            Tester.OnConnected += Tester_OnConnected;
            Tester.OnDisconnected += Tester_OnDisconnected;
            Tester.OnShowMessage += Tester_OnShowMessage;
            Tester.OnReceivedStatus += Tester_OnReceivedStatus;

            ConnectionStatus.Text = "Not connected";
            TesterInfoBox.Text = "";

            UpdateUI();
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

            string StatusText = string.Format("Air temp={0}°F, Coolant temp={1}°F, Eng speed={2}RPM, Throttle={3}% PG Angle={4}°, Fuel pump={5}, Cold start={6}, Cranking={7}",
                CurrentStatus.AirTemperature, CurrentStatus.CoolantTemperature, CurrentStatus.EngineSpeed, CurrentStatus.Throttle,
                CurrentStatus.PulseAngle, CurrentStatus.FuelPumpOn ? "on" : "off", CurrentStatus.ColdStartOn ? "on" : "off",
                CurrentStatus.Cranking ? "yes" : "no");

            StatusText += Environment.NewLine + string.Format("Pulse widths I={0}ms II={1}ms III={2}ms IV={0}ms",
                CurrentStatus.PulseWidth_I, CurrentStatus.PulseWidth_II, CurrentStatus.PulseWidth_III, CurrentStatus.PulseWidth_IV);

            if (Tester.IsConnected)
            {
                TesterInfoBox.Text = StatusText;
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
            Tabs.Enabled = Tester.IsConnected;

            if (Tester.IsConnected)
            {
                TesterInfoBoxPanel.BackColor = TesterInfoBox.BackColor = Orange;
            }
            else
            {
                TesterInfoBoxPanel.BackColor = TesterInfoBox.BackColor = Color.LightGray;
            }

            RecordBtn.Enabled = Tester.IsConnected;
            startRecordingPulseWidthsToolStripMenuItem.Enabled = Tester.IsConnected;
            StopBtn.Enabled = Tester.IsConnected;
            stopRecordingPulseWidthsToolStripMenuItem.Enabled = Tester.IsConnected;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Tester.SetCoolantTemperature(50);
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
    }
}
