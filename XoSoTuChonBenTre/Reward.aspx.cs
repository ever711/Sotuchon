using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace XoSoTuChonBenTre
{
    public partial class Reward : System.Web.UI.Page
    {
        public static string strSo = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            strSo = "";
            DataTable dt = new DataTable();
            dt.Columns.Add("SoPhieu");
            dt.Columns.Add("SoDT");
            dt.Columns.Add("SoLo");
            dt.Columns.Add("SoTien");
            dt.Columns.Add("KetQua");
            for (int i = 0; i < 10; i++)
            {
                DataRow row = dt.NewRow();
                row["SoPhieu"] = i.ToString("000#");
                dt.Rows.Add(row);
            }
            gridview1.DataSource = dt;
            gridview1.DataBind();
        }

    }
}