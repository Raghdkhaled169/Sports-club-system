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
    public partial class Assign_trainer_sport : Form
    {
        string ordb = "Data Source = ORCL;User Id=hr;Password=hr;";
        OracleConnection conn;
        public Assign_trainer_sport()
        {
            InitializeComponent();
        }

        private void Assign_trainer_sport_Load(object sender, EventArgs e)
        {
            /*
            conn = new OracleConnection(ordb);
            OracleCommand cm = new OracleCommand();
            cm.Connection = conn;
            conn.Open();
            cm.CommandText = "select name from sport";
            OracleDataReader dr =cm.ExecuteReader();
            while (dr.Read())
            {
                comboBox1.Items.Add(dr[0]);
            }
            dr.Close();
            conn.Close();*/
            conn = new OracleConnection(ordb);
            OracleCommand cm = new OracleCommand();
            cm.Connection = conn;
            conn.Open();
            cm.CommandText = "allsports";
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.Add("name", OracleDbType.RefCursor, ParameterDirection.Output);
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
            conn = new OracleConnection(ordb);
            OracleCommand c = new OracleCommand();
            c.Connection = conn;
            conn.Open();
            c.CommandText = "insert into trainer_SPORT(trainer_ssn,spr_id) values (:t_id,:s_id)";
            c.CommandType = CommandType.Text;
            c.Parameters.Add("t_id", textBox2.Text);
            c.Parameters.Add("s_id", textBox1.Text);
            //c.Parameters.Add("sport", comboBox1.SelectedItem.ToString());
            int r = c.ExecuteNonQuery();

            OracleCommand cm = new OracleCommand();
            cm.Connection = conn;
            cm.CommandText = "Update Sport Set TRA_SSN= :tssn where ID=:sid ";
            cm.Parameters.Add("tssn", textBox2.Text);
            cm.Parameters.Add("sid", textBox1.Text);
            cm.ExecuteNonQuery();

            if (r != -1)
            {
                MessageBox.Show("Trainer has been assigned to sport successfully");
            }
            else
            {
                MessageBox.Show("Invalid Input, Please Try Again.");
            }
            conn.Close();
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
            /*while (dr.Read())
            {
                comboBox1.Items.Add(dr[0]);
            }*/
            if (dr.Read())
            textBox1.Text = dr[0].ToString();
            dr.Close();
            conn.Close();

        }
    }
}



