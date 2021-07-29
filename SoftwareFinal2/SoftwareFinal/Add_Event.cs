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
    public partial class Add_Event : Form
    {

        public Add_Event()
        {
            InitializeComponent();
        }
        private void back_btn_Click(object sender, EventArgs e)
        {
            Employee_Menu m =new Employee_Menu();
            m.Show();
            this.Hide();

        }

        private void add_btn_Click(object sender, EventArgs e)
        {
                string ordb = "Data Source=ORCL;User Id=hr;Password=hr;";
                OracleConnection conn = new OracleConnection(ordb);
                conn.Open();
                OracleCommand c = new OracleCommand();
                c.Connection = conn;
                c.CommandText = @"insert into event(EV_ID,EV_NAME,EV_DESCRIPTION,EV_place,EV_date,EV_time)
                values (:event_id,:event_name,:event_description,:event_place,:event_date,:event_time)";
                c.CommandType = CommandType.Text;
                c.Parameters.Add("event_id", textBox1.Text);
                c.Parameters.Add("event_name", name_txt.Text);
                c.Parameters.Add("event_description", textBox4.Text);
                c.Parameters.Add("event_place", textBox5.Text);
                c.Parameters.Add("event_date", Convert.ToDateTime(textBox2.Text));
                c.Parameters.Add("event_time", textBox3.Text);

                int r = c.ExecuteNonQuery();
                if (r != -1)
                {
                    MessageBox.Show("Event Added Successfully");
                }
                else
                {
                    MessageBox.Show("Invalid Input, Please Try Again.");
                }
            
        }

        private void back_btn_Click_1(object sender, EventArgs e)
        {
            Employee_Menu m = new Employee_Menu();
            m.Show();
            this.Hide();
        }
    }
}


