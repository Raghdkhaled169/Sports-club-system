
namespace SoftwareFinal
{
    partial class Member_menu
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
            this.att_event_btn = new System.Windows.Forms.Button();
            this.renew_btn = new System.Windows.Forms.Button();
            this.att_trip_btn = new System.Windows.Forms.Button();
            this.back_btn = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // att_event_btn
            // 
            this.att_event_btn.Font = new System.Drawing.Font("Arial Narrow", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.att_event_btn.Location = new System.Drawing.Point(241, 209);
            this.att_event_btn.Name = "att_event_btn";
            this.att_event_btn.Size = new System.Drawing.Size(291, 64);
            this.att_event_btn.TabIndex = 25;
            this.att_event_btn.Text = "Attend Trip";
            this.att_event_btn.UseVisualStyleBackColor = true;
            this.att_event_btn.Click += new System.EventHandler(this.att_event_btn_Click);
            // 
            // renew_btn
            // 
            this.renew_btn.Font = new System.Drawing.Font("Arial Narrow", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.renew_btn.Location = new System.Drawing.Point(241, 322);
            this.renew_btn.Name = "renew_btn";
            this.renew_btn.Size = new System.Drawing.Size(291, 64);
            this.renew_btn.TabIndex = 24;
            this.renew_btn.Text = "Renew Membership";
            this.renew_btn.UseVisualStyleBackColor = true;
            this.renew_btn.Click += new System.EventHandler(this.renew_btn_Click);
            // 
            // att_trip_btn
            // 
            this.att_trip_btn.Font = new System.Drawing.Font("Arial Narrow", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.att_trip_btn.Location = new System.Drawing.Point(241, 94);
            this.att_trip_btn.Name = "att_trip_btn";
            this.att_trip_btn.Size = new System.Drawing.Size(291, 64);
            this.att_trip_btn.TabIndex = 23;
            this.att_trip_btn.Text = "Attend Event";
            this.att_trip_btn.UseVisualStyleBackColor = true;
            this.att_trip_btn.Click += new System.EventHandler(this.att_trip_btn_Click);
            // 
            // back_btn
            // 
            this.back_btn.Font = new System.Drawing.Font("Arial Narrow", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.back_btn.Location = new System.Drawing.Point(19, 590);
            this.back_btn.Name = "back_btn";
            this.back_btn.Size = new System.Drawing.Size(173, 44);
            this.back_btn.TabIndex = 22;
            this.back_btn.Text = "Back To Main Menu";
            this.back_btn.UseVisualStyleBackColor = true;
            this.back_btn.Click += new System.EventHandler(this.back_btn_Click);
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = global::SoftwareFinal.Properties.Resources.logo;
            this.pictureBox1.Location = new System.Drawing.Point(673, 37);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(100, 99);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 21;
            this.pictureBox1.TabStop = false;
            // 
            // Member_menu
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(34)))), ((int)(((byte)(36)))), ((int)(((byte)(47)))));
            this.ClientSize = new System.Drawing.Size(800, 663);
            this.Controls.Add(this.att_event_btn);
            this.Controls.Add(this.renew_btn);
            this.Controls.Add(this.att_trip_btn);
            this.Controls.Add(this.back_btn);
            this.Controls.Add(this.pictureBox1);
            this.Name = "Member_menu";
            this.Text = "Member_menu";
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button att_event_btn;
        private System.Windows.Forms.Button renew_btn;
        private System.Windows.Forms.Button att_trip_btn;
        private System.Windows.Forms.Button back_btn;
        private System.Windows.Forms.PictureBox pictureBox1;
    }
}