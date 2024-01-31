using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XoSoTuChonBenTre
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        SoXoTuChon_BenTreEntities context = new SoXoTuChon_BenTreEntities();
        protected void btnDangKy_Click(object sender, EventArgs e)
        {
            if (!ValidateAccount()) return;
            TaiKhoanHeThong table = new TaiKhoanHeThong();
            table.TaiKhoan = txtDienThoai.Text;
            table.MatKhau = txtMatKhau.Text;
            table.HoTen = txtHoTen.Text;
            table.SoDienThoai = txtDienThoai.Text;
            var daily = context.TaiKhoanHeThongs.FirstOrDefault(x => x.MaTaiKhoan == txtMaGioiThieu.Text.Trim() && x.LaQuanLy == true);
            table.IDDaiLy = daily.IDTaiKhoan;
            table.NgayDangKy = DateTime.Now;
            table.ViTien = 0;
            table.LaQuanLy = false;
            table.ChietKhau = "0";
            table.KichHoat = true;
            SaveToDB(table);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Tài khoản này đã tạo thành công. Nhấn vào đăng nhập để tiếp tục!')", true);
            Task.Delay(3000).Wait();
            Response.Redirect("Default.aspx");
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }


        private bool ValidateAccount()
        {
            if (txtHoTen.Text == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Vui lòng nhập họ tên!')", true);
                return false;
            }

            if (txtMatKhau.Text == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Vui lòng nhập mật khẩu!')", true);
                return false;
            }
            if (txtCheckMatKhau.Text == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Vui lòng nhập xác nhận mật khẩu!')", true);
                return false;
            }
            if (!txtMatKhau.Text.Trim().Equals(txtCheckMatKhau.Text.Trim())) {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Xác nhận mật khẩu không khớp, vui lòng nhập lại mật khẩu!')", true);
                return false;
            }
            if (txtDienThoai.Text == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Vui lòng nhập điện thoại!')", true);
                return false;
            }
            if (!Utils.ValidatePhoneNumber(txtDienThoai.Text)) {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Số điện thoại không hợp lệ!')", true);
                return false;
            }
            var tableCheck = context.TaiKhoanHeThongs.Where(p => p.TaiKhoan == txtDienThoai.Text);
            if (tableCheck.Count() > 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Số điện thoại này đã tồn tại. Vui lòng chọn số điện thoại!')", true);
                return false;
            }
            if (!string.IsNullOrEmpty(txtMaGioiThieu.Text))
            {
                var daily = context.TaiKhoanHeThongs.FirstOrDefault(x => x.MaTaiKhoan == txtMaGioiThieu.Text.Trim() && x.LaQuanLy == true);
                if (daily == null)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", String.Format("alert('Mã đại lý {0} không tồn tại, vui lòng kiểm tra lại!')", txtMaGioiThieu.Text.Trim()), true);
                    return false;
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Vui lòng nhập mã giới thiệu!')", true);
                return false;
            }
            return true;
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