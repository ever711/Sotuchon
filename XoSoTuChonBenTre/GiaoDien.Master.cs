using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XoSoTuChonBenTre
{
    public partial class GiaoDien : System.Web.UI.MasterPage
    {
        public static string strShow = "display:block";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            try
            {
                if (Request.Cookies["taikhoan"] == null)
                    Response.Redirect("logout.aspx");
                else
                {
                    lblHoTen.Text = Request.Cookies["ten"].Value.ToUpper();
                    if (Request.Cookies["quanly"].Value == "0")
                    {
                      strShow = "display:none";
                      string link = Request.Url.AbsolutePath;
                      if(link== "/Account.aspx"||link== "/Reward.aspx"||link== "/Confirm.aspx"||link== "/Reports.aspx" || link == "/wallet_in_confirm.aspx" || link == "/wallet_out_confirm.aspx")
                            Response.Redirect("logout.aspx");
                    }    
                    else
                        strShow = "display:block";
                } 
            }
            catch (Exception)
            {
                Response.Redirect("logout.aspx");
            }
        }
    }
}