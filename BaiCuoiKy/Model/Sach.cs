using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Sach
    {
        public Sach(string iD_Sach, string iD_Loai, string tenSach, int soLuong, float donGia, string tinhTrang)
        {
            ID_Sach = iD_Sach;
            ID_Loai = iD_Loai;
            TenSach = tenSach;
            SoLuong = soLuong;
            DonGia = donGia;
            TinhTrang = tinhTrang;
        }

        public string ID_Sach { get; set; }
        public string ID_Loai { get; set; }
        public string TenSach { get; set; }
        public int SoLuong { get; set; }
        public float DonGia { get; set; }
        public string TinhTrang { get; set; }
    }
}
