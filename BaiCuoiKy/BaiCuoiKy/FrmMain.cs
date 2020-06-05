using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BaiCuoiKy
{
    public partial class FrmMain : Form
    {
        public FrmMain()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            DocGia dg = new DocGia();
            dg.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            MuonSach ms = new MuonSach();
            ms.Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            PhieuNhap pn = new PhieuNhap();
            pn.Show();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            LoaiSach ls = new LoaiSach();
            ls.Show();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Sach s = new Sach();
            s.Show();
        }
    }
}
