using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class LoaiSach
    {
        public LoaiSach(string iD_Loai, string tenLoai)
        {
            ID_Loai = iD_Loai;
            TenLoai = tenLoai;
        }

        public string ID_Loai { get; set; }
        public string TenLoai { get; set; }
    }
}
