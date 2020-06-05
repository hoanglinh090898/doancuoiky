using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace BaiCuoiKy
{
    class connection
    {
        public SqlConnection ketnoi()
        {
            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-O371B99\SQLEXPRESS;Initial Catalog=ThuVien;Integrated Security=True");
            return conn;
        }
    }
}
