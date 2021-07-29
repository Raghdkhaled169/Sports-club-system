using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CrystalDecisions.Shared;
namespace SoftwareFinal
{
    public partial class Report : Form
    {
        CrystalReport1 CR;
        public Report()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            CR.SetParameterValue(0, sport_name.Text);
            crystalReportViewer1.ReportSource = CR;
        }

        private void Report_Load(object sender, EventArgs e)
        {
            CR = new CrystalReport1();
            foreach (ParameterDiscreteValue v in CR.ParameterFields[0].DefaultValues)
                sport_name.Items.Add(v.Value);
        }
    }
}
