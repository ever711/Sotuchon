using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace XoSoTuChonBenTre
{
    public partial class Buy : System.Web.UI.Page
    {
        public static string strSo = "";
        public DataTable dt1 = new DataTable("table");
        public DataTable dt2 = new DataTable("table");
        public DataTable dt3 = new DataTable("table");
        public DataTable dt4 = new DataTable("table");
        public static double so1 = 0, so2 = 0, so3 = 0, so4 = 0;
        public static string _strNgay = "";
        private int indexSide { get; set; }
        SoXoTuChon_BenTreEntities context = new SoXoTuChon_BenTreEntities();

        //<asp:ListItem Selected = "True" Value="South">Miền Nam</asp:ListItem>
        //                                <asp:ListItem Value = "Middle" > Miền Trung</asp:ListItem>
        //                                  <asp:ListItem Value = "North" > Miền Bắc</asp:ListItem>
        private List<string> DaiValue = new List<string>() { "Middle", "Middle", "North" };
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                //ViewState["NamaKey"] = "Coba";
                string nilaiTextBox = txtNama.Text;
                //ViewState["NamaKey"] = nilaiTextBox;
                //string selectedTab = (string)ViewState["SelectedTab"];
                if (!string.IsNullOrEmpty(nilaiTextBox))
                {
                    string script = $@"<script type='text/javascript'> document.addEventListener('DOMContentLoaded', function () {{ var tabElement = document.querySelector('.nav-link[href=""#{nilaiTextBox}""]'); if (tabElement) {{ tabElement.click(); }}}}); </script> ";

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ActivateTab", script);
                }
            }
            else
            {
                _strNgay = DateTime.Now.ToString("yyyy-MM-dd");
                //txtNgay.Text = _strNgay;
                ProcessDaiWithTimeServer();
                so1 = 0; so2 = 0; so3 = 0; so4 = 0;
                Table1();
                Table2();
                Table3();
                Table4();
                TinhTong();
                ViewState["SelectedTab"] = "home";
            }
        }


        protected void Page_PreRenderComplete(object sender, EventArgs e)
        {
            // Save the selected tab index to ViewState before rendering the page
            //string selectedTab = Request.Form["__EVENTTARGET"];
            //if (!string.IsNullOrEmpty(selectedTab))
            //{
            //    ViewState["SelectedTab"] = selectedTab;
            //}
        }
        private void ProcessDaiWithTimeServer(bool isChangeSide = false)
        {
            var dais = context.Dais.ToList();
            var dataSource = new List<Dai>();
            var disabledDais = Utils.GetListDiabledDai();
            var dayForSide = Utils.GetDayOfWeekFor3Side();
            var setSide = false;
            for (int i = 0; i < disabledDais.Count; i++)
            {
                var valueRemove = i == 0 ? "South" : (i == 1 ? "Middle" : "North");
                if (disabledDais[i])
                {
                    var removeDai = ddlMien.Items.FindByValue(valueRemove);
                    ddlMien.Items.Remove(removeDai);
                }
                else {
                    if (!setSide && !isChangeSide) {
                        indexSide = (i + 1);
                        setSide = true;
                    }
                }
            }
            dais.ForEach(d =>
            {
                var dayofWeeks = d.Thu.Split(',');
                var listDays = dayofWeeks.ToList();
                if (listDays.Contains(dayForSide[d.Mien.Value - 1].ToString()) && !disabledDais[d.Mien.Value - 1] && (d.Mien == indexSide || indexSide < 0))
                {
                    dataSource.Add(d);
                }
            });
            ddlDai.DataSource = dataSource.OrderBy(x => x.Mien);
            ddlDai.DataBind();
        }


        protected void ChangeDai(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
        }
        protected void ChangeSide(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            var itemSelected = ddl.SelectedValue;
            switch (itemSelected)
            {
                case "North":
                    indexSide = 3;
                        break;
                case "South":
                    indexSide = 1;
                    break;
                case "Middle":
                    indexSide = 2;
                    break;
                default:
                    indexSide = -1;
                    break;
            }
            ProcessDaiWithTimeServer(true);
        }
        private void Table1()
        {
            if (Session["dt1"] == null)
            {
                dt1.Columns.Add("stt");
                dt1.Columns.Add("sotien", typeof(float));
                dt1.Rows.Clear();
                for (int i = 0; i < 100; i++)
                {
                    DataRow row = dt1.NewRow();
                    row["stt"] = i.ToString("0#");
                    row["sotien"] = 0;
                    dt1.Rows.Add(row);
                }
                Session["table1"] = dt1;
            }
            else
                dt1 = (DataTable)Session["dt1"];
            DList_dau.DataSource = dt1;
            DList_dau.DataBind();
        }
        private void Table2()
        {

            if (Session["dt2"] == null)
            {
                dt2.Columns.Add("stt");
                dt2.Columns.Add("sotien", typeof(float));
                dt2.Rows.Clear();
                for (int i = 0; i < 100; i++)
                {
                    DataRow row = dt2.NewRow();
                    row["stt"] = i.ToString("0#");
                    row["sotien"] = 0;
                    dt2.Rows.Add(row);
                }
                Session["dt2"] = dt2;
            }
            else
                dt2 = (DataTable)Session["dt2"];
            DList_cuoi.DataSource = dt2;
            DList_cuoi.DataBind();
        }
        private void Table3()
        {

            if (Session["dt3"] == null)
            {
                dt3.Columns.Add("stt");
                dt3.Columns.Add("sotien", typeof(float));
                dt3.Rows.Clear();
                for (int i = 0; i < 100; i++)
                {
                    DataRow row = dt3.NewRow();
                    row["stt"] = i.ToString("0#");
                    row["sotien"] = 0;
                    dt3.Rows.Add(row);
                }
                Session["dt3"] = dt3;
            }
            else
                dt3 = (DataTable)Session["dt3"];
            DList_daucuoi.DataSource = dt3;
            DList_daucuoi.DataBind();
        }
        private void Table4()
        {
            if (Session["dt4"] == null)
            {
                dt4.Columns.Add("stt");
                dt4.Columns.Add("sotien", typeof(float));
                dt4.Rows.Clear();
                for (int i = 0; i < 100; i++)
                {
                    DataRow row = dt4.NewRow();
                    row["stt"] = i.ToString("0#");
                    row["sotien"] = 0;
                    dt4.Rows.Add(row);
                }
                Session["dt4"] = dt4;
            }
            else
                dt4 = (DataTable)Session["dt4"];
            DList_18Lo.DataSource = dt4;
            DList_18Lo.DataBind();
        }
        protected void btnChapNhan_Click(object sender, EventArgs e)
        {

            foreach (DataListItem item in DList_dau.Items)
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
            dt1 = (DataTable)DList_dau.DataSource;
            Session["dt1"] = dt1;
            TinhTong();
        }

        protected void btnChapNhan2_Click(object sender, EventArgs e)
        {
            foreach (DataListItem item in DList_cuoi.Items)
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
            dt2 = (DataTable)DList_cuoi.DataSource;
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
                dt.Columns.Add("Taikhoan");
                Session["giohang"] = dt;
            }
            else
            {
                dt = (DataTable)Session["giohang"];
            }
            //string[] arrNgay = txtNgay.Text.Split('-');
            int ngay = 0;
            //DateTime ngay1 = new DateTime(1900, 1, 1);
            //DateTime ngay2 = new DateTime(int.Parse(arrNgay[0]), int.Parse(arrNgay[1]), int.Parse(arrNgay[2]));
            ngay = (DateTime.Now - new DateTime(1900, 1, 1)).Days;
            foreach (DataListItem item in DList_dau.Items)
            {
                Label lblSoTien = (Label)item.FindControl("lblSoTien");
                Label lblSTT = (Label)item.FindControl("lblSTT");
                if (lblSoTien.Text != "0")
                {
                    DataRow row = dt.NewRow();
                    row["Ngay"] = ngay;
                    row["MaDai"] = "BT";
                    row["Lo"] = "Đ/X";
                    row["Loai"] = 2;
                    row["So"] = lblSTT.Text;
                    row["SoTien"] = double.Parse(lblSoTien.Text) * 1000;
                    row["MaDai"] = ddlDai.Text.Trim();
                    dt.Rows.Add(row);
                }
            }
            foreach (DataListItem item in DList_cuoi.Items)
            {
                Label lblSoTien = (Label)item.FindControl("lblSoTien");
                Label lblSTT = (Label)item.FindControl("lblSTT");
                if (lblSoTien.Text != "0")
                {
                    DataRow row = dt.NewRow();
                    row["Ngay"] = ngay;
                    row["MaDai"] = "BT";
                    row["Lo"] = "X/C";
                    row["Loai"] = 2;
                    row["So"] = lblSTT.Text;
                    row["SoTien"] = double.Parse(lblSoTien.Text) * 1000;
                    row["MaDai"] = ddlDai.Text.Trim();
                    dt.Rows.Add(row);
                }
            }
            foreach (DataListItem item in DList_daucuoi.Items)
            {
                Label lblSoTien = (Label)item.FindControl("lblSoTien");
                Label lblSTT = (Label)item.FindControl("lblSTT");
                if (lblSoTien.Text != "0")
                {
                    DataRow row = dt.NewRow();
                    row["Ngay"] = ngay;
                    row["MaDai"] = "BT";
                    row["Lo"] = "Đ/C";
                    row["Loai"] = 2;
                    row["So"] = lblSTT.Text;
                    row["SoTien"] = double.Parse(lblSoTien.Text) * 1000 ;
                    row["MaDai"] = ddlDai.Text.Trim();
                    dt.Rows.Add(row);
                }
            }
            foreach (DataListItem item in DList_18Lo.Items)
            {
                Label lblSoTien = (Label)item.FindControl("lblSoTien");
                Label lblSTT = (Label)item.FindControl("lblSTT");
                if (lblSoTien.Text != "0")
                {
                    DataRow row = dt.NewRow();
                    row["Ngay"] = ngay;
                    row["MaDai"] = "BT";
                    row["Lo"] = "BL";
                    row["Loai"] = 2;
                    row["So"] = lblSTT.Text;
                    row["SoTien"] = double.Parse(lblSoTien.Text) * 1000;
                    row["MaDai"] = ddlDai.Text.Trim();
                    dt.Rows.Add(row);
                }
            }
            Session["giohang"] = dt;
            
        }

        protected void ddlDai_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void ddlSoLieu1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            var side = ddlMien.Text;
            var indexOfSide = side == "South" ? 1 : (side == "Middle" ? 2 : 3); 
            var money = double.Parse(ddl.SelectedValue);
            if (money > 0)
            {
                amountPreCal.Text = GetPreCalculate(money, 1, indexOfSide).ToString("#,##");
            }
        }
        
        protected void ddlSoLieu2_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            var side = ddlMien.Text;
            var indexOfSide = side == "South" ? 1 : (side == "Middle" ? 2 : 3);
            var money = double.Parse(ddl.SelectedValue);
            if (money > 0)
            {
                amountPreCal.Text = GetPreCalculate(money, 2, indexOfSide).ToString("#,##");
            }
        }
        
        protected void ddlSoLieu3_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            var money = double.Parse(ddl.SelectedValue);
            var side = ddlMien.Text;
            var indexOfSide = side == "South" ? 1 : (side == "Middle" ? 2 : 3);
            if (money > 0)
            {
                amountPreCal.Text = GetPreCalculate(money, 3, indexOfSide).ToString("#,##");
            }
        }
        
        protected void ddlSoLieu4_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            var money = double.Parse(ddl.SelectedValue);
            var side = ddlMien.Text;
            var indexOfSide = side == "South" ? 1 : (side == "Middle" ? 2 : 3);
            if (money > 0)
            {
                amountPreCal.Text = GetPreCalculate(money, 4, indexOfSide).ToString("#,##");
            }
        }

        private double GetPreCalculate(double money, int type, int Side) {
            if (Side < 0) return 0;
            double amount = 0;
            switch (type)
            {
                case 1:
                    if (Side == 1 || Side == 2) {
                        amount = money * 90;
                    }
                    break;
                case 2:
                    if (Side == 1 || Side == 2)
                    {
                        amount = money * 90;
                    }
                    break;
                case 3:
                    if (Side == 1 || Side == 2)
                    {
                        amount = money /2  * 90;
                    }
                    break;
                case 4:
                    if (Side == 1 || Side == 2)
                    {
                        amount = money / 18 * 90;
                    }
                    break;
                default:
                    amount = 0;
                    break;
            }
            return amount * 1000;
        }


        protected void btnChapNhan3_Click(object sender, EventArgs e)
        {
            foreach (DataListItem item in DList_daucuoi.Items)
            {
                Label lblSTT = (Label)item.FindControl("lblSTT");
                Label lblSoTien = (Label)item.FindControl("lblSoTien");
                string[] arr = Page.Request.Form["lblSoChon3"].Trim().Trim().Split(' ');
                if (arr.Length > 0)
                {
                    if (lblSTT.Text.Trim() == arr[0].Trim())
                        lblSoTien.Text = ddlSoLieu3.Text.Trim();
                }
                if (lblSoTien.Text != "0")
                    lblSTT.ForeColor = System.Drawing.Color.Blue;
                else
                    lblSTT.ForeColor = System.Drawing.Color.Black;
            }
            dt3 = (DataTable)DList_daucuoi.DataSource;
            Session["dt3"] = dt3;
            TinhTong();
        }

        protected void btnChapNhan4_Click(object sender, EventArgs e)
        {
            foreach (DataListItem item in DList_18Lo.Items)
            {
                Label lblSTT = (Label)item.FindControl("lblSTT");
                Label lblSoTien = (Label)item.FindControl("lblSoTien");
                string[] arr = Page.Request.Form["lblSoChon4"].Trim().Trim().Split(' ');
                if (arr.Length > 0)
                {
                    if (lblSTT.Text.Trim() == arr[0].Trim())
                        lblSoTien.Text = ddlSoLieu4.Text.Trim();
                }
                if (lblSoTien.Text != "0")
                    lblSTT.ForeColor = System.Drawing.Color.Blue;
                else
                    lblSTT.ForeColor = System.Drawing.Color.Black;
            }
            dt4 = (DataTable)DList_18Lo.DataSource;
            Session["dt4"] = dt4;
            TinhTong();
        }
        private void TinhTong()
        {
            so1 = 0; so2 = 0; so3 = 0; so4 = 0;
            foreach (DataListItem item in DList_dau.Items)
            {
                Label lblSoTien = (Label)item.FindControl("lblSoTien");
                so1 += double.Parse("0" + lblSoTien.Text);
            }
            foreach (DataListItem item in DList_cuoi.Items)
            {
                Label lblSoTien = (Label)item.FindControl("lblSoTien");
                so2 += double.Parse("0" + lblSoTien.Text);
            }
            foreach (DataListItem item in DList_daucuoi.Items)
            {
                Label lblSoTien = (Label)item.FindControl("lblSoTien");
                so3 += double.Parse("0" + lblSoTien.Text);
            }
            foreach (DataListItem item in DList_18Lo.Items)
            {
                Label lblSoTien = (Label)item.FindControl("lblSoTien");
                so4 += double.Parse("0" + lblSoTien.Text);
            }
            lblTongTam.Text = ((so1 + so2 + so3 + so4) * 1000).ToString("#,##");

        }
    }
}