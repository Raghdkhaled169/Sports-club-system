using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;

namespace SoftwareFinal
{
    public partial class Register : Form
    {

        string type;
        //private void radioButton1_CheckedChanged(object sender, EventArgs e)
        //{
        //    type = "M";
        //}

        //private void radioButton2_CheckedChanged(object sender, EventArgs e)
        //{
        //    type = "F";
        //}
        public Register()
        {
            InitializeComponent();
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void Register_Load(object sender, EventArgs e)
        {

        }
        public void WrongPassMess()
        {
            MessageBox.Show("Wrong Password\nPlease enter" +
             " the password correctly.",
             "Password does not match", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        }

        private void register_btn_Click(object sender, EventArgs e)
        {
            string pass = textBox2.Text;
            string confirmPass = textBox3.Text;
            if (pass.Length != confirmPass.Length)
            {
                WrongPassMess();
            }
            else
            {
                for (int i = 0; i < pass.Length; i++)
                {
                    if (pass[i] != confirmPass[i])
                    {
                        WrongPassMess();
                        break;
                    }
                }
            }
            try
            {
                string ordb = "Data Source=ORCL;User Id=hr;Password=hr;";
                OracleConnection conn = new OracleConnection(ordb);
                conn.Open();
                OracleCommand cmd = new OracleCommand();
                cmd.Connection = conn;
                cmd.CommandText = @"insert into Member(M_ID, membername, m_password,Birthdate,m_gender,regdate,expirydate)
                                  values(:id,:name,:pass,:birth,:type,:Regdate,:expiry)";
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.Add("id", textBox1.Text);
                cmd.Parameters.Add("Name", textBox4.Text);
                cmd.Parameters.Add("pass", textBox2.Text);
                cmd.Parameters.Add("birth", Convert.ToDateTime(textBox5.Text));
                //cmd.Parameters.Add("type", textBox6.Text);
                if (radioButton1.Checked)
                {
                    //gender = "M";
                    cmd.Parameters.Add("type", "M");

                }
                else if (radioButton2.Checked)
                {
                    //gender = "F";
                    cmd.Parameters.Add("type", "F");

                }
                cmd.Parameters.Add("Regdate", Convert.ToDateTime(DateTime.Now));
                cmd.Parameters.Add("expiry", Convert.ToDateTime(DateTime.Now.AddYears(1)));
                //cmd.Parameters.Add("pass", pass);




                //........................
                //cmd.Parameters.Add("type");
                int r = cmd.ExecuteNonQuery();
                if (r != -1)
                {
                    MessageBox.Show("Registiration Completed");
                    conn.Dispose();
                }
                else
                {
                    MessageBox.Show("Error");
                }
            }



            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            } 
        }

        private void back_btn_Click(object sender, EventArgs e)
        {
            Mian_Page m = new Mian_Page();
            m.Show();
            this.Hide();
        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox6_TextChanged(object sender, EventArgs e)
        {

        }
    }
}


