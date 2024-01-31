using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace XoSoTuChonBenTre.Models
{
    public class SessionModel
    {
        public SessionModel() { 
        
        }

        public SessionModel(TaiKhoanHeThong acount) {
            this.IDTaiKhoan = acount.IDTaiKhoan;
            this.TaiKhoan = acount.TaiKhoan;
            this.LaQuanLy = acount.LaQuanLy;
            this.IDDaiLy = acount.IDDaiLy;
            this.MaTaiKhoan = acount.MaTaiKhoan;
            this.ChietKhau = acount.ChietKhau;
            this.SoDienThoai = acount.SoDienThoai;
        }
        public int IDTaiKhoan { get; set; }
        public int? IDDaiLy { get; set; }
        public string TaiKhoan { get; set; }
        public bool? LaQuanLy { get; set; }
        public string MaDaiLy { get; set; }
        public string MaTaiKhoan { get; set; }
        public string ChietKhau { get; set; }
        public string SoDienThoai { get; set; }
    }
}