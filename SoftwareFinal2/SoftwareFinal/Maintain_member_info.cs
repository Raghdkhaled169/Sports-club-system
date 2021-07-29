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
    public partial class Maintain_member_info : Form
    {
        OracleDataAdapter adapter;
        OracleCommandBuilder builder;
        DataSet ds;
        public Maintain_member_info()
        {
            InitializeComponent();
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void back_btn_Click(object sender, EventArgs e)
        {
            Employee_Menu m = new Employee_Menu();
            m.Show();
            this.Hide();

        }

        private void MaintainMemberLoad(object sender, EventArgs e)
        {
            string constr = "Data Source=orcl;User Id=hr;Password=hr";
            string cmdstr = "select * from Member";
            adapter = new OracleDataAdapter(cmdstr, constr);
            ds = new DataSet();
            adapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
        }
        private void button1_Click(object sender, EventArgs e)
        {

            try
            {

                builder = new OracleCommandBuilder(adapter);
                adapter.Update(ds.Tables[0]);
                MessageBox.Show("Database Updated.");
            }
            catch
            {

                MessageBox.Show("An Error Has Occured, Please Try Again.");
            }
        }
    }
}
