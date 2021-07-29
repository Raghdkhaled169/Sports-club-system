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
    public partial class Member_menu : Form
    {
        public Member_menu()
        {
            InitializeComponent();
        }

        private void att_trip_btn_Click(object sender, EventArgs e)
        {
            Att_Event ev = new Att_Event();
            ev.Show();
            this.Hide();

        }

        private void att_event_btn_Click(object sender, EventArgs e)
        {
            
            Att_Trip tr = new Att_Trip();
            tr.Show();
            this.Hide();
        }

        private void renew_btn_Click(object sender, EventArgs e)
        {
            Renew_membership r = new Renew_membership();
            r.Show();
            this.Hide();

        }

        private void back_btn_Click(object sender, EventArgs e)
        {
            Mian_Page m = new Mian_Page();
            m.Show();
            this.Hide();
        }
    }
}
