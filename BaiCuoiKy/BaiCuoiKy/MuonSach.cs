using DevExpress.LookAndFeel;
using DevExpress.XtraReports.UI;
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
    public partial class MuonSach : Form
    {
        localhost.LoaiSachService services = new localhost.LoaiSachService();
        public MuonSach()
        {
            InitializeComponent();
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void MuonSach_Load(object sender, EventArgs e)
        {
            LoadDocGia();
            cbbDocGia.SelectedIndex = -1;
            LoadSach();
            cbbMaSach.SelectedIndex = -1;
            //cbbMaSach.SelectedIndex = -1;
        }

        private void cbbDocGia_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbbDocGia.SelectedIndex == -1)
            {
                txtTenDocGia.Text = "";
            }
            else
            {
                DataTable dt = services.getDocGiaByID(cbbDocGia.SelectedValue.ToString());
                txtTenDocGia.Text = dt.Rows[0]["TenDocGia"].ToString();
            }
        }

        private void cbbMaSach_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbbMaSach.SelectedIndex == -1)
                txtDonGia.Text = "";
            else
            {
                DataTable dt = services.loadSachByID(cbbMaSach.SelectedValue.ToString());
                txtDonGia.Text = dt.Rows[0]["DonGia"].ToString();
            }
        }

        public void LoadDocGia()
        {
            DataTable dt = services.getAllDocGia();
            cbbDocGia.DisplayMember = "ID_DocGia";
            cbbDocGia.ValueMember = "ID_DocGia";
            cbbDocGia.DataSource = dt;
        }
        public void LoadSach()
        {
            DataTable dt = services.getAllSach();
            cbbMaSach.DisplayMember = "TenSach";
            cbbMaSach.ValueMember = "ID_Sach";
            cbbMaSach.DataSource = dt;
        }

        private void btnThemPhieuMuon_Click(object sender, EventArgs e)
        {
            String UUID = Guid.NewGuid().ToString();
            txtMaPhieuMuon.Text = UUID;
        }
        Boolean Kiemtra = false;
        private void btnThemSach_Click(object sender, EventArgs e)
        {
            string masach = cbbMaSach.SelectedValue.ToString();
            int soluong = int.Parse(txtSoLuong.Text);
            float thanhtien = float.Parse(txtDonGia.Text) * soluong;
            if (dataGridView1.Rows.Count == 0)
                dataGridView1.Rows.Add(masach, cbbMaSach.Text.ToString(), soluong, thanhtien);
            else
            {
                foreach (DataGridViewRow dr in dataGridView1.Rows)
                {
                    if (dr.Cells[0].Value.ToString() == masach)
                        Kiemtra = true;
                    else
                        Kiemtra = false;
                }
                if (Kiemtra == false)
                    dataGridView1.Rows.Add(masach, cbbMaSach.Text.ToString(), soluong, thanhtien);
                else
                    MessageBox.Show("Ban da chon san pham nay roi");
            }
        }

        private void btnLuuPhieuMuon_Click(object sender, EventArgs e)
        {
            services.MuonSach(txtMaPhieuMuon.Text,Convert.ToDateTime(dateTimePicker1.Value.ToString()), Convert.ToDateTime(dateTimePicker2.Value.ToString()), cbbDocGia.SelectedValue.ToString());
            foreach (DataGridViewRow dr in dataGridView1.Rows)
            {
                string masach = (dr.Cells[0].Value.ToString());
                int soluong = int.Parse(dr.Cells[2].Value.ToString());
                float thanhtien = float.Parse(dr.Cells[3].Value.ToString());
                services.ChiTietMuonSach(txtMaPhieuMuon.Text, masach, soluong, thanhtien);
            }
            MessageBox.Show("Lưu Thành Công");
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Report.report_DoanhThuThang frmtv = new Report.report_DoanhThuThang();
            using (ReportPrintTool printTool = new ReportPrintTool(frmtv))
            {
                // frmtv.Parameters[0].Value = txtMaHD.Text;
                printTool.ShowPreviewDialog(UserLookAndFeel.Default);
            }
        }
    }
}
