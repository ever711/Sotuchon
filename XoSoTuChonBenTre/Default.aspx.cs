using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using XoSoTuChonBenTre.Models;

namespace XoSoTuChonBenTre
{
    public partial class Default : System.Web.UI.Page
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

        }
        SoXoTuChon_BenTreEntities context = new SoXoTuChon_BenTreEntities();
        protected void btnOK_Click(object sender, EventArgs e)
        {
            var table = context.TaiKhoanHeThongs.FirstOrDefault(p=>p.TaiKhoan==txtTK.Text);
            if(table == null)
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Vui lòng chính xác tài khoản!')", true);
            else
            {
                if (table.KichHoat.Value == false)
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Tài khoản đã bị khoá. Vui lòng liên hệ Admin!')", true);
                else
                {
                    if (table.MatKhau == txtMK.Text)
                    {
                        HttpCookie coockie1 = new HttpCookie("taikhoan");
                        coockie1.Value = table.TaiKhoan;
                        coockie1.Expires = DateTime.Now.AddDays(100);
                        Response.Cookies.Add(coockie1);
                        //
                        HttpCookie coockie2 = new HttpCookie("ten");
                        coockie2.Value = table.HoTen;
                        coockie2.Expires = DateTime.Now.AddDays(100);
                        Response.Cookies.Add(coockie2);
                        //
                        HttpCookie coockie3 = new HttpCookie("quanly");
                        coockie3.Value = (table.LaQuanLy.Value == true) ? "1" : "0";
                        coockie3.Expires = DateTime.Now.AddDays(100);
                        Response.Cookies.Add(coockie3);
                        

                        HttpCookie coockieID = new HttpCookie("IDTaiKhoan");
                        coockieID.Value = table.IDTaiKhoan.ToString();
                        coockieID.Expires = DateTime.Now.AddDays(100);
                        Response.Cookies.Add(coockieID);

                        Utils.SetSessionModel(table);
                        Response.Redirect("About.aspx");
                        
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Vui lòng chính xác mật khẩu!')", true);
                    }
                }
            }    
        }
    }
}