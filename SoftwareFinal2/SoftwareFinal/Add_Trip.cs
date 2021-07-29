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
    public partial class Add_Trip : Form
    {
      
        public Add_Trip()
        {
            InitializeComponent();
        }


        private void button2_Click(object sender, EventArgs e)
        {
            Employee_Menu m = new Employee_Menu();
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
            c.CommandText = @"insert into Trips(TRIP_ID,TRIP_NAME,DESTINATION,GATHERING_POINT,TRIP_DATE,TRIP_TIME,TRIP_DESCRIPTION)
           values (:tid,:tname,:destination,:gatheringPoint,:tdate,:time,:description)";
            c.CommandType = CommandType.Text;
            c.Parameters.Add("tid", textBox7.Text);
            c.Parameters.Add("tname", textBox6.Text);
            c.Parameters.Add("destination", textBox5.Text);
            c.Parameters.Add("gatheringPoint", textBox1.Text);
            c.Parameters.Add("tdate", Convert.ToDateTime(textBox2.Text));
            c.Parameters.Add("time", textBox3.Text);
            c.Parameters.Add("description", textBox4.Text);
            int r = c.ExecuteNonQuery();
            if (r != -1)
            {
                MessageBox.Show("Successful Trip Entry");
            }
            else
            {
                MessageBox.Show("Invalid Input, Please Try Again.");
            }
        }
    }
}

