namespace DJetronicStudio
{
    partial class ConnectForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ConnectForm));
            this.CancelBtn = new System.Windows.Forms.Button();
            this.TesterBtn = new System.Windows.Forms.Button();
            this.SimulationBtn = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // CancelBtn
            // 
            this.CancelBtn.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.CancelBtn.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.CancelBtn.Location = new System.Drawing.Point(205, 182);
            this.CancelBtn.Name = "CancelBtn";
            this.CancelBtn.Size = new System.Drawing.Size(75, 23);
            this.CancelBtn.TabIndex = 1;
            this.CancelBtn.Text = "Cancel";
            this.CancelBtn.UseVisualStyleBackColor = true;
            // 
            // TesterBtn
            // 
            this.TesterBtn.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.TesterBtn.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(202)))), ((int)(((byte)(81)))), ((int)(((byte)(0)))));
            this.TesterBtn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.TesterBtn.Font = new System.Drawing.Font("Microsoft Sans Serif", 20F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.TesterBtn.ForeColor = System.Drawing.Color.White;
            this.TesterBtn.Image = global::DJetronicStudio.Properties.Resources.tester_72;
            this.TesterBtn.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.TesterBtn.Location = new System.Drawing.Point(12, 12);
            this.TesterBtn.Name = "TesterBtn";
            this.TesterBtn.Size = new System.Drawing.Size(268, 76);
            this.TesterBtn.TabIndex = 4;
            this.TesterBtn.Text = "            ECU Tester";
            this.TesterBtn.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.TesterBtn.UseVisualStyleBackColor = false;
            this.TesterBtn.Click += new System.EventHandler(this.TesterBtn_Click);
            // 
            // SimulationBtn
            // 
            this.SimulationBtn.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.SimulationBtn.BackColor = System.Drawing.Color.CornflowerBlue;
            this.SimulationBtn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.SimulationBtn.Font = new System.Drawing.Font("Microsoft Sans Serif", 20F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.SimulationBtn.ForeColor = System.Drawing.Color.White;
            this.SimulationBtn.Image = global::DJetronicStudio.Properties.Resources.simulation_72;
            this.SimulationBtn.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.SimulationBtn.Location = new System.Drawing.Point(12, 94);
            this.SimulationBtn.Name = "SimulationBtn";
            this.SimulationBtn.Size = new System.Drawing.Size(268, 76);
            this.SimulationBtn.TabIndex = 5;
            this.SimulationBtn.Text = "            Simulation";
            this.SimulationBtn.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.SimulationBtn.UseVisualStyleBackColor = false;
            this.SimulationBtn.Click += new System.EventHandler(this.SimulationBtn_Click);
            // 
            // ConnectForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(292, 217);
            this.Controls.Add(this.SimulationBtn);
            this.Controls.Add(this.TesterBtn);
            this.Controls.Add(this.CancelBtn);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "ConnectForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "Connect";
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Button CancelBtn;
        private System.Windows.Forms.Button TesterBtn;
        private System.Windows.Forms.Button SimulationBtn;
    }
}