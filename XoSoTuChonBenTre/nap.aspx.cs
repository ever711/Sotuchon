using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace XoSoTuChonBenTre
{
    public partial class nap : System.Web.UI.Page
    {
        public static string strSo = "";
        SoXoTuChon_BenTreEntities context = new SoXoTuChon_BenTreEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            strSo = "";
            txtTu.Text = DateTime.Now.ToString("yyyy-MM-dd");
            txtDen.Text = DateTime.Now.ToString("yyyy-MM-dd");
            var table = context.NapTien;
            gridview1.DataSource = table.ToList() ;
            gridview1.DataBind();
        }

    }
}