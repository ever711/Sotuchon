using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DAL;
using Public;
using XoSoTuChonBenTre.Models;
using System.Web.Services;
using System.Net;

namespace XoSoTuChonBenTre
{

    public partial class wallet_out : System.Web.UI.Page
    {
        LevelDAL clsLevel = new LevelDAL();
        TaiKhoanHeThongDAL clsTK = new TaiKhoanHeThongDAL();
        SoXoTuChon_BenTreEntities context = new SoXoTuChon_BenTreEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;


            try
            {
                SessionModel currentUser = Utils.GetSessionModel();
                txtTaiKhoan.Text = currentUser.TaiKhoan;
                var table2 = context.RutTien.Where(p => p.IDTaiKhoan == currentUser.IDTaiKhoan).OrderByDescending(p => p.NgayRut).ThenByDescending(x => x.IDRut);
                var data = table2.ToList();
                data.ForEach(x => {
                    x.TenTaiKhoan = x.TaiKhoanHeThong.TaiKhoan;
                    x.TenNguoiXacNhan = x.TaiKhoanHeThong1?.TaiKhoan;
                });
                gridview1.DataSource = data;
                gridview1.DataBind();
            }
            catch (Exception)
            {
            }
        }

        protected void btnTim_Click(object sender, EventArgs e)
        {

        }

        //protected void SaveBankAccount_Click(object sender, EventArgs e)
        //{
        //    var currentUser = Utils.GetSessionModel();
        //    var textBankAccount = txtBankAccount.Text;
        //    var textBank = txtBank.Text;
        //    if (string.IsNullOrEmpty(textBankAccount) || string.IsNullOrEmpty(textBank)) {
        //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Lưu không thành công do chưa nhập đủ thông tin!');", true);
        //        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "hideModal", "$('#myModal').modal('show');", true);
        //        return;
        //    }
        //    var user = context.TaiKhoanHeThongs.FirstOrDefault(x => x.IDTaiKhoan == currentUser.IDTaiKhoan);
        //    if (user != null) {
        //        user.NganHang = textBank.Trim();
        //        user.SoTaiKhoan = textBankAccount.Trim();
        //    }
        //    context.SaveChanges();
        //    btnNap_Click(sender,e);
        //}
        [WebMethod]
        public static bool SaveBankAccount(string bankNumer, string bank) {
            try
            {
                if (string.IsNullOrEmpty(bankNumer) || string.IsNullOrEmpty(bank)) return false;
                var currentUser = Utils.GetSessionModel();
                using (var context = new SoXoTuChon_BenTreEntities())
                {
                    var account = context.TaiKhoanHeThongs.FirstOrDefault(x => x.IDTaiKhoan == currentUser.IDTaiKhoan);
                    account.SoTaiKhoan = bankNumer;
                    account.NganHang = bank;
                    context.SaveChanges();
                }
                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw ex;
            }
        }
        private void SendMessageToGroup()
        {
            var currentUser = Utils.GetSessionModel();

            var GroupId = "-4017255917";
            string KeyAPI = "6822451707:AAFTXc9UnxXkK658znzMGw5Tczr81ELXC2g";
            var mess = $"Người dùng {currentUser.MaTaiKhoan} thực hiện rút {double.Parse(txtSoTien.Text).ToString("N0")}";
            var url = $"https://api.telegram.org/bot" + KeyAPI + "/sendMessage?chat_id=" + GroupId + "&text=" + mess;

            WebClient webclient = new WebClient();
            ServicePointManager.Expect100Continue = true;
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls
                    | SecurityProtocolType.Tls11
                    | SecurityProtocolType.Tls12
                    | SecurityProtocolType.Ssl3;
            webclient.DownloadString(url);
        }


        protected void btnNap_Click(object sender, EventArgs e)
        {
            var currentUser = Utils.GetSessionModel();
            var account = context.TaiKhoanHeThongs.FirstOrDefault(x => x.IDTaiKhoan == currentUser.IDTaiKhoan);

            if (string.IsNullOrEmpty(account.SoTaiKhoan) || string.IsNullOrEmpty(account.NganHang))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "showModal", "$('#myModal').modal('show');", true);
                return;
            }

            DateTime ngay1 = new DateTime(1900, 1, 1);
            DateTime ngay2 = DateTime.Now;
            RutTien table = new RutTien();
            table.NgayRut = (ngay2 - ngay1).Days;
            table.IDTaiKhoan = currentUser.IDTaiKhoan;
            if (txtSoTien.Text == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Vui lòng nhập số tiền!')", true);
                return;
            }

            try
            {
                var soTien = double.Parse(txtSoTien.Text);

                if (soTien < 100000)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Không được rút dưới 100,000!')", true);
                    return;
                }

                if (account != null)
                {
                    var tienConlai = account.ViTien - soTien;
                    if (tienConlai < 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Không đủ tài khoản!')", true);
                        return;
                    }
                    account.ViTien = tienConlai;
                }

                table.SoTien = soTien;
                table.NgayXacNhan = 0;
                table.LyDo = "Rút tiền ra khỏi ví";
                context.RutTien.Add(table);
                context.SaveChanges();
                SendMessageToGroup();
                Response.Redirect("wallet_out.aspx");
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ex.Message + "')", true);
            }
        }

        protected void gridview1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName=="xoa")
            {
                var currentUser = Utils.GetSessionModel();
                int ID = int.Parse(e.CommandArgument.ToString());
                RutTien table = context.RutTien.Single(p=>p.IDRut==ID);
                context.RutTien.Remove(table);
                var user = context.TaiKhoanHeThongs.FirstOrDefault(x => x.IDTaiKhoan == currentUser.IDTaiKhoan);
                if (user != null) {
                    user.ViTien += table.SoTien;
                }
                context.SaveChanges();
                Response.Redirect("wallet_out.aspx");
            }
        }
    }
}