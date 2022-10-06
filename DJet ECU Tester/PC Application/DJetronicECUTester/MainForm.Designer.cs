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
            this.button2 = new System.Windows.Forms.Button();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.ConnectionStatus = new System.Windows.Forms.ToolStripStatusLabel();
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.Tabs = new System.Windows.Forms.TabControl();
            this.StaticPage = new System.Windows.Forms.TabPage();
            this.DynamicPage = new System.Windows.Forms.TabPage();
            this.TestPage = new System.Windows.Forms.TabPage();
            this.button3 = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.OutputPage = new System.Windows.Forms.TabPage();
            this.OutputBox = new System.Windows.Forms.TextBox();
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
            this.cartesianChart1 = new LiveChartsCore.SkiaSharpView.WinForms.CartesianChart();
            this.statusStrip1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).BeginInit();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.Tabs.SuspendLayout();
            this.StaticPage.SuspendLayout();
            this.TestPage.SuspendLayout();
            this.OutputPage.SuspendLayout();
            this.menuStrip1.SuspendLayout();
            this.toolStrip1.SuspendLayout();
            this.TesterInfoBoxPanel.SuspendLayout();
            this.SuspendLayout();
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(6, 6);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(75, 23);
            this.button2.TabIndex = 1;
            this.button2.Text = "Test";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
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
            this.splitContainer1.SplitterDistance = 202;
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
            this.Tabs.Size = new System.Drawing.Size(979, 202);
            this.Tabs.TabIndex = 2;
            // 
            // StaticPage
            // 
            this.StaticPage.Controls.Add(this.button2);
            this.StaticPage.Location = new System.Drawing.Point(4, 22);
            this.StaticPage.Name = "StaticPage";
            this.StaticPage.Padding = new System.Windows.Forms.Padding(3);
            this.StaticPage.Size = new System.Drawing.Size(971, 176);
            this.StaticPage.TabIndex = 0;
            this.StaticPage.Text = "Static";
            this.StaticPage.UseVisualStyleBackColor = true;
            // 
            // DynamicPage
            // 
            this.DynamicPage.Location = new System.Drawing.Point(4, 22);
            this.DynamicPage.Name = "DynamicPage";
            this.DynamicPage.Padding = new System.Windows.Forms.Padding(3);
            this.DynamicPage.Size = new System.Drawing.Size(971, 176);
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
            this.TestPage.Size = new System.Drawing.Size(971, 176);
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
            this.OutputPage.Controls.Add(this.OutputBox);
            this.OutputPage.Location = new System.Drawing.Point(4, 22);
            this.OutputPage.Name = "OutputPage";
            this.OutputPage.Padding = new System.Windows.Forms.Padding(3);
            this.OutputPage.Size = new System.Drawing.Size(971, 176);
            this.OutputPage.TabIndex = 3;
            this.OutputPage.Text = "Tester Output";
            this.OutputPage.UseVisualStyleBackColor = true;
            // 
            // OutputBox
            // 
            this.OutputBox.Dock = System.Windows.Forms.DockStyle.Fill;
            this.OutputBox.Location = new System.Drawing.Point(3, 3);
            this.OutputBox.Multiline = true;
            this.OutputBox.Name = "OutputBox";
            this.OutputBox.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.OutputBox.Size = new System.Drawing.Size(965, 170);
            this.OutputBox.TabIndex = 0;
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
            // cartesianChart1
            // 
            this.cartesianChart1.AllowPanning = true;
            this.cartesianChart1.BackColor = System.Drawing.Color.White;
            this.cartesianChart1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cartesianChart1.Location = new System.Drawing.Point(0, 0);
            this.cartesianChart1.Name = "cartesianChart1";
            this.cartesianChart1.Size = new System.Drawing.Size(979, 333);
            this.cartesianChart1.TabIndex = 0;
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
        private System.Windows.Forms.Button button2;
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
    }
}

