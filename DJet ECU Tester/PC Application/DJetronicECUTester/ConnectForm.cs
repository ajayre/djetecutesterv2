using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DJetronicStudio
{
    public partial class ConnectForm : Form
    {
        public bool UseTester = false;
        public bool UseSimulation = false;

        public ConnectForm()
        {
            InitializeComponent();

            SimulationBtn.Enabled = false;
            SimulationBtn.BackColor = Color.Gray;
        }

        private void TesterBtn_Click(object sender, EventArgs e)
        {
            DialogResult = DialogResult.OK;
            UseTester = true;
            Close();
        }

        private void SimulationBtn_Click(object sender, EventArgs e)
        {
            DialogResult = DialogResult.OK;
            UseSimulation = true;
            Close();
        }
    }
}
