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
    public class clsThongTinGiaoDich
    {
        private double soTien;
        private string lyDo;
        private string taiKhoan;
        private int ngay;
        private double tienNap;
        private double tienRut;
        public int Ngay { get => ngay; set => ngay = value; }
        public string TaiKhoan { get => taiKhoan; set => taiKhoan = value; }
        public string LyDo { get => lyDo; set => lyDo = value; }
        public double SoTien { get => soTien; set => soTien = value; }
        public double TienRut { get => tienRut; set => tienRut = value; }
        public double TienNap { get => tienNap; set => tienNap = value; }
    }
    public partial class wallet : System.Web.UI.Page
    {
        LevelDAL clsLevel = new LevelDAL();
        TaiKhoanHeThongDAL clsTK = new TaiKhoanHeThongDAL();
        SoXoTuChon_BenTreEntities context = new SoXoTuChon_BenTreEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            

            try
            {
                var currentUser = Utils.GetSessionModel();
                txtTaiKhoan.Text = currentUser.TaiKhoan;
                var table2 = context.TaiKhoanHeThongs.Where(p => p.IDTaiKhoan == currentUser.IDTaiKhoan);
                foreach (var item in table2)
                {
                    txtTen.Text = item.HoTen;
                    txtSTK.Text = item.SoTaiKhoan;
                    txtNganHang.Text = item.NganHang;
                    txtViTien.Text = double.Parse(item.ViTien.ToString()).ToString("#,##");
                    txtNgayDK.Text = DateTime.Parse(item.NgayDangKy.ToString()).ToString("dd/MM/yyyy");
                }
                //string sql = @"with abc as(select SoTien as TienNap,0 as TienRut,LyDo,TaiKhoan,NgayNap as Ngay from NapTien where IDTaiKhoanNap='"+ currentUser.IDTaiKhoan + "' and XacNhan=1 ";
                //sql += " union all ";
                //sql += @"select 0 as TienNap,SoTien as TienRut,LyDo,TaiKhoan,NgayRut as Ngay from RutTien where IDTaiKhoan='" + currentUser.IDTaiKhoan + "' and XacNhan=1 )";
                //sql += " select * from abc order by Ngay desc";
                var napTien = context.NapTien.Include("TaiKhoanHeThong").Where(x => x.IDTaiKhoanNap == currentUser.IDTaiKhoan && x.XacNhan.HasValue && x.XacNhan.Value).Select(x => new clsThongTinGiaoDich() { 
                    TienNap = x.SoTien.HasValue ? x.SoTien.Value : 0,
                    LyDo = x.LyDo,
                    TienRut = 0, 
                    Ngay = x.NgayNap.HasValue ? x.NgayNap.Value : 0,
                    TaiKhoan = currentUser.TaiKhoan
                });
                var rutTien = context.RutTien.Include("TaiKhoanHeThong").Where(x => x.IDTaiKhoan == currentUser.IDTaiKhoan && x.XacNhan.HasValue && x.XacNhan.Value).Select(x => new clsThongTinGiaoDich()
                {
                    TienNap = 0,
                    LyDo = x.LyDo,
                    TienRut = x.SoTien.HasValue ? x.SoTien.Value : 0,
                    Ngay = x.NgayRut.HasValue ? x.NgayRut.Value : 0,
                    TaiKhoan = currentUser.TaiKhoan
                }); ;
                //List< clsThongTinGiaoDich>table=  context.Database.SqlQuery<clsThongTinGiaoDich>(sql).ToList();

                var table = napTien.Concat(rutTien);
                gridview1.DataSource = table.OrderByDescending(x => x.Ngay).ToList();
                gridview1.DataBind();
            }
            catch (Exception)
            {
            }
        }
       
    }
}