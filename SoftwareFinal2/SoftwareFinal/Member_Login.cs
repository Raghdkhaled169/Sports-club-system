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
    public partial class Member_Login : Form
    {
        public static int loggedin;
        OracleConnection conn;
        string ordb = "Data Source=ORCL;User Id=hr;Password=hr;";
        public Member_Login()
        {
            InitializeComponent();
        }

        private void login_btn_Click(object sender, EventArgs e)
        {
          
               
                conn = new OracleConnection(ordb);
                conn.Open();
                OracleCommand cmd = new OracleCommand();
                cmd.Connection = conn;
                cmd.CommandText = "checkid";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("id", textBox1.Text);
                cmd.Parameters.Add("pass", textBox2.Text);
                cmd.Parameters.Add("n", OracleDbType.Int32, ParameterDirection.Output);
                cmd.ExecuteNonQuery();
                string x = (cmd.Parameters["n"].Value).ToString();
                Console.WriteLine(x);
            if (x == "1")
            {
                loggedin = Convert.ToInt32(textBox1.Text);
                Member_menu m = new Member_menu();
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

        private void reg_btn_Click(object sender, EventArgs e)
        {
            Register r = new Register();
            r.Show();
            this.Hide();
        }

        private void back_btn_Click(object sender, EventArgs e)
        {
            Mian_Page m = new Mian_Page();
            m.Show();
            this.Hide();
        }

        private void Member_Login_Load(object sender, EventArgs e)
        {

        }
    }
}

