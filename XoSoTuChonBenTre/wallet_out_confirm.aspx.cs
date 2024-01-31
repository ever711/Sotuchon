using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using XoSoTuChonBenTre.Models;
using System.Data.Entity;

namespace XoSoTuChonBenTre
{
    public partial class wallet_out_confirm : System.Web.UI.Page
    {
        public static string strSo = "";
        SoXoTuChon_BenTreEntities context = new SoXoTuChon_BenTreEntities();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            strSo = "";
            txtTu.Text = DateTime.Now.ToString("yyyy-MM-dd");
            txtDen.Text = DateTime.Now.ToString("yyyy-MM-dd");
            btnTim_Click(sender, e);
        }

        protected void btnTim_Click(object sender, EventArgs e)
        {
            SessionModel currentUser = Utils.GetSessionModel();
            string[] arrNgay1 = txtTu.Text.Split('-');
            string[] arrNgay2 = txtDen.Text.Split('-');
            int ng1 = 0,ng2=0;
            DateTime ngay = new DateTime(1900, 1, 1);
            DateTime ngay1 = new DateTime(int.Parse(arrNgay1[0]), int.Parse(arrNgay1[1]), int.Parse(arrNgay1[2]));
            DateTime ngay2 = new DateTime(int.Parse(arrNgay2[0]), int.Parse(arrNgay2[1]), int.Parse(arrNgay2[2]));
            ng1 = (ngay1 - ngay).Days;
            ng2 = (ngay2 - ngay).Days;
            var table = context.RutTien.Include("TaiKhoanHeThong").Include("TaiKhoanHeThong1").Where(p => p.NgayRut >= ng1 && p.NgayRut <= ng2 && p.TaiKhoanHeThong != null && p.TaiKhoanHeThong.IDDaiLy == currentUser.IDTaiKhoan)
                .OrderByDescending(x => x.NgayRut).ThenByDescending(x => x.IDRut); ;
            var data = table.ToList();
            data.ForEach(x => {
                x.TenTaiKhoan = x.TaiKhoanHeThong.TaiKhoan;
                x.TenNguoiXacNhan = x.TaiKhoanHeThong1?.TaiKhoan;
            });
            gridview1.DataSource = data;
            gridview1.DataBind();
        }

        protected void gridview1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            SessionModel currentUser = Utils.GetSessionModel();
            DateTime ngay1 = new DateTime(1900, 1, 1);
            DateTime ngay2 = DateTime.Now;
            double _ViTien = 0, _SoTien = 0;
            GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
            Label lblTK = row.FindControl("lblTK") as Label;
            Label lblSoTien = row.FindControl("lblSoTien") as Label;
            _SoTien =(lblSoTien.Text=="")?0: double.Parse(lblSoTien.Text);
            var tableVT = context.TaiKhoanHeThongs.Where(p=>p.TaiKhoan== lblTK.Text);
            foreach (var item in tableVT)
            {
                _ViTien =(item.ViTien.ToString()=="")?0: double.Parse(item.ViTien.ToString());
            }
            if(e.CommandName== "xacnhan")
            {
                int _ID = int.Parse(e.CommandArgument.ToString());
                using (SoXoTuChon_BenTreEntities context1 = new SoXoTuChon_BenTreEntities())
                {
                    using (DbContextTransaction transaction = context.Database.BeginTransaction())
                    {
                        try
                        {
                            //cộng tiền Ví
                            var taiKhoanHeThongs = context1.TaiKhoanHeThongs.Where(p => p.TaiKhoan == lblTK.Text || p.IDTaiKhoan == currentUser.IDTaiKhoan);
                            var adminAccount = taiKhoanHeThongs.FirstOrDefault(x => x.IDTaiKhoan == currentUser.IDTaiKhoan);
                            adminAccount.ViTien += _SoTien;
                            var userAccount = taiKhoanHeThongs.FirstOrDefault(x => x.TaiKhoan == lblTK.Text);
                            //userAccount.ViTien -= _SoTien;
                            //ghi nhận xác nhận 

                            RutTien table3 = context1.RutTien.Single(p => p.IDRut == _ID);
                            table3.SoTien = _SoTien;
                            table3.XacNhan = true;
                            table3.IDNguoiXacNhan = currentUser.IDTaiKhoan;
                            table3.NgayXacNhan = (ngay2 - ngay1).Days;
                            table3.LyDo = string.Format("Quản lý {0} Xác nhận {1} rút {2}", adminAccount.TaiKhoan, userAccount.TaiKhoan, _SoTien.ToString("N0"));
                            context1.SaveChanges();
                            transaction.Commit();
                        }
                        catch (Exception ex)
                        {
                            transaction.Rollback();
                            throw new Exception(ex.Message);
                        }
                    }
                }
            }
            if (e.CommandName == "huyxacnhan")
            {
                int _ID = int.Parse(e.CommandArgument.ToString());
                using (SoXoTuChon_BenTreEntities context1 = new SoXoTuChon_BenTreEntities())
                {
                    //hoàn tiền Ví
                    //TaiKhoanHeThong table2 = context1.TaiKhoanHeThongs.Single(p => p.TaiKhoan == lblTK.Text);
                    //table2.ViTien = _ViTien + _SoTien;
                    //context1.SaveChanges();
                    //ghi nhận huỷ xác nhận 

                    var userAccount = context1.TaiKhoanHeThongs.FirstOrDefault(x => x.TaiKhoan == lblTK.Text);
                    userAccount.ViTien += _SoTien;
                    RutTien table3 = context1.RutTien.Single(p => p.IDRut == _ID);
                    table3.SoTien = _SoTien;
                    table3.XacNhan = false;
                    table3.IDNguoiXacNhan = currentUser.IDTaiKhoan;
                    table3.NgayXacNhan = (ngay2 - ngay1).Days;
                    table3.LyDo = string.Format("Quản lý {0} hủy nạp {1} từ tài khoản {2}", currentUser.TaiKhoan, _SoTien.ToString("N0"), userAccount.TaiKhoan);
                    context1.SaveChanges();
                }
            }

            btnTim_Click(sender, e);
        }
    }
}