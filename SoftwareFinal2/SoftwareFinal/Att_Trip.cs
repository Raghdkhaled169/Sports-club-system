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
    public partial class Att_Trip : Form
    {

        string ordb = "Data Source=ORCL;User Id=hr;Password=hr;";
        OracleConnection conn;

        public Att_Trip()
        {
            InitializeComponent();
        }

        private void back_btn_Click(object sender, EventArgs e)
        {
            Member_menu m = new Member_menu();
            m.Show();
            this.Hide();
        }

        private void going_btn_Click(object sender, EventArgs e)
        {
            conn = new OracleConnection(ordb);
            conn.Open();
            OracleCommand cmd = new OracleCommand();
            cmd.Connection = conn;
            cmd.CommandText = "Insert into Member_Trip (MEM_ID,TRI_ID) values (:mid,:trid) ";
            Console.WriteLine(Member_Login.loggedin);
            cmd.Parameters.Add("mid", Member_Login.loggedin.ToString());
            cmd.Parameters.Add("trid", textBox1.Text);
            int x = cmd.ExecuteNonQuery();
            if (x != -1)
                MessageBox.Show("you has been assigned to go to trip successfully");
            else
                MessageBox.Show("Invalid input please try again");
            
        }

        private void att_TripLoad(object sender, EventArgs e)
        {
                string ordb = "Data Source=ORCL;User Id=hr;Password=hr;";
                OracleConnection conn = new OracleConnection(ordb);
                conn.Open();
                OracleCommand cmd = new OracleCommand();
                cmd.Connection = conn;
                cmd.CommandText = "select TRIP_NAME from TrIPS ";
                cmd.CommandType = CommandType.Text;
                OracleDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    comboBox1.Items.Add(dr[0]);
                }
                dr.Close();
                conn.Close();
        }


        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            conn = new OracleConnection(ordb);
            OracleCommand cm = new OracleCommand();
            cm.Connection = conn;
            conn.Open();
            cm.CommandText = "select TRIP_ID from TRIPS where TRIP_name=:TripName";
            cm.Parameters.Add("TripName", comboBox1.Text);
            OracleDataReader dr = cm.ExecuteReader();
            if (dr.Read())
                textBox1.Text = dr[0].ToString();
            dr.Close();
            conn.Close();
        }
    }
}
