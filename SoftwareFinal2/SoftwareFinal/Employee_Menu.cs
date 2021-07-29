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
    public partial class Employee_Menu : Form
    {
        public Employee_Menu()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Assign_memeber_sport a = new Assign_memeber_sport();
            a.Show();
            this.Hide();
        }

        private void assign_trainer_btn_Click(object sender, EventArgs e)
        {
            Assign_trainer_sport a = new Assign_trainer_sport();
            a.Show();
            this.Hide();

        }

        private void maintain_sport_btn_Click(object sender, EventArgs e)
        {
            Maintain_sport_schedule s = new Maintain_sport_schedule();
            s.Show();
            this.Hide();
        }

        private void add_event_btn_Click(object sender, EventArgs e)
        {
            Add_Event a = new Add_Event();
            a.Show();
            this.Hide();

        }

        private void add_trip_btn_Click(object sender, EventArgs e)
        {
            Add_Trip a = new Add_Trip();
            a.Show();
            this.Hide();

        }

        private void add_trainer_btn_Click(object sender, EventArgs e)
        {
            Add_Trainer t = new Add_Trainer();
            t.Show();
            this.Hide();

        }

        private void maintain_memInfo_btn_Click(object sender, EventArgs e)
        {
            Maintain_member_info m = new Maintain_member_info();
            m.Show();
            this.Hide();

        }

        private void back_btn_Click(object sender, EventArgs e)
        {
            Mian_Page m = new Mian_Page();
            m.Show();
            this.Hide();
        }

        private void Employee_Menu_Load(object sender, EventArgs e)
        {

        }
    }
}
