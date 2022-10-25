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
    public partial class ChartSettingsForm : Form
    {
        /// <summary>
        /// The current settings
        /// </summary>
        public ChartSettings Settings;

        public ChartSettingsForm()
        {
            InitializeComponent();

            SecondYAxisColorInput.Tag = Color.Orange;

            UpdateUI();
        }

        /// <summary>
        /// Enables/disables user interface settings
        /// </summary>
        private void UpdateUI
            (
            )
        {
            SecondYAxisTitleInput.Enabled = EnableSecondYAxisInput.Checked;
            SecondYAxisTitleLabel.Enabled = EnableSecondYAxisInput.Checked;
            SecondYAxisMinInput.Enabled = EnableSecondYAxisInput.Checked;
            SecondYAxisMinLabel.Enabled = EnableSecondYAxisInput.Checked;
            SecondYAxisMaxInput.Enabled = EnableSecondYAxisInput.Checked;
            SecondYAxisMaxLabel.Enabled = EnableSecondYAxisInput.Checked;
            SecondYAxisColorInput.Enabled = EnableSecondYAxisInput.Checked;
            SecondYAxisColorInput.BorderStyle = EnableSecondYAxisInput.Checked ? BorderStyle.FixedSingle : BorderStyle.None;
            SecondYAxisColorInput.BackColor = EnableSecondYAxisInput.Checked ? (Color)SecondYAxisColorInput.Tag : Color.LightGray;
            SecondYAxisColorLabel.Enabled = EnableSecondYAxisInput.Checked;
            ShowOnYAxisLabel.Enabled = EnableSecondYAxisInput.Checked;
            ShowPulseWidthIInput.Enabled = EnableSecondYAxisInput.Checked;
            ShowPulseWidthIIInput.Enabled = EnableSecondYAxisInput.Checked;
            ShowPulseWidthIIIInput.Enabled = EnableSecondYAxisInput.Checked;
            ShowPulseWidthIVInput.Enabled = EnableSecondYAxisInput.Checked;
            ShowFuelPumpInput.Enabled = EnableSecondYAxisInput.Checked;
            ShowEngineSpeedInput.Enabled = EnableSecondYAxisInput.Checked;
            ShowThrottleInput.Enabled = EnableSecondYAxisInput.Checked;
            ShowCoolantTempInput.Enabled = EnableSecondYAxisInput.Checked;
            ShowAirTempInput.Enabled = EnableSecondYAxisInput.Checked;
            ShowVacuumInput.Enabled = EnableSecondYAxisInput.Checked;
            ShowStarterMotorInput.Enabled = EnableSecondYAxisInput.Checked;
        }

        /// <summary>
        /// Called when user enables/disables the second Y axis
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void EnableSecondYAxisInput_CheckedChanged(object sender, EventArgs e)
        {
            UpdateUI();
        }

        /// <summary>
        /// Called when user clicks on the swatch to change the Y axis color
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void YAxisColorInput_MouseClick(object sender, MouseEventArgs e)
        {
            ColorDialog.Color = YAxisColorInput.BackColor;
            if (ColorDialog.ShowDialog() == DialogResult.OK)
            {
                YAxisColorInput.BackColor = ColorDialog.Color;
            }
        }

        /// <summary>
        /// Called when user clicks on the swatch to change the second Y axis color
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void SecondYAxisColorInput_MouseClick(object sender, MouseEventArgs e)
        {
            ColorDialog.Color = SecondYAxisColorInput.BackColor;
            if (ColorDialog.ShowDialog() == DialogResult.OK)
            {
                SecondYAxisColorInput.BackColor = ColorDialog.Color;
                SecondYAxisColorInput.Tag = ColorDialog.Color;
            }
        }

        /// <summary>
        /// Shows the current settings
        /// </summary>
        private void ShowSettings
            (
            )
        {
            if (Settings == null) return;

            TitleInput.Text = Settings.Title;

            YAxisTitleInput.Text = Settings.YAxisTitle;
            YAxisMinInput.Text = Settings.MinY.ToString();
            YAxisMaxInput.Text = Settings.MaxY.ToString();
            YAxisColorInput.BackColor = Settings.YColor;

            EnableSecondYAxisInput.Checked = Settings.EnableSecondYAxis;
            SecondYAxisTitleInput.Text = Settings.SecondYAxisTitle;
            SecondYAxisMinInput.Text = Settings.SecondYAxisMin.ToString();
            SecondYAxisMaxInput.Text = Settings.SecondYAxisMax.ToString();
            SecondYAxisColorInput.Tag = Settings.SecondYAxisColor;
            if (Settings.EnableSecondYAxis) SecondYAxisColorInput.BackColor = Settings.SecondYAxisColor;

            ShowPulseWidthIInput.Checked = Settings.SecondYAxisShowPulseWidthI;
            ShowPulseWidthIIInput.Checked = Settings.SecondYAxisShowPulseWidthII;
            ShowPulseWidthIIIInput.Checked = Settings.SecondYAxisShowPulseWidthIII;
            ShowPulseWidthIVInput.Checked = Settings.SecondYAxisShowPulseWidthIV;
            ShowFuelPumpInput.Checked = Settings.SecondYAxisShowFuelPump;
            ShowEngineSpeedInput.Checked = Settings.SecondYAxisShowEngineSpeed;
            ShowThrottleInput.Checked = Settings.SecondYAxisShowThrottle;
            ShowCoolantTempInput.Checked = Settings.SecondYAxisShowCoolantTemperature;
            ShowAirTempInput.Checked = Settings.SecondYAxisShowAirTemperature;
            ShowVacuumInput.Checked = Settings.SecondYAxisShowVacuum;
            ShowStarterMotorInput.Checked = Settings.SecondYAxisShowStaterMotor;
        }

        /// <summary>
        /// Applies the current settings
        /// </summary>
        private void ApplySettings
            (
            )
        {
            if (Settings == null) return;

            Settings.Title = TitleInput.Text;

            Settings.YAxisTitle = YAxisTitleInput.Text;
            if (!double.TryParse(YAxisMinInput.Text, out Settings.MinY)) Settings.MinY = 0;
            if (!double.TryParse(YAxisMaxInput.Text, out Settings.MaxY)) Settings.MaxY = 10;
            Settings.YColor = YAxisColorInput.BackColor;

            Settings.EnableSecondYAxis = EnableSecondYAxisInput.Checked;
            Settings.SecondYAxisTitle = SecondYAxisTitleInput.Text;
            if (!double.TryParse(SecondYAxisMinInput.Text, out Settings.SecondYAxisMin)) Settings.SecondYAxisMin = 0;
            if (!double.TryParse(SecondYAxisMaxInput.Text, out Settings.SecondYAxisMax)) Settings.SecondYAxisMax = 10;
            Settings.SecondYAxisColor = (Color)SecondYAxisColorInput.Tag;

            Settings.SecondYAxisShowPulseWidthI = ShowPulseWidthIInput.Checked;
            Settings.SecondYAxisShowPulseWidthII = ShowPulseWidthIIInput.Checked;
            Settings.SecondYAxisShowPulseWidthIII = ShowPulseWidthIIIInput.Checked;
            Settings.SecondYAxisShowPulseWidthIV = ShowPulseWidthIVInput.Checked;
            Settings.SecondYAxisShowFuelPump = ShowFuelPumpInput.Checked;
            Settings.SecondYAxisShowEngineSpeed = ShowEngineSpeedInput.Checked;
            Settings.SecondYAxisShowThrottle = ShowThrottleInput.Checked;
            Settings.SecondYAxisShowCoolantTemperature = ShowCoolantTempInput.Checked;
            Settings.SecondYAxisShowAirTemperature = ShowAirTempInput.Checked;
            Settings.SecondYAxisShowVacuum = ShowVacuumInput.Checked;
            Settings.SecondYAxisShowStaterMotor = ShowStarterMotorInput.Checked;

            if (Settings.MinY >= Settings.MaxY) Settings.MinY = Settings.MaxY + 1;
            if (Settings.SecondYAxisMin >= Settings.SecondYAxisMax) Settings.SecondYAxisMin = Settings.SecondYAxisMax + 1;
        }

        /// <summary>
        /// Called when form is shown
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ChartSettingsForm_Shown(object sender, EventArgs e)
        {
            ShowSettings();
        }

        /// <summary>
        /// Called when the form is closing
        /// Applies the settings if OK was clicked
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ChartSettingsForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (DialogResult == DialogResult.OK)
            {
                ApplySettings();
            }
        }
    }
}
