namespace DJetronicStudio
{
    partial class ChartSettingsForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.OKBtn = new System.Windows.Forms.Button();
            this.CancelBtn = new System.Windows.Forms.Button();
            this.EnableSecondYAxisInput = new System.Windows.Forms.CheckBox();
            this.YAxisTitleInput = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.SecondYAxisMinInput = new System.Windows.Forms.TextBox();
            this.SecondYAxisMinLabel = new System.Windows.Forms.Label();
            this.SecondYAxisMaxLabel = new System.Windows.Forms.Label();
            this.SecondYAxisMaxInput = new System.Windows.Forms.TextBox();
            this.SecondYAxisColorLabel = new System.Windows.Forms.Label();
            this.SecondYAxisColorInput = new System.Windows.Forms.Panel();
            this.ShowOnYAxisLabel = new System.Windows.Forms.Label();
            this.ShowPulseWidthIInput = new System.Windows.Forms.CheckBox();
            this.ShowPulseWidthIIInput = new System.Windows.Forms.CheckBox();
            this.ShowPulseWidthIIIInput = new System.Windows.Forms.CheckBox();
            this.ShowPulseWidthIVInput = new System.Windows.Forms.CheckBox();
            this.ShowFuelPumpInput = new System.Windows.Forms.CheckBox();
            this.ShowEngineSpeedInput = new System.Windows.Forms.CheckBox();
            this.ShowThrottleInput = new System.Windows.Forms.CheckBox();
            this.ShowCoolantTempInput = new System.Windows.Forms.CheckBox();
            this.ShowAirTempInput = new System.Windows.Forms.CheckBox();
            this.ShowVacuumInput = new System.Windows.Forms.CheckBox();
            this.ShowStarterMotorInput = new System.Windows.Forms.CheckBox();
            this.label4 = new System.Windows.Forms.Label();
            this.YAxisMaxInput = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.YAxisMinInput = new System.Windows.Forms.TextBox();
            this.SecondYAxisTitleLabel = new System.Windows.Forms.Label();
            this.SecondYAxisTitleInput = new System.Windows.Forms.TextBox();
            this.YAxisColorInput = new System.Windows.Forms.Panel();
            this.label7 = new System.Windows.Forms.Label();
            this.ColorDialog = new System.Windows.Forms.ColorDialog();
            this.SuspendLayout();
            // 
            // OKBtn
            // 
            this.OKBtn.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.OKBtn.DialogResult = System.Windows.Forms.DialogResult.OK;
            this.OKBtn.Location = new System.Drawing.Point(444, 275);
            this.OKBtn.Name = "OKBtn";
            this.OKBtn.Size = new System.Drawing.Size(75, 23);
            this.OKBtn.TabIndex = 20;
            this.OKBtn.Text = "OK";
            this.OKBtn.UseVisualStyleBackColor = true;
            // 
            // CancelBtn
            // 
            this.CancelBtn.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.CancelBtn.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.CancelBtn.Location = new System.Drawing.Point(363, 275);
            this.CancelBtn.Name = "CancelBtn";
            this.CancelBtn.Size = new System.Drawing.Size(75, 23);
            this.CancelBtn.TabIndex = 21;
            this.CancelBtn.Text = "Cancel";
            this.CancelBtn.UseVisualStyleBackColor = true;
            // 
            // EnableSecondYAxisInput
            // 
            this.EnableSecondYAxisInput.AutoSize = true;
            this.EnableSecondYAxisInput.Location = new System.Drawing.Point(12, 101);
            this.EnableSecondYAxisInput.Name = "EnableSecondYAxisInput";
            this.EnableSecondYAxisInput.Size = new System.Drawing.Size(128, 17);
            this.EnableSecondYAxisInput.TabIndex = 4;
            this.EnableSecondYAxisInput.Text = "Enable second Y axis";
            this.EnableSecondYAxisInput.UseVisualStyleBackColor = true;
            this.EnableSecondYAxisInput.CheckedChanged += new System.EventHandler(this.EnableSecondYAxisInput_CheckedChanged);
            // 
            // YAxisTitleInput
            // 
            this.YAxisTitleInput.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.YAxisTitleInput.Location = new System.Drawing.Point(131, 12);
            this.YAxisTitleInput.Name = "YAxisTitleInput";
            this.YAxisTitleInput.Size = new System.Drawing.Size(388, 20);
            this.YAxisTitleInput.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(63, 15);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(62, 13);
            this.label1.TabIndex = 4;
            this.label1.Text = "Y Axis Title:";
            // 
            // SecondYAxisMinInput
            // 
            this.SecondYAxisMinInput.Location = new System.Drawing.Point(131, 150);
            this.SecondYAxisMinInput.Name = "SecondYAxisMinInput";
            this.SecondYAxisMinInput.Size = new System.Drawing.Size(82, 20);
            this.SecondYAxisMinInput.TabIndex = 6;
            // 
            // SecondYAxisMinLabel
            // 
            this.SecondYAxisMinLabel.AutoSize = true;
            this.SecondYAxisMinLabel.Location = new System.Drawing.Point(44, 153);
            this.SecondYAxisMinLabel.Name = "SecondYAxisMinLabel";
            this.SecondYAxisMinLabel.Size = new System.Drawing.Size(81, 13);
            this.SecondYAxisMinLabel.TabIndex = 6;
            this.SecondYAxisMinLabel.Text = "Minimum Value:";
            // 
            // SecondYAxisMaxLabel
            // 
            this.SecondYAxisMaxLabel.AutoSize = true;
            this.SecondYAxisMaxLabel.Location = new System.Drawing.Point(254, 153);
            this.SecondYAxisMaxLabel.Name = "SecondYAxisMaxLabel";
            this.SecondYAxisMaxLabel.Size = new System.Drawing.Size(84, 13);
            this.SecondYAxisMaxLabel.TabIndex = 8;
            this.SecondYAxisMaxLabel.Text = "Maximum Value:";
            // 
            // SecondYAxisMaxInput
            // 
            this.SecondYAxisMaxInput.Location = new System.Drawing.Point(341, 150);
            this.SecondYAxisMaxInput.Name = "SecondYAxisMaxInput";
            this.SecondYAxisMaxInput.Size = new System.Drawing.Size(82, 20);
            this.SecondYAxisMaxInput.TabIndex = 7;
            // 
            // SecondYAxisColorLabel
            // 
            this.SecondYAxisColorLabel.AutoSize = true;
            this.SecondYAxisColorLabel.Location = new System.Drawing.Point(91, 179);
            this.SecondYAxisColorLabel.Name = "SecondYAxisColorLabel";
            this.SecondYAxisColorLabel.Size = new System.Drawing.Size(34, 13);
            this.SecondYAxisColorLabel.TabIndex = 10;
            this.SecondYAxisColorLabel.Text = "Color:";
            // 
            // SecondYAxisColorInput
            // 
            this.SecondYAxisColorInput.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.SecondYAxisColorInput.Cursor = System.Windows.Forms.Cursors.Hand;
            this.SecondYAxisColorInput.Location = new System.Drawing.Point(131, 176);
            this.SecondYAxisColorInput.Name = "SecondYAxisColorInput";
            this.SecondYAxisColorInput.Size = new System.Drawing.Size(82, 20);
            this.SecondYAxisColorInput.TabIndex = 8;
            this.SecondYAxisColorInput.MouseClick += new System.Windows.Forms.MouseEventHandler(this.SecondYAxisColorInput_MouseClick);
            // 
            // ShowOnYAxisLabel
            // 
            this.ShowOnYAxisLabel.AutoSize = true;
            this.ShowOnYAxisLabel.Location = new System.Drawing.Point(49, 203);
            this.ShowOnYAxisLabel.Name = "ShowOnYAxisLabel";
            this.ShowOnYAxisLabel.Size = new System.Drawing.Size(76, 13);
            this.ShowOnYAxisLabel.TabIndex = 12;
            this.ShowOnYAxisLabel.Text = "Show On Axis:";
            // 
            // ShowPulseWidthIInput
            // 
            this.ShowPulseWidthIInput.AutoSize = true;
            this.ShowPulseWidthIInput.Location = new System.Drawing.Point(131, 202);
            this.ShowPulseWidthIInput.Name = "ShowPulseWidthIInput";
            this.ShowPulseWidthIInput.Size = new System.Drawing.Size(89, 17);
            this.ShowPulseWidthIInput.TabIndex = 9;
            this.ShowPulseWidthIInput.Text = "Pulse Width I";
            this.ShowPulseWidthIInput.UseVisualStyleBackColor = true;
            // 
            // ShowPulseWidthIIInput
            // 
            this.ShowPulseWidthIIInput.AutoSize = true;
            this.ShowPulseWidthIIInput.Location = new System.Drawing.Point(229, 202);
            this.ShowPulseWidthIIInput.Name = "ShowPulseWidthIIInput";
            this.ShowPulseWidthIIInput.Size = new System.Drawing.Size(92, 17);
            this.ShowPulseWidthIIInput.TabIndex = 10;
            this.ShowPulseWidthIIInput.Text = "Pulse Width II";
            this.ShowPulseWidthIIInput.UseVisualStyleBackColor = true;
            // 
            // ShowPulseWidthIIIInput
            // 
            this.ShowPulseWidthIIIInput.AutoSize = true;
            this.ShowPulseWidthIIIInput.Location = new System.Drawing.Point(327, 202);
            this.ShowPulseWidthIIIInput.Name = "ShowPulseWidthIIIInput";
            this.ShowPulseWidthIIIInput.Size = new System.Drawing.Size(95, 17);
            this.ShowPulseWidthIIIInput.TabIndex = 11;
            this.ShowPulseWidthIIIInput.Text = "Pulse Width III";
            this.ShowPulseWidthIIIInput.UseVisualStyleBackColor = true;
            // 
            // ShowPulseWidthIVInput
            // 
            this.ShowPulseWidthIVInput.AutoSize = true;
            this.ShowPulseWidthIVInput.Location = new System.Drawing.Point(428, 202);
            this.ShowPulseWidthIVInput.Name = "ShowPulseWidthIVInput";
            this.ShowPulseWidthIVInput.Size = new System.Drawing.Size(96, 17);
            this.ShowPulseWidthIVInput.TabIndex = 12;
            this.ShowPulseWidthIVInput.Text = "Pulse Width IV";
            this.ShowPulseWidthIVInput.UseVisualStyleBackColor = true;
            // 
            // ShowFuelPumpInput
            // 
            this.ShowFuelPumpInput.AutoSize = true;
            this.ShowFuelPumpInput.Location = new System.Drawing.Point(131, 225);
            this.ShowFuelPumpInput.Name = "ShowFuelPumpInput";
            this.ShowFuelPumpInput.Size = new System.Drawing.Size(76, 17);
            this.ShowFuelPumpInput.TabIndex = 13;
            this.ShowFuelPumpInput.Text = "Fuel Pump";
            this.ShowFuelPumpInput.UseVisualStyleBackColor = true;
            // 
            // ShowEngineSpeedInput
            // 
            this.ShowEngineSpeedInput.AutoSize = true;
            this.ShowEngineSpeedInput.Location = new System.Drawing.Point(229, 225);
            this.ShowEngineSpeedInput.Name = "ShowEngineSpeedInput";
            this.ShowEngineSpeedInput.Size = new System.Drawing.Size(93, 17);
            this.ShowEngineSpeedInput.TabIndex = 14;
            this.ShowEngineSpeedInput.Text = "Engine Speed";
            this.ShowEngineSpeedInput.UseVisualStyleBackColor = true;
            // 
            // ShowThrottleInput
            // 
            this.ShowThrottleInput.AutoSize = true;
            this.ShowThrottleInput.Location = new System.Drawing.Point(327, 225);
            this.ShowThrottleInput.Name = "ShowThrottleInput";
            this.ShowThrottleInput.Size = new System.Drawing.Size(62, 17);
            this.ShowThrottleInput.TabIndex = 15;
            this.ShowThrottleInput.Text = "Throttle";
            this.ShowThrottleInput.UseVisualStyleBackColor = true;
            // 
            // ShowCoolantTempInput
            // 
            this.ShowCoolantTempInput.AutoSize = true;
            this.ShowCoolantTempInput.Location = new System.Drawing.Point(428, 225);
            this.ShowCoolantTempInput.Name = "ShowCoolantTempInput";
            this.ShowCoolantTempInput.Size = new System.Drawing.Size(92, 17);
            this.ShowCoolantTempInput.TabIndex = 16;
            this.ShowCoolantTempInput.Text = "Coolant Temp";
            this.ShowCoolantTempInput.UseVisualStyleBackColor = true;
            // 
            // ShowAirTempInput
            // 
            this.ShowAirTempInput.AutoSize = true;
            this.ShowAirTempInput.Location = new System.Drawing.Point(131, 248);
            this.ShowAirTempInput.Name = "ShowAirTempInput";
            this.ShowAirTempInput.Size = new System.Drawing.Size(68, 17);
            this.ShowAirTempInput.TabIndex = 17;
            this.ShowAirTempInput.Text = "Air Temp";
            this.ShowAirTempInput.UseVisualStyleBackColor = true;
            // 
            // ShowVacuumInput
            // 
            this.ShowVacuumInput.AutoSize = true;
            this.ShowVacuumInput.Location = new System.Drawing.Point(229, 248);
            this.ShowVacuumInput.Name = "ShowVacuumInput";
            this.ShowVacuumInput.Size = new System.Drawing.Size(65, 17);
            this.ShowVacuumInput.TabIndex = 18;
            this.ShowVacuumInput.Text = "Vacuum";
            this.ShowVacuumInput.UseVisualStyleBackColor = true;
            // 
            // ShowStarterMotorInput
            // 
            this.ShowStarterMotorInput.AutoSize = true;
            this.ShowStarterMotorInput.Location = new System.Drawing.Point(327, 248);
            this.ShowStarterMotorInput.Name = "ShowStarterMotorInput";
            this.ShowStarterMotorInput.Size = new System.Drawing.Size(87, 17);
            this.ShowStarterMotorInput.TabIndex = 19;
            this.ShowStarterMotorInput.Text = "Starter Motor";
            this.ShowStarterMotorInput.UseVisualStyleBackColor = true;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(219, 41);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(116, 13);
            this.label4.TabIndex = 27;
            this.label4.Text = "Y Axis Maximum Value:";
            // 
            // YAxisMaxInput
            // 
            this.YAxisMaxInput.Location = new System.Drawing.Point(341, 38);
            this.YAxisMaxInput.Name = "YAxisMaxInput";
            this.YAxisMaxInput.Size = new System.Drawing.Size(82, 20);
            this.YAxisMaxInput.TabIndex = 2;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(12, 41);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(113, 13);
            this.label5.TabIndex = 25;
            this.label5.Text = "Y Axis Minimum Value:";
            // 
            // YAxisMinInput
            // 
            this.YAxisMinInput.Location = new System.Drawing.Point(131, 38);
            this.YAxisMinInput.Name = "YAxisMinInput";
            this.YAxisMinInput.Size = new System.Drawing.Size(82, 20);
            this.YAxisMinInput.TabIndex = 1;
            // 
            // SecondYAxisTitleLabel
            // 
            this.SecondYAxisTitleLabel.AutoSize = true;
            this.SecondYAxisTitleLabel.Location = new System.Drawing.Point(73, 127);
            this.SecondYAxisTitleLabel.Name = "SecondYAxisTitleLabel";
            this.SecondYAxisTitleLabel.Size = new System.Drawing.Size(52, 13);
            this.SecondYAxisTitleLabel.TabIndex = 29;
            this.SecondYAxisTitleLabel.Text = "Axis Title:";
            // 
            // SecondYAxisTitleInput
            // 
            this.SecondYAxisTitleInput.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.SecondYAxisTitleInput.Location = new System.Drawing.Point(131, 124);
            this.SecondYAxisTitleInput.Name = "SecondYAxisTitleInput";
            this.SecondYAxisTitleInput.Size = new System.Drawing.Size(388, 20);
            this.SecondYAxisTitleInput.TabIndex = 5;
            // 
            // YAxisColorInput
            // 
            this.YAxisColorInput.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.YAxisColorInput.Cursor = System.Windows.Forms.Cursors.Hand;
            this.YAxisColorInput.Location = new System.Drawing.Point(131, 64);
            this.YAxisColorInput.Name = "YAxisColorInput";
            this.YAxisColorInput.Size = new System.Drawing.Size(82, 20);
            this.YAxisColorInput.TabIndex = 3;
            this.YAxisColorInput.MouseClick += new System.Windows.Forms.MouseEventHandler(this.YAxisColorInput_MouseClick);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(91, 67);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(34, 13);
            this.label7.TabIndex = 12;
            this.label7.Text = "Color:";
            // 
            // ColorDialog
            // 
            this.ColorDialog.AnyColor = true;
            // 
            // ChartSettingsForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(531, 310);
            this.Controls.Add(this.YAxisColorInput);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.SecondYAxisTitleLabel);
            this.Controls.Add(this.SecondYAxisTitleInput);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.YAxisMaxInput);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.YAxisMinInput);
            this.Controls.Add(this.ShowStarterMotorInput);
            this.Controls.Add(this.ShowVacuumInput);
            this.Controls.Add(this.ShowAirTempInput);
            this.Controls.Add(this.ShowCoolantTempInput);
            this.Controls.Add(this.ShowThrottleInput);
            this.Controls.Add(this.ShowEngineSpeedInput);
            this.Controls.Add(this.ShowFuelPumpInput);
            this.Controls.Add(this.ShowPulseWidthIVInput);
            this.Controls.Add(this.ShowPulseWidthIIIInput);
            this.Controls.Add(this.ShowPulseWidthIIInput);
            this.Controls.Add(this.ShowPulseWidthIInput);
            this.Controls.Add(this.ShowOnYAxisLabel);
            this.Controls.Add(this.SecondYAxisColorInput);
            this.Controls.Add(this.SecondYAxisColorLabel);
            this.Controls.Add(this.SecondYAxisMaxLabel);
            this.Controls.Add(this.SecondYAxisMaxInput);
            this.Controls.Add(this.SecondYAxisMinLabel);
            this.Controls.Add(this.SecondYAxisMinInput);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.YAxisTitleInput);
            this.Controls.Add(this.EnableSecondYAxisInput);
            this.Controls.Add(this.CancelBtn);
            this.Controls.Add(this.OKBtn);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "ChartSettingsForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "Chart Settings";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.ChartSettingsForm_FormClosing);
            this.Shown += new System.EventHandler(this.ChartSettingsForm_Shown);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button OKBtn;
        private System.Windows.Forms.Button CancelBtn;
        private System.Windows.Forms.CheckBox EnableSecondYAxisInput;
        private System.Windows.Forms.TextBox YAxisTitleInput;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox SecondYAxisMinInput;
        private System.Windows.Forms.Label SecondYAxisMinLabel;
        private System.Windows.Forms.Label SecondYAxisMaxLabel;
        private System.Windows.Forms.TextBox SecondYAxisMaxInput;
        private System.Windows.Forms.Label SecondYAxisColorLabel;
        private System.Windows.Forms.Panel SecondYAxisColorInput;
        private System.Windows.Forms.Label ShowOnYAxisLabel;
        private System.Windows.Forms.CheckBox ShowPulseWidthIInput;
        private System.Windows.Forms.CheckBox ShowPulseWidthIIInput;
        private System.Windows.Forms.CheckBox ShowPulseWidthIIIInput;
        private System.Windows.Forms.CheckBox ShowPulseWidthIVInput;
        private System.Windows.Forms.CheckBox ShowFuelPumpInput;
        private System.Windows.Forms.CheckBox ShowEngineSpeedInput;
        private System.Windows.Forms.CheckBox ShowThrottleInput;
        private System.Windows.Forms.CheckBox ShowCoolantTempInput;
        private System.Windows.Forms.CheckBox ShowAirTempInput;
        private System.Windows.Forms.CheckBox ShowVacuumInput;
        private System.Windows.Forms.CheckBox ShowStarterMotorInput;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox YAxisMaxInput;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox YAxisMinInput;
        private System.Windows.Forms.Label SecondYAxisTitleLabel;
        private System.Windows.Forms.TextBox SecondYAxisTitleInput;
        private System.Windows.Forms.Panel YAxisColorInput;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.ColorDialog ColorDialog;
    }
}