using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DAL;
using XoSoTuChonBenTre.Models;
using System.Net;

namespace XoSoTuChonBenTre
{
   
    public partial class wallet_in : System.Web.UI.Page
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
                txtTaiKhoan.Text = Request.Cookies["taikhoan"].Value;
                var table2 = context.NapTien.Where(p => p.IDTaiKhoanNap == currentUser.IDTaiKhoan).OrderByDescending(p=>p.NgayNap).ThenByDescending(x => x.IDNap);
                var data = table2.ToList();
                data.ForEach(x => {
                    x.TenTaiKhoan = x.TaiKhoanHeThong.TaiKhoan;
                    x.TenNguoiXacNhan = x.TaiKhoanHeThong1?.TaiKhoan;
                });
                gridview1.DataSource = data;
                gridview1.DataBind();
                LoadBankAccountInfo();
            }
            catch (Exception)
            {
            }
        }

        private void LoadBankAccountInfo() {
            var currentUser = Utils.GetSessionModel();
            var daily = context.TaiKhoanHeThongs.FirstOrDefault(x => x.IDTaiKhoan == currentUser.IDDaiLy);
            if (daily != null) {
                txtAccountNumber.Text = daily.SoTaiKhoan;
                txtBank.Text = daily.NganHang;
                txtName.Text = daily.HoTen;
            }
        }
        private void SendMessageToGroup() {
            var currentUser = Utils.GetSessionModel();
            
            var GroupId  = "-4017255917";
            string KeyAPI = "6822451707:AAFTXc9UnxXkK658znzMGw5Tczr81ELXC2g";
            var mess = $"Người dùng {currentUser.MaTaiKhoan} thực hiện nạp {double.Parse(txtSoTien.Text).ToString("N0")}";
            var url = $"https://api.telegram.org/bot" + KeyAPI  +"/sendMessage?chat_id=" + GroupId + "&text=" + mess;

            WebClient webclient = new WebClient();
            ServicePointManager.Expect100Continue = true;
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls
                    | SecurityProtocolType.Tls11
                    | SecurityProtocolType.Tls12
                    | SecurityProtocolType.Ssl3;
            webclient.DownloadString(url);
        }

        protected void btnTim_Click(object sender, EventArgs e)
        {

        }
        
        protected void btnNap_Click(object sender, EventArgs e)
        {
            var currentUser = Utils.GetSessionModel();

            DateTime ngay1 = new DateTime(1900, 1, 1);
            DateTime ngay2 = DateTime.Now;
            NapTien table = new NapTien();
            table.NgayNap = (ngay2 - ngay1).Days;
            table.IDTaiKhoanNap = currentUser.IDTaiKhoan;
            if (txtSoTien.Text == "")
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Vui lòng nhập số tiền!')", true);
            else
            {
                try
                {
                    table.SoTien = double.Parse(txtSoTien.Text);
                    table.LyDo = "Nạp tiền vào ví";
                    context.NapTien.Add(table);
                    context.SaveChanges();
                    SendMessageToGroup();
                    Response.Redirect("wallet_in.aspx");
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ex.Message + "')", true);
                }
            }
        }

        protected void gridview1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName=="xoa")
            {
                int ID = int.Parse(e.CommandArgument.ToString());
                NapTien table = context.NapTien.Single(p=>p.IDNap==ID);
                context.NapTien.Remove(table);
                context.SaveChanges();
                Response.Redirect("wallet_in.aspx");
            }
        }
    }
}