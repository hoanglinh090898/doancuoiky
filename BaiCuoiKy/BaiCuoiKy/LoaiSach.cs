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
    public partial class LoaiSach : Form
    {
        localhost.LoaiSachService loaiSach = new localhost.LoaiSachService();
        public LoaiSach()
        {
            InitializeComponent();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
           // try
           // {
                loaiSach.insertLoaiSach(txtMaLoai.Text, txtTenLoai.Text);
           // }
           // finally
           // {
                MessageBox.Show("Thêm thành công");
            LoaiSach_Load(sender, e);
           // }
        }

        private void LoaiSach_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = loaiSach.getAllLoaiSach();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dataGridView1.SelectedRows.Count > 0)
            {
                txtMaLoai.Text = dataGridView1.SelectedRows[0].Cells[0].Value.ToString();
                txtTenLoai.Text = dataGridView1.SelectedRows[0].Cells[1].Value.ToString();
            }
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            loaiSach.updateLoaiSach(txtMaLoai.Text, txtTenLoai.Text);
            MessageBox.Show("Sửa thành công");
            LoaiSach_Load(sender, e);
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            loaiSach.deleteLoaiSach(txtMaLoai.Text);
            MessageBox.Show("Xóa thành công");
            LoaiSach_Load(sender, e);
        }
    }
}
