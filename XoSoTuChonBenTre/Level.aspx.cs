using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Public;
using DAL;

namespace XoSoTuChonBenTre
{
    public partial class Level : System.Web.UI.Page
    {
        LevelDAL cls = new LevelDAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            gridview1.DataSource = cls.All_Level();
            gridview1.DataBind();
            if(Request.QueryString["ID"]!=null&&! Request.QueryString["ID"].Equals(""))
            {
                LevelPublic p = new LevelPublic();
                p.LevelID = int.Parse(Request.QueryString["ID"].ToString());
                DataTable dt = cls.All_Level(p);
                if(dt.Rows.Count>0)
                {
                    txtMa.Text = dt.Rows[0]["LevelCode"].ToString().Trim();
                    txtTen.Text = dt.Rows[0]["LevelName"].ToString().Trim();
                    btnLuu.Visible = false;
                    btnSua.Visible = true;
                }
            }
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            Response.Redirect("Level.aspx");
        }
        protected void btnLuu_Click(object sender, EventArgs e)
        {
            if(txtMa.Text=="")
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Vui lòng nhập mã!')", true);
            else if(txtTen.Text=="")
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Vui lòng nhập tên!')", true);
            else
            {
                LevelPublic p = new LevelPublic();
                p.LevelCode = txtMa.Text.Trim();
                DataTable dt = cls.All_Level_TrungThem(p);
                if(dt.Rows.Count>0)
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Tên này đã có. Vui lòng nhập lại!')", true);
                else
                {
                    p.LevelName = txtTen.Text.Trim();
                    cls.Insert_Level(p);
                    btnThem_Click(sender, e);
                }    
            }    
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            if (txtMa.Text == "")
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Vui lòng nhập mã!')", true);
            else if (txtTen.Text == "")
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Vui lòng nhập tên!')", true);
            else
            {
                LevelPublic p = new LevelPublic();
                p.LevelCode = txtMa.Text.Trim();
                p.LevelID = int.Parse(Request.QueryString["ID"].ToString());
                DataTable dt = cls.All_Level_TrungSua(p);
                if (dt.Rows.Count > 0)
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Tên này đã có. Vui lòng nhập lại!')", true);
                else
                {
                    p.LevelName = txtTen.Text.Trim();
                    cls.Update_Level(p);
                    btnThem_Click(sender, e);
                }
            }
        }
        protected void gridview1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName=="xoa")
            {
                LevelPublic p = new LevelPublic();
                p.LevelID = int.Parse(e.CommandArgument.ToString());
                cls.Delete_Level(p);
            }
            btnThem_Click(sender, e);
        }
    }
}