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
    public partial class Sach : Form
    {
        localhost.LoaiSachService services = new localhost.LoaiSachService();
        public Sach()
        {
            InitializeComponent();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            String UUID = Guid.NewGuid().ToString();
            txtMaSach.Text = UUID;
        }

        private void Sach_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = services.getAllSach();
            LoadLoaiSach();
            cbbLoai.SelectedIndex = -1;
        }

        public void LoadLoaiSach()
        {
            DataTable dt = services.getAllLoaiSach();
            cbbLoai.DisplayMember = "TenLoai";
            cbbLoai.ValueMember = "ID_Loai";
            cbbLoai.DataSource = dt;
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            services.insertSach(txtMaSach.Text, cbbLoai.SelectedValue.ToString(), txtTenSach.Text, int.Parse(txtSoLuong.Text), float.Parse(txtDonGia.Text), txtTinhTrang.Text);
            MessageBox.Show("Thêm Thành Công");
            Sach_Load(sender,e);
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            services.deleteSach(txtMaSach.Text);
            MessageBox.Show("Xóa Thành Công");
            Sach_Load(sender, e);
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dataGridView1.SelectedRows.Count > 0)
            {
                txtMaSach.Text = dataGridView1.SelectedRows[0].Cells[0].Value.ToString();
                cbbLoai.SelectedValue = dataGridView1.SelectedRows[0].Cells[1].Value;
                txtTenSach.Text = dataGridView1.SelectedRows[0].Cells[2].Value.ToString();
                txtSoLuong.Text = dataGridView1.SelectedRows[0].Cells[3].Value.ToString();
                txtDonGia.Text = dataGridView1.SelectedRows[0].Cells[4].Value.ToString();
                txtTinhTrang.Text = dataGridView1.SelectedRows[0].Cells[5].Value.ToString();
            }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            services.updateSach(txtMaSach.Text, cbbLoai.SelectedValue.ToString(), txtTenSach.Text, int.Parse(txtSoLuong.Text), float.Parse(txtDonGia.Text), txtTinhTrang.Text);
            MessageBox.Show("Sửa Thành Công");
            Sach_Load(sender,e);
        }
    }
}
