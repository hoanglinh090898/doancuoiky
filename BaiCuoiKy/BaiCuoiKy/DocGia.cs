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
    public partial class DocGia : Form
    {
        localhost.LoaiSachService services = new localhost.LoaiSachService();
        public DocGia()
        {
            InitializeComponent();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            String UUID = Guid.NewGuid().ToString();
            txtMaDG.Text = UUID;
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            services.insertDocGia(txtMaDG.Text, txtTenDG.Text, txtCMND.Text, txtDiaChi.Text, txtSDT.Text);
            MessageBox.Show("Thêm thành công");
            DocGia_Load(sender, e);
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            services.updateDocGia(txtMaDG.Text, txtTenDG.Text, txtCMND.Text, txtDiaChi.Text, txtSDT.Text);
            MessageBox.Show("Sửa thành công");
            DocGia_Load(sender, e);
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            services.deleteDocGia(txtMaDG.Text);
            MessageBox.Show("Xóa thành công");
            DocGia_Load(sender, e);
        }

        private void DocGia_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = services.getAllDocGia();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dataGridView1.SelectedRows.Count > 0)
            {
                txtMaDG.Text = dataGridView1.SelectedRows[0].Cells[0].Value.ToString();
                txtTenDG.Text = dataGridView1.SelectedRows[0].Cells[1].Value.ToString();
                txtCMND.Text = dataGridView1.SelectedRows[0].Cells[2].Value.ToString();
                txtDiaChi.Text = dataGridView1.SelectedRows[0].Cells[3].Value.ToString();
                txtSDT.Text = dataGridView1.SelectedRows[0].Cells[4].Value.ToString();
            }
        }
    }
}
