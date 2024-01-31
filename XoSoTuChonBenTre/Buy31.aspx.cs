using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace XoSoTuChonBenTre
{
    public partial class Buy31 : System.Web.UI.Page
    {
        public static string strSo = "";
        public  DataTable dt1 = new DataTable("table");
        public  DataTable dt2 = new DataTable("table");
        public  DataTable dt3 = new DataTable("table");
        public  DataTable dt4 = new DataTable("table");
        public static double so1 = 0, so2 = 0, so3 = 0, so4 = 0;
        public static string _strNgay = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            _strNgay = DateTime.Now.ToString("yyyy-MM-dd");
            txtNgay.Text = _strNgay;
            so1 = 0; so2 = 0;
            Table1();
            Table2();
            TinhTong();
           
        }
        private void Table1()
        {
            if (Session["dt1"] == null)
            {
                dt1.Columns.Add("stt");
                dt1.Columns.Add("sotien", typeof(float));
                dt1.Rows.Clear();
                for (int i = 0; i < 10000; i++)
                {
                    DataRow row = dt1.NewRow();
                    row["stt"] = i.ToString("000#");
                    row["sotien"] = 0;
                    dt1.Rows.Add(row);
                }
                Session["table1"] = dt1;
            }
            else
                dt1 = (DataTable)Session["dt1"];
            DList_4Lo.DataSource = dt1;
            DList_4Lo.DataBind();
        }
        private void Table2()
        {

            if (Session["dt2"] == null)
            {
                dt2.Columns.Add("stt");
                dt2.Columns.Add("sotien", typeof(float));
                dt2.Rows.Clear();
                for (int i = 0; i < 10000; i++)
                {
                    DataRow row = dt2.NewRow();
                    row["stt"] = i.ToString("000#");
                    row["sotien"] = 0;
                    dt2.Rows.Add(row);
                }
                Session["dt2"] = dt2;
            }
            else
                dt2 = (DataTable)Session["dt2"];
            DList_16Lo.DataSource = dt2;
            DList_16Lo.DataBind();
        }
       
        protected void btnChapNhan_Click(object sender, EventArgs e)
        {

            foreach (DataListItem item in DList_4Lo.Items)
            {
                Label lblSTT = (Label)item.FindControl("lblSTT");
                Label lblSoTien = (Label)item.FindControl("lblSoTien");
                string[] arr = Page.Request.Form["lblSoChon"].Trim().Trim().Split(' ');
                if (arr.Length > 0)
                {
                    if (lblSTT.Text.Trim() == arr[0].Trim())
                        lblSoTien.Text = ddlSoLieu1.Text.Trim();
                }
                if (lblSoTien.Text != "0")
                    lblSTT.ForeColor = System.Drawing.Color.Blue;
                else
                    lblSTT.ForeColor = System.Drawing.Color.Black;
            }
            dt1 = (DataTable)DList_4Lo.DataSource;
            Session["dt1"] = dt1;
            TinhTong();
        }

        protected void btnChapNhan2_Click(object sender, EventArgs e)
        {
            foreach (DataListItem item in DList_16Lo.Items)
            {
                Label lblSTT = (Label)item.FindControl("lblSTT");
                Label lblSoTien = (Label)item.FindControl("lblSoTien");
                string[] arr = Page.Request.Form["lblSoChon2"].Trim().Trim().Split(' ');
                if (arr.Length > 0)
                {
                    if (lblSTT.Text.Trim() == arr[0].Trim())
                        lblSoTien.Text = ddlSoLieu2.Text.Trim();
                }
                if (lblSoTien.Text != "0")
                    lblSTT.ForeColor = System.Drawing.Color.Blue;
                else
                    lblSTT.ForeColor = System.Drawing.Color.Black;
            }
            dt2 = (DataTable)DList_16Lo.DataSource;
            Session["dt2"] = dt2;
            TinhTong();
        }

        protected void btnDatVe_Click(object sender, EventArgs e)
        {
            TaoGioHang();
            Response.Redirect("cart.aspx");
        }
        private void TaoGioHang()
        {
            DataTable dt = new DataTable("giohang");
            if (Session["giohang"] == null)
            {
              
                dt.Columns.Add("Ngay");
                dt.Columns.Add("MaDai");
                dt.Columns.Add("Lo");
                dt.Columns.Add("Loai");
                dt.Columns.Add("So");
                dt.Columns.Add("SoTien", typeof(double));
                Session["giohang"] = dt;
            }
            else
            {
                dt = (DataTable)Session["giohang"];
            }
            string[] arrNgay = txtNgay.Text.Split('-');
            int ngay = 0;
            DateTime ngay1 = new DateTime(1900,1,1);
            DateTime ngay2 = new DateTime(int.Parse(arrNgay[0]), int.Parse(arrNgay[2]), int.Parse(arrNgay[2]));
            ngay = (ngay2 - ngay1).Days;
            foreach (DataListItem item in DList_4Lo.Items)
            {
                Label lblSoTien = (Label)item.FindControl("lblSoTien");
                Label lblSTT = (Label)item.FindControl("lblSTT");
                if (lblSoTien.Text != "0")
                {
                    DataRow row = dt.NewRow();
                    row["Ngay"] = ngay;
                    row["MaDai"] = "BT";
                    row["Lo"] = "4L";
                    row["Loai"] = 4;
                    row["So"] = lblSTT.Text;
                    row["SoTien"] = double.Parse(lblSoTien.Text)*1000;
                    dt.Rows.Add(row);
                }
            }
            foreach (DataListItem item in DList_16Lo.Items)
            {
                Label lblSoTien = (Label)item.FindControl("lblSoTien");
                Label lblSTT = (Label)item.FindControl("lblSTT");
                if (lblSoTien.Text != "0")
                {
                    DataRow row = dt.NewRow();
                    row["Ngay"] = ngay;
                    row["MaDai"] = "BT";
                    row["Lo"] = "BL";
                    row["Loai"] = 4;
                    row["So"] = lblSTT.Text;
                    row["SoTien"] = double.Parse(lblSoTien.Text) * 1000;
                    dt.Rows.Add(row);
                }
            }
           
            Session["giohang"] = dt;
        }
       
        private void TinhTong()
        {
            so1 = 0; so2 = 0; so3 = 0; so4 = 0;
            foreach (DataListItem item in DList_4Lo.Items)
            {
                Label lblSoTien = (Label)item.FindControl("lblSoTien");
                    so1 += double.Parse("0"+lblSoTien.Text);
            }
            foreach (DataListItem item in DList_16Lo.Items)
            {
                Label lblSoTien = (Label)item.FindControl("lblSoTien");
                    so2 += double.Parse("0" + lblSoTien.Text);
            }
            lblTongTam.Text = ((so1 + so2 + so3 + so4)*1000).ToString("#,##");
           
        }
    }
}