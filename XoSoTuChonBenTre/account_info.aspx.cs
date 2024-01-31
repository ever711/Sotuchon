using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DAL;
using Public;

namespace XoSoTuChonBenTre
{
    public partial class account_info : System.Web.UI.Page
    {
        LevelDAL clsLevel = new LevelDAL();
        TaiKhoanHeThongDAL clsTK = new TaiKhoanHeThongDAL();
        SoXoTuChon_BenTreEntities context = new SoXoTuChon_BenTreEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            try
            {
                if (Request.Cookies["taikhoan"] != null)
                    txtTaiKhoan.Text = Request.Cookies["taikhoan"].Value;
                var table = context.TaiKhoanHeThongs.Where(p=>p.TaiKhoan== txtTaiKhoan.Text);
                foreach (var item in table)
                {
                    txtMatKhau.Text = item.MatKhau;
                    txtMa.Text = item.MaTaiKhoan;
                    txtTen.Text = item.HoTen;
                    txtDT.Text = item.SoDienThoai;
                    txtDiaChi.Text = item.DiaChi;
                    txtSTK.Text = item.SoTaiKhoan;
                    txtNganHang.Text = item.NganHang;
                    txtChietKhau.Text = item.ChietKhau;
                    txtViTien.Text = double.Parse(item.ViTien.ToString()).ToString("#,##");
                    ddlKichHoat.Text =( item.KichHoat.ToString().ToLower()=="true")?"1":"0";
                    txtNgayDK.Text =DateTime.Parse(item.NgayDangKy.ToString()).ToString("dd/MM/yyyy");
                }
            }
            catch (Exception)
            {
            }
        }
        protected void btnSua_Click(object sender, EventArgs e)
        {
            
            TaiKhoanHeThong table = context.TaiKhoanHeThongs.Single(p=>p.TaiKhoan == txtTaiKhoan.Text);
            table.HoTen = txtTen.Text.Trim();
            table.SoDienThoai = txtDT.Text;
            table.DiaChi = txtDiaChi.Text;
            table.SoTaiKhoan = txtSTK.Text;
            table.NganHang = txtNganHang.Text;
            context.SaveChanges();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Thông tin của bạn đã được cập nhật!')", true);
        }
       
    }
}