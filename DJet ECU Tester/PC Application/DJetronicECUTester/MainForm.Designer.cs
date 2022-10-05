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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
            this.button2 = new System.Windows.Forms.Button();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.ConnectionStatus = new System.Windows.Forms.ToolStripStatusLabel();
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.OutputBox = new System.Windows.Forms.TextBox();
            this.TesterInfoBox = new System.Windows.Forms.TextBox();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.fileToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.exitToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.helpToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.aboutToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.Tabs = new System.Windows.Forms.TabControl();
            this.StaticPage = new System.Windows.Forms.TabPage();
            this.DynamicPage = new System.Windows.Forms.TabPage();
            this.CopyInfoBtn = new System.Windows.Forms.Button();
            this.ConnectBtn = new System.Windows.Forms.ToolStripButton();
            this.DisconnectBtn = new System.Windows.Forms.ToolStripButton();
            this.TestPage = new System.Windows.Forms.TabPage();
            this.statusStrip1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).BeginInit();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.menuStrip1.SuspendLayout();
            this.toolStrip1.SuspendLayout();
            this.Tabs.SuspendLayout();
            this.StaticPage.SuspendLayout();
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
            this.statusStrip1.Location = new System.Drawing.Point(0, 396);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(848, 22);
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
            this.splitContainer1.Location = new System.Drawing.Point(0, 85);
            this.splitContainer1.Name = "splitContainer1";
            this.splitContainer1.Orientation = System.Windows.Forms.Orientation.Horizontal;
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.Tabs);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.OutputBox);
            this.splitContainer1.Size = new System.Drawing.Size(848, 311);
            this.splitContainer1.SplitterDistance = 230;
            this.splitContainer1.TabIndex = 4;
            // 
            // OutputBox
            // 
            this.OutputBox.Dock = System.Windows.Forms.DockStyle.Fill;
            this.OutputBox.Location = new System.Drawing.Point(0, 0);
            this.OutputBox.Multiline = true;
            this.OutputBox.Name = "OutputBox";
            this.OutputBox.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.OutputBox.Size = new System.Drawing.Size(848, 77);
            this.OutputBox.TabIndex = 0;
            // 
            // TesterInfoBox
            // 
            this.TesterInfoBox.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(0)))));
            this.TesterInfoBox.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.TesterInfoBox.Cursor = System.Windows.Forms.Cursors.Default;
            this.TesterInfoBox.Dock = System.Windows.Forms.DockStyle.Top;
            this.TesterInfoBox.ForeColor = System.Drawing.Color.White;
            this.TesterInfoBox.Location = new System.Drawing.Point(0, 55);
            this.TesterInfoBox.Multiline = true;
            this.TesterInfoBox.Name = "TesterInfoBox";
            this.TesterInfoBox.ReadOnly = true;
            this.TesterInfoBox.Size = new System.Drawing.Size(848, 30);
            this.TesterInfoBox.TabIndex = 5;
            this.TesterInfoBox.Text = "This is a test\r\nLine 2";
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.fileToolStripMenuItem,
            this.helpToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(848, 24);
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
            this.aboutToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.aboutToolStripMenuItem.Text = "&About...";
            this.aboutToolStripMenuItem.Click += new System.EventHandler(this.aboutToolStripMenuItem_Click);
            // 
            // toolStrip1
            // 
            this.toolStrip1.GripStyle = System.Windows.Forms.ToolStripGripStyle.Hidden;
            this.toolStrip1.ImageScalingSize = new System.Drawing.Size(24, 24);
            this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.ConnectBtn,
            this.DisconnectBtn});
            this.toolStrip1.Location = new System.Drawing.Point(0, 24);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.Size = new System.Drawing.Size(848, 31);
            this.toolStrip1.TabIndex = 7;
            this.toolStrip1.Text = "toolStrip1";
            // 
            // Tabs
            // 
            this.Tabs.Controls.Add(this.StaticPage);
            this.Tabs.Controls.Add(this.DynamicPage);
            this.Tabs.Controls.Add(this.TestPage);
            this.Tabs.Dock = System.Windows.Forms.DockStyle.Fill;
            this.Tabs.Location = new System.Drawing.Point(0, 0);
            this.Tabs.Name = "Tabs";
            this.Tabs.SelectedIndex = 0;
            this.Tabs.Size = new System.Drawing.Size(848, 230);
            this.Tabs.TabIndex = 2;
            // 
            // StaticPage
            // 
            this.StaticPage.Controls.Add(this.button2);
            this.StaticPage.Location = new System.Drawing.Point(4, 22);
            this.StaticPage.Name = "StaticPage";
            this.StaticPage.Padding = new System.Windows.Forms.Padding(3);
            this.StaticPage.Size = new System.Drawing.Size(840, 204);
            this.StaticPage.TabIndex = 0;
            this.StaticPage.Text = "Static";
            this.StaticPage.UseVisualStyleBackColor = true;
            // 
            // DynamicPage
            // 
            this.DynamicPage.Location = new System.Drawing.Point(4, 22);
            this.DynamicPage.Name = "DynamicPage";
            this.DynamicPage.Padding = new System.Windows.Forms.Padding(3);
            this.DynamicPage.Size = new System.Drawing.Size(840, 204);
            this.DynamicPage.TabIndex = 1;
            this.DynamicPage.Text = "Dynamic";
            this.DynamicPage.UseVisualStyleBackColor = true;
            // 
            // CopyInfoBtn
            // 
            this.CopyInfoBtn.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.CopyInfoBtn.Location = new System.Drawing.Point(821, 58);
            this.CopyInfoBtn.Name = "CopyInfoBtn";
            this.CopyInfoBtn.Size = new System.Drawing.Size(23, 23);
            this.CopyInfoBtn.TabIndex = 8;
            this.CopyInfoBtn.UseVisualStyleBackColor = true;
            // 
            // ConnectBtn
            // 
            this.ConnectBtn.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.ConnectBtn.Image = global::DJetronicECUTester.Properties.Resources.connect_24;
            this.ConnectBtn.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.ConnectBtn.Name = "ConnectBtn";
            this.ConnectBtn.Size = new System.Drawing.Size(28, 28);
            this.ConnectBtn.Text = "Connect to tester";
            this.ConnectBtn.Click += new System.EventHandler(this.ConnectBtn_Click);
            // 
            // DisconnectBtn
            // 
            this.DisconnectBtn.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.DisconnectBtn.Image = global::DJetronicECUTester.Properties.Resources.disconnect_24;
            this.DisconnectBtn.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.DisconnectBtn.Name = "DisconnectBtn";
            this.DisconnectBtn.Size = new System.Drawing.Size(28, 28);
            this.DisconnectBtn.Text = "Disconnect from tester";
            this.DisconnectBtn.Click += new System.EventHandler(this.DisconnectBtn_Click);
            // 
            // TestPage
            // 
            this.TestPage.Location = new System.Drawing.Point(4, 22);
            this.TestPage.Name = "TestPage";
            this.TestPage.Padding = new System.Windows.Forms.Padding(3);
            this.TestPage.Size = new System.Drawing.Size(840, 204);
            this.TestPage.TabIndex = 2;
            this.TestPage.Text = "Automated Testing";
            this.TestPage.UseVisualStyleBackColor = true;
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(848, 418);
            this.Controls.Add(this.CopyInfoBtn);
            this.Controls.Add(this.splitContainer1);
            this.Controls.Add(this.TesterInfoBox);
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
            this.splitContainer1.Panel2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).EndInit();
            this.splitContainer1.ResumeLayout(false);
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            this.Tabs.ResumeLayout(false);
            this.StaticPage.ResumeLayout(false);
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
    }
}

