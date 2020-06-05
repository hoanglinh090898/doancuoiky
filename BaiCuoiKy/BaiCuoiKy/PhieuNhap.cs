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
    public partial class PhieuNhap : Form
    {
        localhost.LoaiSachService services = new localhost.LoaiSachService();
        public PhieuNhap()
        {
            InitializeComponent();
        }

        private void thoátToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnThemPhieu_Click(object sender, EventArgs e)
        {
            String UUID = Guid.NewGuid().ToString();
            txtMaPhieuNhap.Text = UUID;
        }
        public void LoadSach()
        {
            DataTable dt = services.getAllSach();
            cbbMaSach.DisplayMember = "TenSach";
            cbbMaSach.ValueMember = "ID_Sach";
            cbbMaSach.DataSource = dt;
        }
        private void PhieuNhap_Load(object sender, EventArgs e)
        {
            LoadSach();
            cbbMaSach.SelectedIndex = -1;
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
        Boolean Kiemtra = false;
        private void btnThemSach_Click(object sender, EventArgs e)
        {
            string masach = cbbMaSach.SelectedValue.ToString();
            int soluong = int.Parse(txtSoLuong.Text);
            int dongia = int.Parse(txtDonGia.Text);
            if (dataGridView1.Rows.Count == 0)
                dataGridView1.Rows.Add(masach, cbbMaSach.Text.ToString(), soluong, dongia);
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
                    dataGridView1.Rows.Add(masach, cbbMaSach.Text.ToString(), soluong, dongia);
                else
                    MessageBox.Show("Ban da chon san pham nay roi");
            }
        }

        private void btnLuuPhieu_Click(object sender, EventArgs e)
        {
            services.NhapSach(txtMaPhieuNhap.Text, Convert.ToDateTime(dateTimePicker1.Value.ToString()), txtGhiChu.Text);
            foreach (DataGridViewRow dr in dataGridView1.Rows)
            {
                string masach = (dr.Cells[0].Value.ToString());
                int soluong = int.Parse(dr.Cells[2].Value.ToString());
                float dongia = float.Parse(dr.Cells[3].Value.ToString());
                services.ChiTietNhapSach(txtMaPhieuNhap.Text, masach,soluong, dongia);
            }
            MessageBox.Show("Lưu Thành Công");
        }
    }
}
