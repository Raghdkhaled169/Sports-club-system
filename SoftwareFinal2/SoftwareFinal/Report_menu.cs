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
    public partial class Report_menu : Form
    {
        public Report_menu()
        {
            InitializeComponent();
        }

        private void Back_btn_Click(object sender, EventArgs e)
        {
            Form1 f = new Form1();
            f.Show();
            this.Hide();

        }

        private void Report1_btn_Click(object sender, EventArgs e)
        {
            Report r1 = new Report();
            r1.Show();
            this.Hide();
        }

        private void Report2_btn_Click(object sender, EventArgs e)
        {
            Report2 r2 = new Report2();
            r2.Show();
            this.Hide();
        }
    }
}
