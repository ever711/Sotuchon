using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace XoSoTuChonBenTre
{
    public partial class history_buy : System.Web.UI.Page
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
            
            string[] arrNgay1 = txtTu.Text.Split('-');
            string[] arrNgay2 = txtDen.Text.Split('-');
            int ng1 = 0,ng2=0;
            DateTime ngay = new DateTime(1900, 1, 1);
            DateTime ngay1 = new DateTime(int.Parse(arrNgay1[0]), int.Parse(arrNgay1[1]), int.Parse(arrNgay1[2]));
            DateTime ngay2 = new DateTime(int.Parse(arrNgay2[0]), int.Parse(arrNgay2[1]), int.Parse(arrNgay2[2]));
            ng1 = (ngay1 - ngay).Days;
            ng2 = (ngay2 - ngay).Days;
            var currentUser = Utils.GetSessionModel();
            var table = context.Games.Where(p => p.NgayChoi >= ng1 && p.NgayChoi <= ng2
                                    && p.IDTaiKhoan == currentUser.IDTaiKhoan).OrderByDescending(x => x.NgayChoi);
            var data = table.ToList();
            data.ForEach(x => {
                x.TenTaiKhoan = x.TaiKhoanHeThong.TaiKhoan;
            });
            gridview1.DataSource = data;
            gridview1.DataBind();
        }

        protected void gridview1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            var currentUser = Utils.GetSessionModel();
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
                    Games table = context1.Games.Single(p => p.IDGame == _ID);
                    table.XacNhan = true;
                    context1.SaveChanges();
                    //trừ tiền Ví
                    TaiKhoanHeThong table2 = context1.TaiKhoanHeThongs.Single(p=>p.TaiKhoan== lblTK.Text);
                    table2.ViTien = _ViTien - _SoTien;
                    context1.SaveChanges();
                    //ghi nhận rút tiền
                    var tableGame = context1.Games.Where(p => p.IDGame == _ID);
                    foreach (var item in tableGame)
                    {
                        using (SoXoTuChon_BenTreEntities context2 = new SoXoTuChon_BenTreEntities())
                        {
                            RutTien table3 = new RutTien();
                            table3.NgayRut = (ngay2 - ngay1).Days;
                            //table3.TaiKhoan = lblTK.Text;   neeed work
                            table3.SoTien = _SoTien;
                            table3.XacNhan = true;
                            table3.IDNguoiXacNhan = currentUser.IDTaiKhoan;
                            table3.NgayXacNhan = table3.NgayRut;
                            table3.LyDo = string.Format("Mua số {0} - Lô {1} - Loại {2} số - Đài {3}", item.So, item.Lo, item.Loai, item.MaDai);
                            context2.RutTien.Add(table3);
                            context2.SaveChanges();
                        }
                    }
                    
                }
            }
            if (e.CommandName == "huyxacnhan")
            {
                using (SoXoTuChon_BenTreEntities context1 = new SoXoTuChon_BenTreEntities())
                {
                    int _ID = int.Parse(e.CommandArgument.ToString());
                    Games table = context1.Games.Single(p => p.IDGame == _ID);
                    table.XacNhan = false;
                    context1.SaveChanges();
                    //cộng hoàn tiền Ví
                    TaiKhoanHeThong table2 = context1.TaiKhoanHeThongs.Single(p => p.TaiKhoan == lblTK.Text);
                    table2.ViTien = _ViTien + _SoTien;
                    context1.SaveChanges();
                    //ghi nhận cộng tiền vào ví
                    var tableGame = context1.Games.Where(p => p.IDGame == _ID);
                    foreach (var item in tableGame)
                    {
                        using (SoXoTuChon_BenTreEntities context2 = new SoXoTuChon_BenTreEntities())
                        {
                            NapTien table3 = new NapTien();
                            table3.NgayNap = (ngay2 - ngay1).Days;
                            //table3.TaiKhoan = lblTK.Text; //need work
                            table3.SoTien = _SoTien;
                            table3.XacNhan = true;
                            table3.IDTaiKhoanXacNhan = currentUser.IDTaiKhoan;
                            table3.NgayXacNhan = table3.NgayNap;
                            table3.LyDo = string.Format("Huỷ mua số {0} - Lô {1} - Loại {2} số - Đài {3}", item.So, item.Lo, item.Loai, item.MaDai);
                            context2.NapTien.Add(table3);
                            context2.SaveChanges();
                        }
                    }
                }
            }
            if (e.CommandName == "xoa")
            {
                using (SoXoTuChon_BenTreEntities context1 = new SoXoTuChon_BenTreEntities())
                {
                    int _ID = int.Parse(e.CommandArgument.ToString());
                    var table = context1.Games.Single(p => p.IDGame == _ID);
                    context1.Games.Remove(table);
                    context1.SaveChanges();
                }
            }

            btnTim_Click(sender, e);
        }
    }
}