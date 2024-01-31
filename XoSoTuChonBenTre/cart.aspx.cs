using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XoSoTuChonBenTre
{
    public partial class cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            if (Session["giohang"] != null)
            {
                System.Data.DataTable dt = (System.Data.DataTable)Session["giohang"];
                gridview1.DataSource = dt;
                gridview1.DataBind();
            }
            else
            {
                DataTable dt = new DataTable("giohang");
                dt.Columns.Add("Ngay");
                dt.Columns.Add("MaDai");
                dt.Columns.Add("Lo");
                dt.Columns.Add("Loai");
                dt.Columns.Add("So");
                dt.Columns.Add("SoTien", typeof(double));
                Session["giohang"] = dt;
                gridview1.DataSource = dt;
                gridview1.DataBind();
            }
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            Session["giohang"] = null;
            System.Data.DataTable dt = (System.Data.DataTable)Session["giohang"];
            gridview1.DataSource = dt;
            gridview1.DataBind();
            Response.Redirect("cart.aspx");
        }

        protected void btnMua_Click(object sender, EventArgs e)
        {
            //mua-lu
            #region luu
            DataTable dt = (DataTable)Session["giohang"];
            var currentUser = Utils.GetSessionModel();
            if (dt != null && dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {

                    using (SoXoTuChon_BenTreEntities context = new SoXoTuChon_BenTreEntities())
                    {

                        Games table = new Games();
                        table.NgayChoi = int.Parse(dt.Rows[i]["Ngay"].ToString());
                        table.MaDai = dt.Rows[i]["MaDai"].ToString().Trim();
                        table.Lo = dt.Rows[i]["Lo"].ToString().Trim();
                        table.Loai = int.Parse(dt.Rows[i]["Loai"].ToString().Trim());
                        table.So = dt.Rows[i]["So"].ToString().Trim();
                        table.SoTien = double.Parse(dt.Rows[i]["SoTien"].ToString().Trim());
                        table.IDTaiKhoan = currentUser.IDTaiKhoan;
                        table.XacNhan = true;
                        table.ThoiGianDat = string.Format("{0}:{1}:{2}", DateTime.Now.Hour.ToString("0#"), DateTime.Now.Minute.ToString("0#"), DateTime.Now.Second.ToString("0#"));
                        if (!validateGame(table)) return;
                        context.Games.Add(table);

                        var account = context.TaiKhoanHeThongs.FirstOrDefault(x => x.IDTaiKhoan == currentUser.IDTaiKhoan);
                        if (account != null)
                        {
                            var tienConlai = account.ViTien - table.SoTien;
                            if (!account.ViTien.HasValue || account.ViTien.Value <= 0 || tienConlai < 0)
                            {
                                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Không đủ tài khoản!')", true);
                                return;
                            }
                            account.ViTien -= table.SoTien;
                        }


                        using (SoXoTuChon_BenTreEntities context2 = new SoXoTuChon_BenTreEntities())
                        {
                            var date = (int)(DateTime.Now.Date - (new DateTime(1900, 1, 1))).TotalDays;
                            RutTien table3 = new RutTien();
                            table3.NgayRut = date;
                            table3.IDTaiKhoan = currentUser.IDTaiKhoan;
                            table3.SoTien = table.SoTien;
                            table3.XacNhan = true;
                            table3.NgayXacNhan = date;
                            table3.LyDo = string.Format("Mua số {0} - Lô {1} - Loại {2} số - Đài {3}", table.So, table.Lo, table.Loai, table.MaDai);
                            context2.RutTien.Add(table3);
                            context2.SaveChanges();
                        }

                        context.SaveChanges();
                    }
                }
                //sau khi luu, xoa gio hang
                Session["giohang"] = null;
                Response.Redirect("About.aspx");
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Đơn hàng trống, vui lòng chọn số!')", true);
            #endregion
        }
        private bool validateGame(Games game) {
            var maDai = game.MaDai.Trim();
            using (SoXoTuChon_BenTreEntities context = new SoXoTuChon_BenTreEntities())
            {
                var dataDai = context.Dais.FirstOrDefault(x => x.MaDai == maDai);
                if (dataDai != null) {
                    var isDisable = Utils.IsDisabledDaiByTime(dataDai.Mien.Value);
                    var dayAvailable = Utils.GetDayOfWeekForSide(dataDai.Mien.Value);
                    var dayOfDai = dataDai.Thu.Split(',').ToList();
                    if (!dayOfDai.Contains(dayAvailable.ToString()))
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", String.Format("alert('Thanh toán không thành công do đài {0} đã bị khóa!')", dataDai.MaDai.Trim()), true);
                        return false;
                    }
                    if (isDisable) {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", String.Format("alert('Thanh toán không thành công do đài {0} đã bị khóa!')", dataDai.MaDai.Trim()), true);
                        return false;
                    }
                }
            }
            return true;
        }

        protected void gridview1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "xoa")
            {
                int sott = int.Parse(e.CommandArgument.ToString());
                DataTable dt = (DataTable)Session["giohang"];
                dt.Rows.RemoveAt(sott);
                dt.AcceptChanges();
                Session["giohang"] = dt;
                gridview1.DataSource = dt;
                gridview1.DataBind();
            }
        }
    }
}