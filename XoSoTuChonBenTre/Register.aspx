<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="XoSoTuChonBenTre.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng ký tài khoản</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../images/favicon.ico">
    <!-- Vendors Style-->
    <link rel="stylesheet" href="css/vendors_css.css">

    <!-- Style-->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/skin_color.css">
</head>
<body class="hold-transition theme-primary bg-img" style="background-image: url(images/auth-bg/bg-2.jpg)">
    <form id="id1" runat="server">
        <div class="container h-p100">
            <div class="row align-items-center justify-content-md-center h-p100">

                <div class="col-12 row justify-content-center g-0 col-lg-10 col-md-10">
                    <div class="bg-white rounded10 shadow-lg">
                        <div class="content-top-agile p-20 pb-0">
                            <h2 class="text-primary">Đăng ký thông tin của bạn</h2>
                            <p class="mb-0">
                                <center>Nhập thông tin để trở thành thành viên</center>
                            </p>
                        </div>
                        <div class="p-40 align-items-center d-flex flex-column">
                            <div class="col-12 col-lg-6">
                                <div class="form-group">
                                    <label for="">Họ và tên ( không dấu )</label>
                                    <asp:TextBox ID="txtHoTen" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-12 col-lg-6">
                                <div class="form-group">
                                    <label for="">Điện thoại</label>
                                    <asp:TextBox ID="txtDienThoai" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-12 col-lg-6">
                                <div class="form-group">
                                    <label for="">Mật khẩu</label>
                                    <asp:TextBox ID="txtMatKhau" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-12 col-lg-6">
                                <div class="form-group">
                                    <label for="">Xác nhận mật khẩu</label>
                                    <asp:TextBox ID="txtCheckMatKhau" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-12 col-lg-6">
                                <div class="form-group">
                                    <label for="">Mã giới thiệu</label>
                                    <asp:TextBox ID="txtMaGioiThieu" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-lg-12">
                                    <asp:Button ID="btnDangKy" runat="server" Text="Đăng ký" CssClass="btn btn-info margin-top-10" OnClick="btnDangKy_Click" />
                                    <asp:Button ID="btnXoa" runat="server" Text="Nhập lại" CssClass="btn btn-danger margin-top-10" OnClick="btnXoa_Click" />
                                    <div class="text-center">
                                        <p class="mt-15 mb-0">Bạn đã có tài khoản?<a href="Default.aspx" class="text-danger ms-5"> Đăng nhập</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- Vendor JS -->
    <script src="js/vendors.min.js"></script>
    <script src="js/pages/chat-popup.js"></script>
    <script src="../assets/icons/feather-icons/feather.min.js"></script>
</body>
</html>
