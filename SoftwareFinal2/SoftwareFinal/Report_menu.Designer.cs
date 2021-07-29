
namespace SoftwareFinal
{
    partial class Report_menu
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
            this.label1 = new System.Windows.Forms.Label();
            this.Report1_btn = new System.Windows.Forms.Button();
            this.Report2_btn = new System.Windows.Forms.Button();
            this.Back_btn = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Arial Narrow", 14F, System.Drawing.FontStyle.Underline, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label1.Location = new System.Drawing.Point(95, 66);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(171, 33);
            this.label1.TabIndex = 0;
            this.label1.Text = "Crystal Reports";
            // 
            // Report1_btn
            // 
            this.Report1_btn.Location = new System.Drawing.Point(144, 233);
            this.Report1_btn.Name = "Report1_btn";
            this.Report1_btn.Size = new System.Drawing.Size(189, 71);
            this.Report1_btn.TabIndex = 1;
            this.Report1_btn.Text = "Crystal Report 1";
            this.Report1_btn.UseVisualStyleBackColor = true;
            this.Report1_btn.Click += new System.EventHandler(this.Report1_btn_Click);
            // 
            // Report2_btn
            // 
            this.Report2_btn.Location = new System.Drawing.Point(144, 337);
            this.Report2_btn.Name = "Report2_btn";
            this.Report2_btn.Size = new System.Drawing.Size(189, 72);
            this.Report2_btn.TabIndex = 2;
            this.Report2_btn.Text = "Crystal Report 2\r\n";
            this.Report2_btn.UseVisualStyleBackColor = true;
            this.Report2_btn.Click += new System.EventHandler(this.Report2_btn_Click);
            // 
            // Back_btn
            // 
            this.Back_btn.Font = new System.Drawing.Font("Arial Narrow", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Back_btn.Location = new System.Drawing.Point(64, 556);
            this.Back_btn.Name = "Back_btn";
            this.Back_btn.Size = new System.Drawing.Size(149, 58);
            this.Back_btn.TabIndex = 3;
            this.Back_btn.Text = "Back To Main Menu\r\n";
            this.Back_btn.UseVisualStyleBackColor = true;
            this.Back_btn.Click += new System.EventHandler(this.Back_btn_Click);
            // 
            // Report_menu
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(34)))), ((int)(((byte)(35)))), ((int)(((byte)(47)))));
            this.ClientSize = new System.Drawing.Size(800, 669);
            this.Controls.Add(this.Back_btn);
            this.Controls.Add(this.Report2_btn);
            this.Controls.Add(this.Report1_btn);
            this.Controls.Add(this.label1);
            this.Name = "Report_menu";
            this.Text = "Report_menu";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button Report1_btn;
        private System.Windows.Forms.Button Report2_btn;
        private System.Windows.Forms.Button Back_btn;
    }
}