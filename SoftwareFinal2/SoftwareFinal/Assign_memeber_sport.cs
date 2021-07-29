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
    public partial class Assign_memeber_sport : Form
    {
        string ordb = "Data Source = ORCL;User Id=hr;Password=hr;";
        OracleConnection conn;

        public Assign_memeber_sport()
        {
            InitializeComponent();
        }

        private void Assign_memeber_sport_Load(object sender, EventArgs e)
        {
            conn = new OracleConnection(ordb);
            OracleCommand cm = new OracleCommand();
            cm.Connection = conn;
            conn.Open();
            cm.CommandText = "select name from sport";
            OracleDataReader dr = cm.ExecuteReader();
            while (dr.Read())
            {
                comboBox1.Items.Add(dr[0]);
            }
            dr.Close();
            conn.Close();
        }

        private void Back_btn_Click(object sender, EventArgs e)
        {
            Employee_Menu m = new Employee_Menu();
            m.Show();
            this.Hide();
        }

        private void Assign_btn_Click(object sender, EventArgs e)
        {
            try
            {
                string ordb = "Data Source=ORCL;User Id=hr;Password=hr;";
                OracleConnection conn = new OracleConnection(ordb);
                conn.Open();
                OracleCommand cmd = new OracleCommand();
                cmd.Connection = conn;
                cmd.CommandText = "insert into Member_Sport(mmb_id,spr_id) values(:m_id,:s_id)";
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.Add("m_id",textBox1.Text);
                cmd.Parameters.Add("s_id",textBox3.Text);
                cmd.ExecuteNonQuery();
                conn.Close();
                MessageBox.Show("Assign memeber to sport successfully");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            conn = new OracleConnection(ordb);
            OracleCommand cm = new OracleCommand();
            cm.Connection = conn;
            conn.Open();
            cm.CommandText = "select ID from sport where name=:SportName";
            cm.Parameters.Add("SportName", comboBox1.Text);
            OracleDataReader dr = cm.ExecuteReader();
            if (dr.Read())
                textBox3.Text = dr[0].ToString();
            dr.Close();
            conn.Close();
        }
    }
}
