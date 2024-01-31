using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XoSoTuChonBenTre
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["tk"] = "";
            Session.Abandon();
            Utils.ClearSessionModel();
            Response.Redirect("Default.aspx");
        }
    }
}