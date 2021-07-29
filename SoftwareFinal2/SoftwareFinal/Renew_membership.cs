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
    public partial class Renew_membership : Form
    {
        public Renew_membership()
        {
            InitializeComponent();
        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void renew_btn_Click(object sender, EventArgs e)
        {
            string card_number = textBox3.Text;
            if (card_number.Length != 16)
            {
                MessageBox.Show("Invalid credit card number", "Error");
            }
            else
            {
                string ordb = "Data Source=ORCL;User Id=hr;Password=hr;";
                OracleConnection conn = new OracleConnection(ordb);
                conn.Open();
                OracleCommand cmd = new OracleCommand();
                cmd.Connection = conn;
                if (Member_Login.loggedin == Convert.ToInt32(textBox1.Text))
                {




                    string expdate = "";

                    cmd.CommandText = "checkId";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("id", textBox1.Text);
                    cmd.Parameters.Add("pass", textBox2.Text);
                    cmd.Parameters.Add("n", OracleDbType.Int32, ParameterDirection.Output);
                    cmd.ExecuteNonQuery();
                    string x = (cmd.Parameters["n"].Value).ToString();
                    if (x == "1")
                    {
                        OracleCommand cm = new OracleCommand();
                        OracleCommand selec = new OracleCommand();
                        cm.Connection = conn;
                        selec.Connection = conn;
                        selec.CommandText = "Select ExpiryDate from Member where M_ID=:memID";
                        selec.Parameters.Add("memID", textBox1.Text);
                        OracleDataReader dr2 = selec.ExecuteReader();
                        if (dr2.Read())
                        {
                            expdate = dr2[0].ToString();
                        }
                           
                        cm.CommandText = "Update Member Set ExpiryDate= :exdate where M_ID=:mid ";
                        cm.Parameters.Add("exdate", Convert.ToDateTime(expdate).AddYears(2));
                        cm.Parameters.Add("mid", textBox1.Text);
                        cm.ExecuteNonQuery();
                        MessageBox.Show("You have successfully renewed your membership");
                    }
                    else
                    {
                        MessageBox.Show("Check your password and try again.");
                    }
                }
                else
                {
                    MessageBox.Show("Check your id and try again.");
                }
                conn.Close();
            }
        }

        private void back_btn_Click(object sender, EventArgs e)
        {
            Member_menu m = new Member_menu();
            m.Show();
            this.Hide();
        }

             

        private void Renew_membership_Load(object sender, EventArgs e)
        {

        }
    }
    }