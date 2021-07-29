using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SoftwareFinal
{
    public partial class Mian_Page : Form
    {
        public Mian_Page()
        {
            InitializeComponent();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form1 f = new Form1();
            f.Show();
            this.Hide();
        }

        private void emp_btn_Click(object sender, EventArgs e)
        {
            Employee_login l = new Employee_login();
            l.Show();
            this.Hide();

        }

        private void member_btn_Click(object sender, EventArgs e)
        {
            Member_Login l = new Member_Login();
            l.Show();
            this.Hide();
        }
    }
}
