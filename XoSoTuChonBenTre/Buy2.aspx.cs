using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace XoSoTuChonBenTre
{
    public partial class Buy2 : System.Web.UI.Page
    {
        public static string strSo = "";
        public  DataTable dt1 = new DataTable("table");
        public  DataTable dt2 = new DataTable("table");
        public  DataTable dt3 = new DataTable("table");
        public  DataTable dt4 = new DataTable("table");
        public DataTable dt5 = new DataTable("table");
        public static double so1 = 0, so2 = 0, so3 = 0, so4 = 0, so5 = 0;
        public static string _strNgay = "";
        SoXoTuChon_BenTreEntities context = new SoXoTuChon_BenTreEntities();
        private int indexSide = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            _strNgay = DateTime.Now.ToString("yyyy-MM-dd");
            ProcessDaiWithTimeServer();
            so1 = 0; so2 = 0; so3 = 0; so4 = 0; so5 = 0;
            Table1();
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
                else
                {
                    if (!setSide && !isChangeSide)
                    {
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

        private void Table1()
        {
            if (Session["dt1"] == null)
            {
                dt1.Columns.Add("stt");
                dt1.Rows.Clear();
                for (int i = 0; i < 10; i++)
                {
                    DataRow row1 = dt1.NewRow();
                    row1["stt"] = i.ToString();
                    dt1.Rows.Add(row1);
                }
                Session["table1"] = dt1;
            }
            else
                dt1 = (DataTable)Session["dt1"];
            DList_1.DataSource = dt1;
            DList_1.DataBind();
            DList_2.DataSource = dt1;
            DList_2.DataBind();
            DList_3.DataSource = dt1;
            DList_3.DataBind();
            //
            DataTable dtTien = new DataTable("tien");
            dtTien.Columns.Add("tien");
            dtTien.Columns.Add("SoTien");
            DataRow row = dtTien.NewRow();
            row["tien"] = "10k";
            row["SoTien"] = "10000";
            dtTien.Rows.Add(row);
            row = dtTien.NewRow();
            row["tien"] = "20k";
            row["SoTien"] = "20000";
            dtTien.Rows.Add(row);
            row = dtTien.NewRow();
            row["tien"] = "50k";
            row["SoTien"] = "50000";
            dtTien.Rows.Add(row);
            row = dtTien.NewRow();
            row["tien"] = "100k";
            row["SoTien"] = "100000";
            dtTien.Rows.Add(row);
            row = dtTien.NewRow();
            row["tien"] = "200k";
            row["SoTien"] = "200000";
            dtTien.Rows.Add(row);
            row = dtTien.NewRow();
            row["tien"] = "500k";
            row["SoTien"] = "500000";
            dtTien.Rows.Add(row);
            gridTien.DataSource = dtTien;
            gridTien.DataBind();
        }

        protected void DList_1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "chon")
            {
                GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
                LinkButton lblChon = row.FindControl("lblChon") as LinkButton;
                Label lblSTT = row.FindControl("lblSTT") as Label;
                if (lblChon.BackColor.Name != "Red")
                {
                    lblChon.BackColor = System.Drawing.Color.Red;
                    foreach (GridViewRow item in DList_1.Rows)
                    {
                        Label lblSTT1 = (Label)item.FindControl("lblSTT");
                        LinkButton lblChon1 = (LinkButton)item.FindControl("lblChon");
                        if (lblSTT1.Text != lblSTT.Text)
                        {
                            if (lblChon1.BackColor.Name == "Red")
                                lblChon1.BackColor = System.Drawing.Color.White;
                        }
                    }
                }
                else
                    lblChon.BackColor = System.Drawing.Color.White;

            }
        }

        protected void DList_2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "chon")
            {
                GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
                LinkButton lblChon = row.FindControl("lblChon") as LinkButton;
                Label lblSTT = row.FindControl("lblSTT") as Label;
                if (lblChon.BackColor.Name != "Red")
                {
                    lblChon.BackColor = System.Drawing.Color.Red;
                    foreach (GridViewRow item in DList_2.Rows)
                    {
                        Label lblSTT1 = (Label)item.FindControl("lblSTT");
                        LinkButton lblChon1 = (LinkButton)item.FindControl("lblChon");
                        if (lblSTT1.Text != lblSTT.Text)
                        {
                            if (lblChon1.BackColor.Name == "Red")
                                lblChon1.BackColor = System.Drawing.Color.White;
                        }
                    }
                }
                else
                    lblChon.BackColor = System.Drawing.Color.White;

            }
        }

        protected void DList_3_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "chon")
            {
                GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
                LinkButton lblChon = row.FindControl("lblChon") as LinkButton;
                Label lblSTT = row.FindControl("lblSTT") as Label;
                if (lblChon.BackColor.Name != "Red")
                {
                    lblChon.BackColor = System.Drawing.Color.Red;
                    foreach (GridViewRow item in DList_3.Rows)
                    {
                        Label lblSTT1 = (Label)item.FindControl("lblSTT");
                        LinkButton lblChon1 = (LinkButton)item.FindControl("lblChon");
                        if (lblSTT1.Text != lblSTT.Text)
                        {
                            if (lblChon1.BackColor.Name == "Red")
                                lblChon1.BackColor = System.Drawing.Color.White;
                        }
                    }
                }
                else
                    lblChon.BackColor = System.Drawing.Color.White;

            }
        }
        private void setColor(object sender)
        {
            Button btn = (Button)sender;
            if (btn.CssClass == "btn btn-dark")
                btn.CssClass = "btn btn-danger";
            else
                btn.CssClass = "btn btn-dark";
        }
        protected void btnDauCuoi_Click(object sender, EventArgs e)
        {
            setColor(sender);
            btnDau.CssClass = "btn btn-dark";
            btn7Lo.CssClass = "btn btn-dark";
            btn17Lo.CssClass = "btn btn-dark";
            btnCuoi.CssClass = "btn btn-dark";
        }

      
        protected void btnCuoi_Click(object sender, EventArgs e)
        {
            setColor(sender);
            btnDau.CssClass = "btn btn-dark";
            btn7Lo.CssClass = "btn btn-dark";
            btn17Lo.CssClass = "btn btn-dark";
            btnDauCuoi.CssClass = "btn btn-dark";
        }
        protected void btn7Lo_Click(object sender, EventArgs e)
        {
            setColor(sender);
            btnDau.CssClass = "btn btn-dark";
            btnCuoi.CssClass = "btn btn-dark";
            btn17Lo.CssClass = "btn btn-dark";
            btnDauCuoi.CssClass = "btn btn-dark";
        }

        protected void btn17Lo_Click(object sender, EventArgs e)
        {
            setColor(sender);
            btnDau.CssClass = "btn btn-dark";
            btnCuoi.CssClass = "btn btn-dark";
            btn7Lo.CssClass = "btn btn-dark";
            btnDauCuoi.CssClass = "btn btn-dark";
        }
        protected void btnDau_Click(object sender, EventArgs e)
        {
            setColor(sender);
            btnCuoi.CssClass = "btn btn-dark";
            btn7Lo.CssClass = "btn btn-dark";
            btn17Lo.CssClass = "btn btn-dark";
            btnDauCuoi.CssClass = "btn btn-dark";
        }
        private bool checkChonTien()
        {
            bool chk = false;
            foreach (GridViewRow item1 in gridTien.Rows)
            {
                LinkButton lblChon = item1.FindControl("lblChon") as LinkButton;
                Label lblSTT = item1.FindControl("lblSTT") as Label;
                Label lblID = (Label)item1.FindControl("lblID");
                if (lblID.Text == "1")
                {
                    chk = true;
                    break;
                }   
            }
            return chk;
        }
        private bool checkChonSo()
        {
            int num = 0;
            foreach (GridViewRow item1 in DList_1.Rows)
            {
                LinkButton lblChon = item1.FindControl("lblChon") as LinkButton;
                Label lblSTT = item1.FindControl("lblSTT") as Label;
                if (lblChon.BackColor.Name == "Red")
                {
                    num++;
                    break;
                }
            }
            foreach (GridViewRow item2 in DList_2.Rows)
            {
                LinkButton lblChon = item2.FindControl("lblChon") as LinkButton;
                Label lblSTT = item2.FindControl("lblSTT") as Label;
                if (lblChon.BackColor.Name == "Red")
                {
                    num++;
                    break;
                }
            }
            foreach (GridViewRow item3 in DList_3.Rows)
            {
                LinkButton lblChon = item3.FindControl("lblChon") as LinkButton;
                Label lblSTT = item3.FindControl("lblSTT") as Label;
                if (lblChon.BackColor.Name == "Red")
                {
                    num++;
                    break;
                }
            }
            if (num == 3)
                return true;
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Vui lòng chọn đủ  số!')", true);
                return false;
            }    
              
        }
        protected void btnChon_Click(object sender, EventArgs e)
        {
            if (checkChonSo()==true && checkChonTien()==true)
                TaoGioHang();
        }
        protected void btnHuy_Click(object sender, EventArgs e)
        {
            Session["giohang"] = null;
            Response.Redirect("buy2.aspx");
        }

       

        protected void gridTien_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "chon")
            {
                GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
                LinkButton lblChon = row.FindControl("lblChon") as LinkButton;
                Label lblSTT = row.FindControl("lblSTT") as Label;
                Label lblIDCha = row.FindControl("lblID") as Label;
                if (lblChon.BackColor.Name != "Red")
                {
                    lblChon.BackColor = System.Drawing.Color.Red;
                    lblIDCha.Text = "1";
                    foreach (GridViewRow item in gridTien.Rows)
                    {
                        Label lblSTT1 = (Label)item.FindControl("lblSTT");
                        LinkButton lblChon1 = (LinkButton)item.FindControl("lblChon");
                        Label lblID = (Label)item.FindControl("lblID");
                        if (lblSTT1.Text != lblSTT.Text)
                        {
                            if (lblChon1.BackColor.Name == "Red")
                            {
                                lblID.Text = "0";
                               lblChon1.BackColor = System.Drawing.Color.White;
                            }
                              
                        }
                    }
                }
                else
                    lblChon.BackColor = System.Drawing.Color.White;

            }
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
            int ngay = 0;
            DateTime ngay1 = new DateTime(1900, 1, 1);
            ngay = (DateTime.Now - ngay1).Days;
            string strNum = "", strSoTien = "0";
            
            foreach (GridViewRow item in DList_1.Rows)
            {
                LinkButton lblChon = item.FindControl("lblChon") as LinkButton;
                Label lblSTT = (Label)item.FindControl("lblSTT");
                if (lblChon.BackColor.Name == "Red")
                {
                    strNum += lblSTT.Text.Trim();
                    lblChon.BackColor = System.Drawing.Color.White;
                    break;
                }  
            }
            foreach (GridViewRow item in DList_2.Rows)
            {
                LinkButton lblChon = item.FindControl("lblChon") as LinkButton;
                Label lblSTT = (Label)item.FindControl("lblSTT");
                if (lblChon.BackColor.Name == "Red")
                {
                    strNum += lblSTT.Text.Trim();
                    lblChon.BackColor = System.Drawing.Color.White;
                    break;
                }
            }
            foreach (GridViewRow item in DList_3.Rows)
            {
                LinkButton lblChon = item.FindControl("lblChon") as LinkButton;
                Label lblSTT = (Label)item.FindControl("lblSTT");
                if (lblChon.BackColor.Name == "Red")
                {
                    strNum += lblSTT.Text.Trim();
                    lblChon.BackColor = System.Drawing.Color.White;
                    break;
                }
            }
            foreach (GridViewRow item in gridTien.Rows)
            {
                LinkButton lblChon = item.FindControl("lblChon") as LinkButton;
                Label lblSTT = (Label)item.FindControl("lblSTT");
                if (lblChon.BackColor.Name == "Red")
                {
                    strSoTien = lblSTT.Text.Trim();
                    lblChon.BackColor = System.Drawing.Color.White;
                    break;
                }
            }
            if (strNum.Length==3)
            {
                if (strSoTien != "0")
                {
                    DataRow row = dt.NewRow();
                    row["Ngay"] = ngay;
                    row["MaDai"] = ddlDai.Text.Trim();
                 
                   
                    row["Loai"] = strNum.Length;
                    row["So"] = strNum;
                    row["SoTien"] = double.Parse(strSoTien);
                    if (btnDau.CssClass == "btn btn-danger")
                    {
                        row["Lo"] = btnDau.ToolTip;
                        dt.Rows.Add(row);
                    }
                    else if (btnCuoi.CssClass == "btn btn-danger")
                    { 
                        row["Lo"] = btnCuoi.ToolTip;
                        dt.Rows.Add(row);
                    }
                    else if (btnDauCuoi.CssClass == "btn btn-danger")
                    {
                        row["Lo"] = btnDauCuoi.ToolTip;
                        dt.Rows.Add(row);
                    }
                    else if (btn7Lo.CssClass == "btn btn-danger")
                    {
                        row["Lo"] = btn7Lo.ToolTip;
                        dt.Rows.Add(row);
                    }
                    else if (btn17Lo.CssClass == "btn btn-danger")
                    {
                        row["Lo"] = btn17Lo.ToolTip;
                        dt.Rows.Add(row);
                    }

                }
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Vui lòng chọn mệnh giá!')", true);
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Vui lòng chọn đủ "+ strNum.Length.ToString()+" số!')", true);
            Session["giohang"] = dt;
            TinhTong();
        }
        private void TinhTong()
        {
            DataTable dt = (DataTable)Session["giohang"];
            double Tong = 0;
            if (dt != null)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Tong += double.Parse("0" + dt.Rows[i]["SoTien"].ToString());
                }
            }
            lblTongTam.Text = Tong.ToString("#,##");

        }
    }
}