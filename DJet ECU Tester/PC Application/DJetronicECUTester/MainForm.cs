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

        public MainForm()
        {
            InitializeComponent();

            Tester.OnConnected += Tester_OnConnected;
            Tester.OnDisconnected += Tester_OnDisconnected;
            Tester.OnShowMessage += Tester_OnShowMessage;

            ConnectionStatus.Text = "Not connected";

            UpdateUI();
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
        }

        private Color Orange = Color.FromArgb(255, 128, 0);
        private Color Gray = Color.Gray;

        /// <summary>
        /// Updates the user interface with the current settings
        /// </summary>
        private void UpdateUI
            (
            )
        {
            ConnectBtn.Enabled = !Tester.IsConnected;
            DisconnectBtn.Enabled = Tester.IsConnected;
            CopyInfoBtn.Enabled = Tester.IsConnected;
            Tabs.Enabled = Tester.IsConnected;

            if (Tester.IsConnected)
            {
                TesterInfoBox.BackColor = Orange;
            }
            else
            {
                TesterInfoBox.BackColor = Color.LightGray;
                TesterInfoBox.Text = "";
            }
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
    }
}
