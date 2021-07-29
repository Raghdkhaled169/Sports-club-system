
namespace SoftwareFinal
{
    partial class Employee_Menu
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
            this.back_btn = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.assign_member_btn = new System.Windows.Forms.Button();
            this.maintain_sport_btn = new System.Windows.Forms.Button();
            this.assign_trainer_btn = new System.Windows.Forms.Button();
            this.add_event_btn = new System.Windows.Forms.Button();
            this.add_trip_btn = new System.Windows.Forms.Button();
            this.add_trainer_btn = new System.Windows.Forms.Button();
            this.maintain_memInfo_btn = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // back_btn
            // 
            this.back_btn.Font = new System.Drawing.Font("Arial Narrow", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.back_btn.Location = new System.Drawing.Point(23, 588);
            this.back_btn.Name = "back_btn";
            this.back_btn.Size = new System.Drawing.Size(173, 44);
            this.back_btn.TabIndex = 17;
            this.back_btn.Text = "Back To Main Menu";
            this.back_btn.UseVisualStyleBackColor = true;
            this.back_btn.Click += new System.EventHandler(this.back_btn_Click);
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = global::SoftwareFinal.Properties.Resources.logo;
            this.pictureBox1.Location = new System.Drawing.Point(677, 35);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(100, 99);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 16;
            this.pictureBox1.TabStop = false;
            // 
            // assign_member_btn
            // 
            this.assign_member_btn.Font = new System.Drawing.Font("Arial Narrow", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.assign_member_btn.Location = new System.Drawing.Point(245, 35);
            this.assign_member_btn.Name = "assign_member_btn";
            this.assign_member_btn.Size = new System.Drawing.Size(291, 64);
            this.assign_member_btn.TabIndex = 18;
            this.assign_member_btn.Text = "Assign Member To Sport";
            this.assign_member_btn.UseVisualStyleBackColor = true;
            this.assign_member_btn.Click += new System.EventHandler(this.button1_Click);
            // 
            // maintain_sport_btn
            // 
            this.maintain_sport_btn.Font = new System.Drawing.Font("Arial Narrow", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.maintain_sport_btn.Location = new System.Drawing.Point(245, 204);
            this.maintain_sport_btn.Name = "maintain_sport_btn";
            this.maintain_sport_btn.Size = new System.Drawing.Size(291, 64);
            this.maintain_sport_btn.TabIndex = 19;
            this.maintain_sport_btn.Text = "Maintain Sport\'s Schedule";
            this.maintain_sport_btn.UseVisualStyleBackColor = true;
            this.maintain_sport_btn.Click += new System.EventHandler(this.maintain_sport_btn_Click);
            // 
            // assign_trainer_btn
            // 
            this.assign_trainer_btn.Font = new System.Drawing.Font("Arial Narrow", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.assign_trainer_btn.Location = new System.Drawing.Point(245, 117);
            this.assign_trainer_btn.Name = "assign_trainer_btn";
            this.assign_trainer_btn.Size = new System.Drawing.Size(291, 64);
            this.assign_trainer_btn.TabIndex = 20;
            this.assign_trainer_btn.Text = "Assign Trainer To Sport";
            this.assign_trainer_btn.UseVisualStyleBackColor = true;
            this.assign_trainer_btn.Click += new System.EventHandler(this.assign_trainer_btn_Click);
            // 
            // add_event_btn
            // 
            this.add_event_btn.Font = new System.Drawing.Font("Arial Narrow", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.add_event_btn.Location = new System.Drawing.Point(245, 287);
            this.add_event_btn.Name = "add_event_btn";
            this.add_event_btn.Size = new System.Drawing.Size(291, 64);
            this.add_event_btn.TabIndex = 21;
            this.add_event_btn.Text = "Add Event";
            this.add_event_btn.UseVisualStyleBackColor = true;
            this.add_event_btn.Click += new System.EventHandler(this.add_event_btn_Click);
            // 
            // add_trip_btn
            // 
            this.add_trip_btn.Font = new System.Drawing.Font("Arial Narrow", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.add_trip_btn.Location = new System.Drawing.Point(245, 372);
            this.add_trip_btn.Name = "add_trip_btn";
            this.add_trip_btn.Size = new System.Drawing.Size(291, 64);
            this.add_trip_btn.TabIndex = 22;
            this.add_trip_btn.Text = "Add Trip";
            this.add_trip_btn.UseVisualStyleBackColor = true;
            this.add_trip_btn.Click += new System.EventHandler(this.add_trip_btn_Click);
            // 
            // add_trainer_btn
            // 
            this.add_trainer_btn.Font = new System.Drawing.Font("Arial Narrow", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.add_trainer_btn.Location = new System.Drawing.Point(245, 456);
            this.add_trainer_btn.Name = "add_trainer_btn";
            this.add_trainer_btn.Size = new System.Drawing.Size(291, 64);
            this.add_trainer_btn.TabIndex = 23;
            this.add_trainer_btn.Text = "Add New Trainer";
            this.add_trainer_btn.UseVisualStyleBackColor = true;
            this.add_trainer_btn.Click += new System.EventHandler(this.add_trainer_btn_Click);
            // 
            // maintain_memInfo_btn
            // 
            this.maintain_memInfo_btn.Font = new System.Drawing.Font("Arial Narrow", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.maintain_memInfo_btn.Location = new System.Drawing.Point(245, 550);
            this.maintain_memInfo_btn.Name = "maintain_memInfo_btn";
            this.maintain_memInfo_btn.Size = new System.Drawing.Size(291, 64);
            this.maintain_memInfo_btn.TabIndex = 24;
            this.maintain_memInfo_btn.Text = "Maintain Members Information";
            this.maintain_memInfo_btn.UseVisualStyleBackColor = true;
            this.maintain_memInfo_btn.Click += new System.EventHandler(this.maintain_memInfo_btn_Click);
            // 
            // Employee_Menu
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(34)))), ((int)(((byte)(36)))), ((int)(((byte)(47)))));
            this.ClientSize = new System.Drawing.Size(800, 667);
            this.Controls.Add(this.maintain_memInfo_btn);
            this.Controls.Add(this.add_trainer_btn);
            this.Controls.Add(this.add_trip_btn);
            this.Controls.Add(this.add_event_btn);
            this.Controls.Add(this.assign_trainer_btn);
            this.Controls.Add(this.maintain_sport_btn);
            this.Controls.Add(this.assign_member_btn);
            this.Controls.Add(this.back_btn);
            this.Controls.Add(this.pictureBox1);
            this.Name = "Employee_Menu";
            this.Text = "Employee_Menu";
            this.Load += new System.EventHandler(this.Employee_Menu_Load);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button back_btn;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Button assign_member_btn;
        private System.Windows.Forms.Button maintain_sport_btn;
        private System.Windows.Forms.Button assign_trainer_btn;
        private System.Windows.Forms.Button add_event_btn;
        private System.Windows.Forms.Button add_trip_btn;
        private System.Windows.Forms.Button add_trainer_btn;
        private System.Windows.Forms.Button maintain_memInfo_btn;
    }
}