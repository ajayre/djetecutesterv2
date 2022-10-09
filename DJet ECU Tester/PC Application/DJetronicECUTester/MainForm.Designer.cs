namespace DJetronicECUTester
{
    partial class MainForm
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
            this.CustomSettingsApplyBtn = new System.Windows.Forms.Button();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.ConnectionStatus = new System.Windows.Forms.ToolStripStatusLabel();
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.Tabs = new System.Windows.Forms.TabControl();
            this.StaticPage = new System.Windows.Forms.TabPage();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.label10 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.EngineSpeedInput = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.DwellAngleInput = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.ThrottlePositionInput = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.AirTempInput = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.CoolantTempInput = new System.Windows.Forms.TextBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.ApplyPresetBtn = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.PresetSelector = new System.Windows.Forms.ComboBox();
            this.DynamicPage = new System.Windows.Forms.TabPage();
            this.TestPage = new System.Windows.Forms.TabPage();
            this.button3 = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.OutputPage = new System.Windows.Forms.TabPage();
            this.OutputBox = new System.Windows.Forms.TextBox();
            this.cartesianChart1 = new LiveChartsCore.SkiaSharpView.WinForms.CartesianChart();
            this.TesterInfoBox = new System.Windows.Forms.TextBox();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.fileToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.exitToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.hardwareToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.connectToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.disconnectToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.optionsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.startRecordingPulseWidthsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.stopRecordingPulseWidthsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.helpToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.aboutToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.ConnectBtn = new System.Windows.Forms.ToolStripButton();
            this.DisconnectBtn = new System.Windows.Forms.ToolStripButton();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.RecordBtn = new System.Windows.Forms.ToolStripButton();
            this.StopBtn = new System.Windows.Forms.ToolStripButton();
            this.toolTip1 = new System.Windows.Forms.ToolTip(this.components);
            this.CopyInfoBtn = new System.Windows.Forms.Button();
            this.TesterInfoBoxPanel = new System.Windows.Forms.Panel();
            this.EngineTestBtn = new System.Windows.Forms.Button();
            this.statusStrip1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).BeginInit();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.Tabs.SuspendLayout();
            this.StaticPage.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.TestPage.SuspendLayout();
            this.OutputPage.SuspendLayout();
            this.menuStrip1.SuspendLayout();
            this.toolStrip1.SuspendLayout();
            this.TesterInfoBoxPanel.SuspendLayout();
            this.SuspendLayout();
            // 
            // CustomSettingsApplyBtn
            // 
            this.CustomSettingsApplyBtn.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.CustomSettingsApplyBtn.Location = new System.Drawing.Point(876, 237);
            this.CustomSettingsApplyBtn.Name = "CustomSettingsApplyBtn";
            this.CustomSettingsApplyBtn.Size = new System.Drawing.Size(75, 23);
            this.CustomSettingsApplyBtn.TabIndex = 1;
            this.CustomSettingsApplyBtn.Text = "Apply";
            this.CustomSettingsApplyBtn.UseVisualStyleBackColor = true;
            this.CustomSettingsApplyBtn.Click += new System.EventHandler(this.CustomSettingsApplyBtn_Click);
            // 
            // statusStrip1
            // 
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.ConnectionStatus});
            this.statusStrip1.Location = new System.Drawing.Point(0, 640);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(979, 22);
            this.statusStrip1.TabIndex = 3;
            this.statusStrip1.Text = "StatusStrip";
            // 
            // ConnectionStatus
            // 
            this.ConnectionStatus.Name = "ConnectionStatus";
            this.ConnectionStatus.Size = new System.Drawing.Size(101, 17);
            this.ConnectionStatus.Text = "ConnectionStatus";
            // 
            // splitContainer1
            // 
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.Location = new System.Drawing.Point(0, 101);
            this.splitContainer1.Name = "splitContainer1";
            this.splitContainer1.Orientation = System.Windows.Forms.Orientation.Horizontal;
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.Tabs);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.cartesianChart1);
            this.splitContainer1.Size = new System.Drawing.Size(979, 539);
            this.splitContainer1.SplitterDistance = 366;
            this.splitContainer1.TabIndex = 4;
            // 
            // Tabs
            // 
            this.Tabs.Controls.Add(this.StaticPage);
            this.Tabs.Controls.Add(this.DynamicPage);
            this.Tabs.Controls.Add(this.TestPage);
            this.Tabs.Controls.Add(this.OutputPage);
            this.Tabs.Dock = System.Windows.Forms.DockStyle.Fill;
            this.Tabs.Location = new System.Drawing.Point(0, 0);
            this.Tabs.Name = "Tabs";
            this.Tabs.SelectedIndex = 0;
            this.Tabs.Size = new System.Drawing.Size(979, 366);
            this.Tabs.TabIndex = 2;
            // 
            // StaticPage
            // 
            this.StaticPage.Controls.Add(this.groupBox2);
            this.StaticPage.Controls.Add(this.groupBox1);
            this.StaticPage.Location = new System.Drawing.Point(4, 22);
            this.StaticPage.Name = "StaticPage";
            this.StaticPage.Padding = new System.Windows.Forms.Padding(3);
            this.StaticPage.Size = new System.Drawing.Size(971, 340);
            this.StaticPage.TabIndex = 0;
            this.StaticPage.Text = "Static";
            this.StaticPage.UseVisualStyleBackColor = true;
            // 
            // groupBox2
            // 
            this.groupBox2.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox2.Controls.Add(this.label10);
            this.groupBox2.Controls.Add(this.label11);
            this.groupBox2.Controls.Add(this.EngineSpeedInput);
            this.groupBox2.Controls.Add(this.label8);
            this.groupBox2.Controls.Add(this.label9);
            this.groupBox2.Controls.Add(this.DwellAngleInput);
            this.groupBox2.Controls.Add(this.label6);
            this.groupBox2.Controls.Add(this.label7);
            this.groupBox2.Controls.Add(this.ThrottlePositionInput);
            this.groupBox2.Controls.Add(this.label4);
            this.groupBox2.Controls.Add(this.label5);
            this.groupBox2.Controls.Add(this.AirTempInput);
            this.groupBox2.Controls.Add(this.label3);
            this.groupBox2.Controls.Add(this.label2);
            this.groupBox2.Controls.Add(this.CoolantTempInput);
            this.groupBox2.Controls.Add(this.CustomSettingsApplyBtn);
            this.groupBox2.Location = new System.Drawing.Point(6, 68);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(957, 266);
            this.groupBox2.TabIndex = 3;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Customize";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(227, 76);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(31, 13);
            this.label10.TabIndex = 16;
            this.label10.Text = "RPM";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(38, 76);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(77, 13);
            this.label11.TabIndex = 15;
            this.label11.Text = "Engine Speed:";
            // 
            // EngineSpeedInput
            // 
            this.EngineSpeedInput.Location = new System.Drawing.Point(121, 73);
            this.EngineSpeedInput.Name = "EngineSpeedInput";
            this.EngineSpeedInput.Size = new System.Drawing.Size(100, 20);
            this.EngineSpeedInput.TabIndex = 14;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(491, 53);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(11, 13);
            this.label8.TabIndex = 13;
            this.label8.Text = "°";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(313, 53);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(66, 13);
            this.label9.TabIndex = 12;
            this.label9.Text = "Dwell Angle:";
            // 
            // DwellAngleInput
            // 
            this.DwellAngleInput.Location = new System.Drawing.Point(385, 50);
            this.DwellAngleInput.Name = "DwellAngleInput";
            this.DwellAngleInput.Size = new System.Drawing.Size(100, 20);
            this.DwellAngleInput.TabIndex = 11;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(227, 50);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(15, 13);
            this.label6.TabIndex = 10;
            this.label6.Text = "%";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(29, 50);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(86, 13);
            this.label7.TabIndex = 9;
            this.label7.Text = "Throttle Position:";
            // 
            // ThrottlePositionInput
            // 
            this.ThrottlePositionInput.Location = new System.Drawing.Point(121, 47);
            this.ThrottlePositionInput.Name = "ThrottlePositionInput";
            this.ThrottlePositionInput.Size = new System.Drawing.Size(100, 20);
            this.ThrottlePositionInput.TabIndex = 8;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(491, 24);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(88, 13);
            this.label4.TabIndex = 7;
            this.label4.Text = "°F (-20°F to 32°F)";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(294, 24);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(85, 13);
            this.label5.TabIndex = 6;
            this.label5.Text = "Air Temperature:";
            // 
            // AirTempInput
            // 
            this.AirTempInput.Location = new System.Drawing.Point(385, 21);
            this.AirTempInput.Name = "AirTempInput";
            this.AirTempInput.Size = new System.Drawing.Size(100, 20);
            this.AirTempInput.TabIndex = 5;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(227, 24);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(17, 13);
            this.label3.TabIndex = 4;
            this.label3.Text = "°F";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(6, 24);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(109, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Coolant Temperature:";
            // 
            // CoolantTempInput
            // 
            this.CoolantTempInput.Location = new System.Drawing.Point(121, 21);
            this.CoolantTempInput.Name = "CoolantTempInput";
            this.CoolantTempInput.Size = new System.Drawing.Size(100, 20);
            this.CoolantTempInput.TabIndex = 2;
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox1.Controls.Add(this.ApplyPresetBtn);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.PresetSelector);
            this.groupBox1.Location = new System.Drawing.Point(6, 6);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(957, 56);
            this.groupBox1.TabIndex = 2;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Presets";
            // 
            // ApplyPresetBtn
            // 
            this.ApplyPresetBtn.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.ApplyPresetBtn.Location = new System.Drawing.Point(876, 17);
            this.ApplyPresetBtn.Name = "ApplyPresetBtn";
            this.ApplyPresetBtn.Size = new System.Drawing.Size(75, 23);
            this.ApplyPresetBtn.TabIndex = 2;
            this.ApplyPresetBtn.Text = "Apply";
            this.ApplyPresetBtn.UseVisualStyleBackColor = true;
            this.ApplyPresetBtn.Click += new System.EventHandler(this.ApplyPresetBtn_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(75, 22);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(40, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Preset:";
            // 
            // PresetSelector
            // 
            this.PresetSelector.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.PresetSelector.FormattingEnabled = true;
            this.PresetSelector.Items.AddRange(new object[] {
            "Engine Off",
            "Cranking",
            "Cold Idle",
            "Hot Idle",
            "Cruise 30MPH",
            "Cruise 70MPH",
            "Gentle Acceleration",
            "Moderate Acceleration",
            "Hard Acceleration"});
            this.PresetSelector.Location = new System.Drawing.Point(121, 19);
            this.PresetSelector.Name = "PresetSelector";
            this.PresetSelector.Size = new System.Drawing.Size(749, 21);
            this.PresetSelector.TabIndex = 0;
            // 
            // DynamicPage
            // 
            this.DynamicPage.Location = new System.Drawing.Point(4, 22);
            this.DynamicPage.Name = "DynamicPage";
            this.DynamicPage.Padding = new System.Windows.Forms.Padding(3);
            this.DynamicPage.Size = new System.Drawing.Size(971, 340);
            this.DynamicPage.TabIndex = 1;
            this.DynamicPage.Text = "Dynamic";
            this.DynamicPage.UseVisualStyleBackColor = true;
            // 
            // TestPage
            // 
            this.TestPage.Controls.Add(this.button3);
            this.TestPage.Controls.Add(this.button1);
            this.TestPage.Location = new System.Drawing.Point(4, 22);
            this.TestPage.Name = "TestPage";
            this.TestPage.Padding = new System.Windows.Forms.Padding(3);
            this.TestPage.Size = new System.Drawing.Size(971, 340);
            this.TestPage.TabIndex = 2;
            this.TestPage.Text = "Automated Testing";
            this.TestPage.UseVisualStyleBackColor = true;
            // 
            // button3
            // 
            this.button3.Image = global::DJetronicECUTester.Properties.Resources.stop_64;
            this.button3.Location = new System.Drawing.Point(94, 6);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(80, 80);
            this.button3.TabIndex = 2;
            this.button3.UseVisualStyleBackColor = true;
            // 
            // button1
            // 
            this.button1.Image = global::DJetronicECUTester.Properties.Resources.examine_64;
            this.button1.Location = new System.Drawing.Point(8, 6);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(80, 80);
            this.button1.TabIndex = 0;
            this.button1.Text = "button1";
            this.button1.UseVisualStyleBackColor = true;
            // 
            // OutputPage
            // 
            this.OutputPage.Controls.Add(this.EngineTestBtn);
            this.OutputPage.Controls.Add(this.OutputBox);
            this.OutputPage.Location = new System.Drawing.Point(4, 22);
            this.OutputPage.Name = "OutputPage";
            this.OutputPage.Padding = new System.Windows.Forms.Padding(3);
            this.OutputPage.Size = new System.Drawing.Size(971, 340);
            this.OutputPage.TabIndex = 3;
            this.OutputPage.Text = "Tester Output";
            this.OutputPage.UseVisualStyleBackColor = true;
            // 
            // OutputBox
            // 
            this.OutputBox.Location = new System.Drawing.Point(3, 3);
            this.OutputBox.Multiline = true;
            this.OutputBox.Name = "OutputBox";
            this.OutputBox.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.OutputBox.Size = new System.Drawing.Size(965, 302);
            this.OutputBox.TabIndex = 0;
            // 
            // cartesianChart1
            // 
            this.cartesianChart1.AllowPanning = true;
            this.cartesianChart1.BackColor = System.Drawing.Color.White;
            this.cartesianChart1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cartesianChart1.Location = new System.Drawing.Point(0, 0);
            this.cartesianChart1.Name = "cartesianChart1";
            this.cartesianChart1.Size = new System.Drawing.Size(979, 169);
            this.cartesianChart1.TabIndex = 0;
            // 
            // TesterInfoBox
            // 
            this.TesterInfoBox.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(202)))), ((int)(((byte)(81)))), ((int)(((byte)(0)))));
            this.TesterInfoBox.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.TesterInfoBox.Cursor = System.Windows.Forms.Cursors.Default;
            this.TesterInfoBox.Dock = System.Windows.Forms.DockStyle.Fill;
            this.TesterInfoBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.TesterInfoBox.ForeColor = System.Drawing.Color.White;
            this.TesterInfoBox.Location = new System.Drawing.Point(5, 5);
            this.TesterInfoBox.Multiline = true;
            this.TesterInfoBox.Name = "TesterInfoBox";
            this.TesterInfoBox.ReadOnly = true;
            this.TesterInfoBox.Size = new System.Drawing.Size(969, 28);
            this.TesterInfoBox.TabIndex = 5;
            this.TesterInfoBox.Text = "This is a test\r\nLine 2";
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.fileToolStripMenuItem,
            this.hardwareToolStripMenuItem,
            this.optionsToolStripMenuItem,
            this.helpToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(979, 24);
            this.menuStrip1.TabIndex = 6;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // fileToolStripMenuItem
            // 
            this.fileToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.exitToolStripMenuItem});
            this.fileToolStripMenuItem.Name = "fileToolStripMenuItem";
            this.fileToolStripMenuItem.Size = new System.Drawing.Size(37, 20);
            this.fileToolStripMenuItem.Text = "&File";
            // 
            // exitToolStripMenuItem
            // 
            this.exitToolStripMenuItem.Name = "exitToolStripMenuItem";
            this.exitToolStripMenuItem.Size = new System.Drawing.Size(93, 22);
            this.exitToolStripMenuItem.Text = "E&xit";
            this.exitToolStripMenuItem.Click += new System.EventHandler(this.exitToolStripMenuItem_Click);
            // 
            // hardwareToolStripMenuItem
            // 
            this.hardwareToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.connectToolStripMenuItem,
            this.disconnectToolStripMenuItem});
            this.hardwareToolStripMenuItem.Name = "hardwareToolStripMenuItem";
            this.hardwareToolStripMenuItem.Size = new System.Drawing.Size(70, 20);
            this.hardwareToolStripMenuItem.Text = "&Hardware";
            // 
            // connectToolStripMenuItem
            // 
            this.connectToolStripMenuItem.Image = global::DJetronicECUTester.Properties.Resources.connect;
            this.connectToolStripMenuItem.Name = "connectToolStripMenuItem";
            this.connectToolStripMenuItem.Size = new System.Drawing.Size(133, 22);
            this.connectToolStripMenuItem.Text = "&Connect";
            this.connectToolStripMenuItem.Click += new System.EventHandler(this.connectToolStripMenuItem_Click);
            // 
            // disconnectToolStripMenuItem
            // 
            this.disconnectToolStripMenuItem.Image = global::DJetronicECUTester.Properties.Resources.disconnect;
            this.disconnectToolStripMenuItem.Name = "disconnectToolStripMenuItem";
            this.disconnectToolStripMenuItem.Size = new System.Drawing.Size(133, 22);
            this.disconnectToolStripMenuItem.Text = "&Disconnect";
            this.disconnectToolStripMenuItem.Click += new System.EventHandler(this.disconnectToolStripMenuItem_Click);
            // 
            // optionsToolStripMenuItem
            // 
            this.optionsToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.startRecordingPulseWidthsToolStripMenuItem,
            this.stopRecordingPulseWidthsToolStripMenuItem});
            this.optionsToolStripMenuItem.Name = "optionsToolStripMenuItem";
            this.optionsToolStripMenuItem.Size = new System.Drawing.Size(61, 20);
            this.optionsToolStripMenuItem.Text = "&Options";
            // 
            // startRecordingPulseWidthsToolStripMenuItem
            // 
            this.startRecordingPulseWidthsToolStripMenuItem.Image = global::DJetronicECUTester.Properties.Resources.record;
            this.startRecordingPulseWidthsToolStripMenuItem.Name = "startRecordingPulseWidthsToolStripMenuItem";
            this.startRecordingPulseWidthsToolStripMenuItem.Size = new System.Drawing.Size(226, 22);
            this.startRecordingPulseWidthsToolStripMenuItem.Text = "Start &Recording Pulse Widths";
            this.startRecordingPulseWidthsToolStripMenuItem.Click += new System.EventHandler(this.startRecordingPulseWidthsToolStripMenuItem_Click);
            // 
            // stopRecordingPulseWidthsToolStripMenuItem
            // 
            this.stopRecordingPulseWidthsToolStripMenuItem.Image = global::DJetronicECUTester.Properties.Resources.stop;
            this.stopRecordingPulseWidthsToolStripMenuItem.Name = "stopRecordingPulseWidthsToolStripMenuItem";
            this.stopRecordingPulseWidthsToolStripMenuItem.Size = new System.Drawing.Size(226, 22);
            this.stopRecordingPulseWidthsToolStripMenuItem.Text = "&Stop Recording Pulse Widths";
            // 
            // helpToolStripMenuItem
            // 
            this.helpToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.aboutToolStripMenuItem});
            this.helpToolStripMenuItem.Name = "helpToolStripMenuItem";
            this.helpToolStripMenuItem.Size = new System.Drawing.Size(44, 20);
            this.helpToolStripMenuItem.Text = "&Help";
            // 
            // aboutToolStripMenuItem
            // 
            this.aboutToolStripMenuItem.Name = "aboutToolStripMenuItem";
            this.aboutToolStripMenuItem.Size = new System.Drawing.Size(116, 22);
            this.aboutToolStripMenuItem.Text = "&About...";
            this.aboutToolStripMenuItem.Click += new System.EventHandler(this.aboutToolStripMenuItem_Click);
            // 
            // toolStrip1
            // 
            this.toolStrip1.GripStyle = System.Windows.Forms.ToolStripGripStyle.Hidden;
            this.toolStrip1.ImageScalingSize = new System.Drawing.Size(32, 32);
            this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.ConnectBtn,
            this.DisconnectBtn,
            this.toolStripSeparator1,
            this.RecordBtn,
            this.StopBtn});
            this.toolStrip1.Location = new System.Drawing.Point(0, 24);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.Size = new System.Drawing.Size(979, 39);
            this.toolStrip1.TabIndex = 7;
            this.toolStrip1.Text = "toolStrip1";
            // 
            // ConnectBtn
            // 
            this.ConnectBtn.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.ConnectBtn.Image = global::DJetronicECUTester.Properties.Resources.connect;
            this.ConnectBtn.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.ConnectBtn.Name = "ConnectBtn";
            this.ConnectBtn.Size = new System.Drawing.Size(36, 36);
            this.ConnectBtn.Text = "Connect to tester";
            this.ConnectBtn.Click += new System.EventHandler(this.ConnectBtn_Click);
            // 
            // DisconnectBtn
            // 
            this.DisconnectBtn.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.DisconnectBtn.Image = global::DJetronicECUTester.Properties.Resources.disconnect;
            this.DisconnectBtn.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.DisconnectBtn.Name = "DisconnectBtn";
            this.DisconnectBtn.Size = new System.Drawing.Size(36, 36);
            this.DisconnectBtn.Text = "Disconnect from tester";
            this.DisconnectBtn.Click += new System.EventHandler(this.DisconnectBtn_Click);
            // 
            // toolStripSeparator1
            // 
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            this.toolStripSeparator1.Size = new System.Drawing.Size(6, 39);
            // 
            // RecordBtn
            // 
            this.RecordBtn.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.RecordBtn.Image = global::DJetronicECUTester.Properties.Resources.record;
            this.RecordBtn.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.RecordBtn.Name = "RecordBtn";
            this.RecordBtn.Size = new System.Drawing.Size(36, 36);
            this.RecordBtn.Text = "Start recording pulse widths";
            // 
            // StopBtn
            // 
            this.StopBtn.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.StopBtn.Image = global::DJetronicECUTester.Properties.Resources.stop;
            this.StopBtn.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.StopBtn.Name = "StopBtn";
            this.StopBtn.Size = new System.Drawing.Size(36, 36);
            this.StopBtn.Text = "Stop recording pulse widths";
            // 
            // CopyInfoBtn
            // 
            this.CopyInfoBtn.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.CopyInfoBtn.Image = global::DJetronicECUTester.Properties.Resources.copy;
            this.CopyInfoBtn.Location = new System.Drawing.Point(952, 66);
            this.CopyInfoBtn.Name = "CopyInfoBtn";
            this.CopyInfoBtn.Size = new System.Drawing.Size(23, 23);
            this.CopyInfoBtn.TabIndex = 8;
            this.toolTip1.SetToolTip(this.CopyInfoBtn, "Copy to clipboard");
            this.CopyInfoBtn.UseVisualStyleBackColor = true;
            this.CopyInfoBtn.Click += new System.EventHandler(this.CopyInfoBtn_Click);
            // 
            // TesterInfoBoxPanel
            // 
            this.TesterInfoBoxPanel.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(202)))), ((int)(((byte)(81)))), ((int)(((byte)(0)))));
            this.TesterInfoBoxPanel.Controls.Add(this.TesterInfoBox);
            this.TesterInfoBoxPanel.Dock = System.Windows.Forms.DockStyle.Top;
            this.TesterInfoBoxPanel.Location = new System.Drawing.Point(0, 63);
            this.TesterInfoBoxPanel.Name = "TesterInfoBoxPanel";
            this.TesterInfoBoxPanel.Padding = new System.Windows.Forms.Padding(5);
            this.TesterInfoBoxPanel.Size = new System.Drawing.Size(979, 38);
            this.TesterInfoBoxPanel.TabIndex = 9;
            // 
            // EngineTestBtn
            // 
            this.EngineTestBtn.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.EngineTestBtn.Location = new System.Drawing.Point(8, 311);
            this.EngineTestBtn.Name = "EngineTestBtn";
            this.EngineTestBtn.Size = new System.Drawing.Size(75, 23);
            this.EngineTestBtn.TabIndex = 1;
            this.EngineTestBtn.Text = "Engine Test";
            this.EngineTestBtn.UseVisualStyleBackColor = true;
            this.EngineTestBtn.Click += new System.EventHandler(this.EngineTestBtn_Click);
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(979, 662);
            this.Controls.Add(this.splitContainer1);
            this.Controls.Add(this.TesterInfoBoxPanel);
            this.Controls.Add(this.CopyInfoBtn);
            this.Controls.Add(this.toolStrip1);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.menuStrip1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "MainForm";
            this.Text = "D-Jetronic ECU Tester";
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).EndInit();
            this.splitContainer1.ResumeLayout(false);
            this.Tabs.ResumeLayout(false);
            this.StaticPage.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.TestPage.ResumeLayout(false);
            this.OutputPage.ResumeLayout(false);
            this.OutputPage.PerformLayout();
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            this.TesterInfoBoxPanel.ResumeLayout(false);
            this.TesterInfoBoxPanel.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Button CustomSettingsApplyBtn;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.ToolStripStatusLabel ConnectionStatus;
        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.TextBox OutputBox;
        private System.Windows.Forms.TextBox TesterInfoBox;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem fileToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem exitToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem helpToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem aboutToolStripMenuItem;
        private System.Windows.Forms.ToolStrip toolStrip1;
        private System.Windows.Forms.ToolStripButton ConnectBtn;
        private System.Windows.Forms.ToolStripButton DisconnectBtn;
        private System.Windows.Forms.TabControl Tabs;
        private System.Windows.Forms.TabPage StaticPage;
        private System.Windows.Forms.TabPage DynamicPage;
        private System.Windows.Forms.Button CopyInfoBtn;
        private System.Windows.Forms.TabPage TestPage;
        private System.Windows.Forms.ToolStripMenuItem hardwareToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem connectToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem disconnectToolStripMenuItem;
        private System.Windows.Forms.ToolTip toolTip1;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
        private System.Windows.Forms.ToolStripButton RecordBtn;
        private System.Windows.Forms.ToolStripButton StopBtn;
        private System.Windows.Forms.ToolStripMenuItem optionsToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem startRecordingPulseWidthsToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem stopRecordingPulseWidthsToolStripMenuItem;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.TabPage OutputPage;
        private System.Windows.Forms.Panel TesterInfoBoxPanel;
        private LiveChartsCore.SkiaSharpView.WinForms.CartesianChart cartesianChart1;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button ApplyPresetBtn;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox PresetSelector;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox CoolantTempInput;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox AirTempInput;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox DwellAngleInput;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox ThrottlePositionInput;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.TextBox EngineSpeedInput;
        private System.Windows.Forms.Button EngineTestBtn;
    }
}

