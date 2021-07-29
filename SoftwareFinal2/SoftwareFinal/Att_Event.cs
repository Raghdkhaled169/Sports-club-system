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
    public partial class Att_Event : Form
    {
        string ordb = "Data Source=ORCL;User Id=hr;Password=hr;";
        OracleConnection conn;
        public Att_Event()
        {
            InitializeComponent();
        }

        private void Att_Event_Load(object sender, EventArgs e)
        {
            try
            {
                conn = new OracleConnection(ordb);
                conn.Open();
                OracleCommand cmd = new OracleCommand();
                cmd.Connection = conn;
                cmd.CommandText = "select EV_NAME from EVENT ";
                cmd.CommandType = CommandType.Text;
                OracleDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    comboBox1.Items.Add(dr[0]);
                }
                dr.Close();
                conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Invalid input , please try again.");
            }
        }
        private void back_btn_Click(object sender, EventArgs e)
        {
            Member_menu m = new Member_menu();
            m.Show();
            this.Hide();

        }

        private void button1_Click(object sender, EventArgs e)
        {
            conn = new OracleConnection(ordb);
            conn.Open();
            OracleCommand cmd = new OracleCommand();
            cmd.Connection = conn;
            cmd.CommandText = "Insert into Member_event (MBR_ID,Evnt_ID) values (:mid,:evid) ";
            Console.WriteLine(Member_Login.loggedin);
            cmd.Parameters.Add("mid",Member_Login.loggedin.ToString());
            cmd.Parameters.Add("evid", textBox1.Text);
            int x=cmd.ExecuteNonQuery();
            if(x!=-1)
            MessageBox.Show("You have been assigned to attend event successfully");
            else
            MessageBox.Show("Invalid input please try again");
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            conn = new OracleConnection(ordb);
            OracleCommand cm = new OracleCommand();
            cm.Connection = conn;
            conn.Open();
            cm.CommandText = "select EV_ID from Event where ev_name=:EventName";
            cm.Parameters.Add("EventName", comboBox1.Text);
            OracleDataReader dr = cm.ExecuteReader();
            if (dr.Read())
                textBox1.Text = dr[0].ToString();
            dr.Close();
            conn.Close();
        }
    }

       

       
    }




