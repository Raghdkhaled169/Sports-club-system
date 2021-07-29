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
    public partial class Create_employee : Form
    {
        string ordb = "Data Source = ORCL;User Id=hr;Password=hr;";
        OracleConnection conn;
        public Create_employee()
        {
            InitializeComponent();
        }
        private void back_btn_Click(object sender, EventArgs e)
        {
            Mian_Page m = new Mian_Page();
            m.Show();
            this.Hide();


        }

        private void save_btn_Click(object sender, EventArgs e)
        {
            conn = new OracleConnection(ordb);
            OracleCommand c = new OracleCommand();
            c.Connection = conn;
            conn.Open();
            c.CommandText = "insert into Employee (SSN,NAME,Salary,gender,birthdate,password) values (:ssn,:name,:salary,:gender,:birthdate,:password)";
            c.CommandType = CommandType.Text;
            c.Parameters.Add("ssn", textBox1.Text);
            c.Parameters.Add("name", textBox4.Text);
            c.Parameters.Add("salary", textBox5.Text);
            if (radioButton1.Checked)
            {
                //gender = "M";
                c.Parameters.Add("gender", "M");

            }
            else if (radioButton2.Checked)
            {
                //gender = "F";
                c.Parameters.Add("gender", "F");

            }
            c.Parameters.Add("birthdate", Convert.ToDateTime(textBox3.Text));
            c.Parameters.Add("password", textBox2.Text);




            int r = c.ExecuteNonQuery();
            if (r != -1)
            {
                MessageBox.Show("Employee Added Successfully");
            }
            else
            {
                MessageBox.Show("Invalid Input, Please Try Again.");
            }

            conn.Close();

        }
    }
}
