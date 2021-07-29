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
    public partial class Add_Trainer : Form
    {
        string ordb = "Data Source = ORCL;User Id=hr;Password=hr;";
        OracleConnection conn;

        public Add_Trainer()
        {
            InitializeComponent();
        }


        private void Back_btn_Click(object sender, EventArgs e)
        {
            Employee_Menu m = new Employee_Menu();
            m.Show();
            this.Hide();
        }

        private void Assign_btn_Click(object sender, EventArgs e)
        {
            string gender; //For gender Radio Button
            conn = new OracleConnection(ordb);
            OracleCommand c = new OracleCommand();
            c.Connection = conn;
            conn.Open();
            c.CommandText = "insert into TRAINER (TRAINER_SSN,TRAINER_NAME,TRAINER_BIRTHDATE,TRAINER_SALARY,TRAINER_GENDER) values (:ssn,:name,:birthdate,:salary,:gender)"; 
            c.CommandType = CommandType.Text;
            c.Parameters.Add("ssn", textBox4.Text);
            c.Parameters.Add("name", textBox1.Text);
            c.Parameters.Add("birthdate", Convert.ToDateTime(textBox2.Text)); 
            c.Parameters.Add("salary", textBox3.Text);
            if (radioButton1.Checked)
            {
                gender = "M";
                c.Parameters.Add("gender", gender);

            }
            else if (radioButton2.Checked)
            {
                gender = "F";
                c.Parameters.Add("gender", gender);

            }


            int r = c.ExecuteNonQuery();
            if (r != -1)
            {
                MessageBox.Show("Trainer Added Successfully");
            }
            else
            {
                MessageBox.Show("Invalid Input, Please Try Again.");
            }

            conn.Close();
        }

        private void Add_Trainer_Load(object sender, EventArgs e)
        {

        }
    }
}


