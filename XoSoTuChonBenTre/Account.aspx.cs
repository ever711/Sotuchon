using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DAL;
using Public;

namespace XoSoTuChonBenTre
{
    public partial class Account : System.Web.UI.Page
    {
       
        SoXoTuChon_BenTreEntities context = new SoXoTuChon_BenTreEntities();
        private void LoadThongTin()
        {
            var currentUser = Utils.GetSessionModel();
            gridview1.DataSource = context.TaiKhoanHeThongs.Where(x => x.IDDaiLy == currentUser.IDTaiKhoan).OrderByDescending(x => x.NgayDangKy).ToList();
            gridview1.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            LoadThongTin();
            if (Request.QueryString["ID"] != null && !Request.QueryString["ID"].Equals(""))
            {
                int Id = int.Parse(Request.QueryString["ID"].ToString());
                var table = context.TaiKhoanHeThongs.Where(p=>p.IDTaiKhoan== Id);
                foreach (var item in table)
                {
                    txtMatKhau.Text = item.MatKhau;
                    txtCheckMatKhau.Text = item.MatKhau;
                    txtTen.Text = item.HoTen;
                    txtDT.Text = item.SoDienThoai;
                    txtDiaChi.Text = item.DiaChi;
                    txtSTK.Text = item.SoTaiKhoan;
                    txtNganHang.Text = item.NganHang;
                    //txtViTien.Text = item.ViTien.ToString();
                    chkQuanLy.Text = (item.LaQuanLy.Value == true) ? "1" : "0";
                    ddlChietKhau.Text = item.ChietKhau;
                    //ddlKichHoat.Text = (item.KichHoat.Value==true)?"1":"0";
                    btnLuu.Visible = false;
                    btnSua.Visible = true;
                }
            }
        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            Response.Redirect("Account.aspx");
        }
        protected void btnLuu_Click(object sender, EventArgs e)
        {
            if (!ValidateAccount()) return;
            else
            {
                TaiKhoanHeThong table = new TaiKhoanHeThong();
                table.MatKhau = txtMatKhau.Text;
                table.HoTen = txtTen.Text;
                table.SoDienThoai = txtDT.Text;
                table.DiaChi = txtDiaChi.Text;
                table.SoTaiKhoan = txtSTK.Text;
                table.NganHang = txtNganHang.Text;
                table.IDDaiLy = Utils.GetSessionModel().IDTaiKhoan;
                table.NgayDangKy = DateTime.Now;
                var isAdmin = chkQuanLy.Text == "0" ? false : true;
                table.LaQuanLy = isAdmin;
                table.ChietKhau = ddlChietKhau.Text;
                //table.KichHoat = (ddlKichHoat.Text=="0")?false:true;
                this.SaveToDB(table);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Tài khoản này đã tạo thành công. Nhấn vào đăng nhập để tiếp tục!')", true);
                LoadThongTin();
            }
        }
        private bool ValidateAccount(bool isEdit = false) {
            if (txtTen.Text == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Vui lòng nhập họ tên!')", true);
                return false;
            }

            if (txtMatKhau.Text == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Vui lòng nhập mật khẩu!')", true);
                return false;
            }

            if (!txtMatKhau.Text.Trim().Equals(txtCheckMatKhau.Text.Trim()))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Xác nhận mật khẩu không khớp, vui lòng nhập lại mật khẩu!')", true);
                return false;
            }

            if (txtDT.Text == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Vui lòng nhập điện thoại!')", true);
                return false;
            }
            if (!isEdit) {
                var tableCheck = context.TaiKhoanHeThongs.Where(p => p.TaiKhoan == txtDT.Text);
                if (tableCheck.Count() > 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Tài khoản này đã tồn tại. Vui lòng tạo tài khoản khác!')", true);
                    return false;
                }
            }
            var currentUser = Utils.GetSessionModel();
            if (currentUser != null && currentUser.LaQuanLy.HasValue && currentUser.LaQuanLy.Value)
            {
                var chietkhau = ddlChietKhau.Text;
                if (!string.IsNullOrEmpty(chietkhau) && !string.IsNullOrEmpty(currentUser.ChietKhau))
                {
                    var mucChietKhau = int.Parse(chietkhau);
                    var dailyChietKhau = int.Parse(currentUser.ChietKhau);
                    if (mucChietKhau > dailyChietKhau)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", String.Format("alert('Mức chiết khấu cao hơn mức chiết khấu của đại lý {0}. Vui lòng kiểm tra lại!')", currentUser.MaTaiKhoan.Trim()), true);
                        return false;
                    }
                }
                else {
                    if (!string.IsNullOrEmpty(chietkhau)) {
                        var mucChietKhau = int.Parse(chietkhau);
                        if (mucChietKhau > 0)
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", String.Format("alert('Mức chiết khấu cao hơn mức chiết khấu của đại lý {0}. Vui lòng kiểm tra lại!')", currentUser.MaTaiKhoan.Trim()), true);
                            return false;
                        }
                    }
                }
                
            }
            return true;
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            if (!ValidateAccount(true)) return;
            int ID = int.Parse(Request.QueryString["ID"].ToString());
            TaiKhoanHeThong table = context.TaiKhoanHeThongs.Single(p => p.IDTaiKhoan == ID);
            table.MatKhau = txtMatKhau.Text;
            table.HoTen = txtTen.Text;
            table.SoDienThoai = txtDT.Text;
            table.DiaChi = txtDiaChi.Text;
            table.SoTaiKhoan = txtSTK.Text;
            table.NganHang = txtNganHang.Text;
            table.IDDaiLy = Utils.GetSessionModel().IDTaiKhoan;
            table.NgayDangKy = DateTime.Now;
            //table.ViTien = (txtViTien.Text == "") ? 0 : double.Parse(txtViTien.Text);
            table.LaQuanLy = (chkQuanLy.Text == "0") ? false : true;
            table.ChietKhau = ddlChietKhau.Text;
            //table.KichHoat = (ddlKichHoat.Text == "0") ? false : true;
            context.SaveChanges();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Tài khoản này đã cập nhật thành công. Nhấn vào đăng nhập để tiếp tục!')", true);
            LoadThongTin();
        }
        protected void gridview1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "xoa")
            {
               int ID = int.Parse(e.CommandArgument.ToString());
                var table = context.TaiKhoanHeThongs.Single(p=>p.IDTaiKhoan==ID);
                context.TaiKhoanHeThongs.Remove(table);
                context.SaveChanges();
            }
            LoadThongTin();
        }
        private TaiKhoanHeThong SaveToDB(TaiKhoanHeThong data)
        {
            try
            {
                var entity = context.AutoGenerateCodes.FirstOrDefault(x => x.TableName == nameof(TaiKhoanHeThong));
                var maxCode = 1;
                var isAdmin = data.LaQuanLy.HasValue && data.LaQuanLy.Value;
                if (entity != null)
                {
                    maxCode = entity.Value++;
                }
                else
                {
                    var autoGenerate = new AutoGenerateCode()
                    {
                        Id = Guid.NewGuid(),
                        TableName = nameof(TaiKhoanHeThong),
                        Value = maxCode
                    };
                    context.AutoGenerateCodes.Add(autoGenerate);
                }
                data.KichHoat = true;
                data.MaTaiKhoan = (maxCode.ToString()).PadLeft(6, '0');
                context.TaiKhoanHeThongs.Add(data);
                context.SaveChanges();
                return data;
            }
            catch (Exception e)
            {
                throw e;
            }
        }
    }
}