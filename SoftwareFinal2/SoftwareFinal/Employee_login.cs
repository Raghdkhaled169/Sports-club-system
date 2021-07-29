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
    public partial class Employee_login : Form
    {
        OracleConnection conn;
        string ordb = "Data Source=ORCL;User Id=hr;Password=hr;";
        public Employee_login()
        {
            InitializeComponent();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void login_btn_Click(object sender, EventArgs e)
        {


            conn = new OracleConnection(ordb);
            conn.Open();
            OracleCommand cmd = new OracleCommand();
            cmd.Connection = conn;
            cmd.CommandText = "CHECKID_EMPLOYEE";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("id", textBox1.Text);
            cmd.Parameters.Add("pass", textBox2.Text);
            cmd.Parameters.Add("n", OracleDbType.Int32, ParameterDirection.Output);
            cmd.ExecuteNonQuery();
            string x = (cmd.Parameters["n"].Value).ToString();
          
            if (x == "1")
            {
                Employee_Menu m = new Employee_Menu();
                m.Show();
                this.Hide();
            }
            //OracleDataReader dr = cmd.ExecuteReader();
            //if (dr.RowSize == 1)
            //{
            //    MessageBox.Show("Login");
            //    Employee_Menu m = new Employee_Menu();
            //    m.Show();
            //    this.Hide();
            //}
            else
            {
                MessageBox.Show("Check your username and password");
            }





        }

        private void Employee_login_Load(object sender, EventArgs e)
        {

        }

        private void add_btn_Click(object sender, EventArgs e)
        {
            Create_employee emp = new Create_employee();
            emp.Show();
            this.Hide();
        }
    }
}


