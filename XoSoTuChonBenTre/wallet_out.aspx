<%@ Page Title="Nạp tiền" Language="C#" MasterPageFile="~/GiaoDien.Master" AutoEventWireup="true" CodeBehind="wallet_out.aspx.cs" Inherits="XoSoTuChonBenTre.wallet_out" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" />
    <div class="container-full">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="d-flex align-items-center">
                <div class="me-auto">
                    <h4 class="page-title">Rút tiền ví điện tử </h4>

                </div>

            </div>
        </div>
        <!-- Main content -->
        <section class="invoice printableArea">
            <asp:UpdatePanel runat="server" ID="updatePanel" UpdateMode="Conditional">
                <ContentTemplate>

                    <div class="row">
                        <div class="col-lg-5">
                            <label>Tài khoản</label>
                            <asp:TextBox ID="txtTaiKhoan" Enabled="false" runat="server" CssClass="form-control ps-15 bg-transparent"></asp:TextBox>
                        </div>

                        <div class="col-lg-3">
                            <div class="form-group">
                                <label>Số tiền</label>
                                <asp:TextBox ID="txtSoTien" runat="server" CssClass="form-control ps-15 bg-transparent"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-lg-2">
                            <div class="form-group">
                                <br />
                                <asp:Button ID="btnNap" runat="server" Width="120px" Text="Rút tiền" CssClass="btn btn-danger" OnClick="btnNap_Click" />
                            </div>
                        </div>

                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div id="myModal" class="modal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Nhập thông tin tài khoản ngân hàng</h4>
                        </div>
                        <div class="modal-body">
                            <h6 class="text-warning">Vui lòng thêm thông tin tài khoản ngân hàng của bạn</h6>
                            <div class="">
                                <div class="form-group">
                                    <label for="account-number">Số tài khoản</label>
                                    <input class="form-control ps-15 bg-transparent" id="txtBankAccount" />
                                </div>
                                <div class="form-group">
                                    <label for="bank">Ngân hàng</label>
                                    <input class="form-control ps-15 bg-transparent" id="txtBank" />
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer justify-content-end d-flex">
                            <%--<asp:Button ID="btnHuy" runat="server" class="btn btn-dark" data-bs-dismiss="modal" Text="Huỷ" />--%>
                            <%--<asp:Button ID="btnChapNhan" runat="server" class="btn btn-danger" Text="Lưu" />--%>
                            <button id="btnHuy" type="button" class="btn btn-dark" data-bs-dismiss="modal">Huỷ</button>
                            <button id="btnChapNhan" type="button" class="btn btn-danger">Lưu</button>
                        </div>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <asp:Panel ID="panel1" runat="server" Width="100%" ScrollBars="Auto">
                        <asp:GridView ID="gridview1" OnRowCommand="gridview1_RowCommand" Width="100%" runat="server" CssClass="table table-lg invoice-archive" ShowHeader="true" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>#</HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                    <ItemStyle Width="35px" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>Ngày nạp</HeaderTemplate>
                                    <ItemTemplate>
                                        <%# new DateTime(1900,1,1).AddDays(double.Parse(Eval("NgayRut").ToString())).ToString("dd/MM/yyyy") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>Số tiền</HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Eval("SoTien","{0:#,##}") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>Lý do</HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Eval("LyDo") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>Xác nhận</HeaderTemplate>
                                    <ItemTemplate>
                                        <%# (Eval("XacNhan") != null && Eval("XacNhan").ToString().ToUpper()=="TRUE")?"Đã xác nhận": Eval("XacNhan") != null ? "Đã hủy" :"Chưa xác nhận" %><br />
                                        <asp:Button ID="btnHuy" Width="90px" Visible='<%# Eval("XacNhan") == null %>' runat="server" CssClass="btn btn-danger" CommandName="xoa" CommandArgument='<%# Eval("IDRut") %>' Text="Huỷ" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>Người xác nhận</HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Eval("TenNguoiXacNhan") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>Ngày xác nhận</HeaderTemplate>
                                    <ItemTemplate>
                                        <%# (Eval("NgayXacNhan").ToString()=="0")?"": new DateTime(1900,1,1).AddDays(double.Parse(Eval("NgayXacNhan").ToString())).ToString("dd/MM/yyyy") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </asp:Panel>
                </div>
            </div>
        </section>

    </div>
    <script type="text/javascript">
        document.getElementById("btnChapNhan").addEventListener("click", function (e) {
            var bankAccount = $("#txtBankAccount").val();
            var bank = $("#txtBank").val();
            if (!bank || !bankAccount) {
                swal({
                    text: "Chưa điền đầy đủ thông tin!",
                    icon: "error",
                    button: "Đã hiểu!",
                });
                return;
            }
            var data = {
                bankNumer: bankAccount,
                bank: bank
            };
            $.ajax({
                type: "POST",
                url: "wallet_out.aspx/SaveBankAccount",
                data: JSON.stringify(data),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (res) {
                    if (res && res.d) {
                        swal({
                            text: "Lưu thông tin tài khoản ngân hàng thành công",
                            icon: "success",
                            button: "Đã hiểu!",
                        });
                        $("#myModal").modal('hide');
                    } else {
                        swal({
                            text: "Đã có lỗi xảy ra vui lòng thử lại",
                            icon: "error",
                            button: "Đã hiểu!",
                        });
                    }
                },
                error: function (xhr, status, error) {
                    swal({
                        text: "Đã có lỗi xảy ra vui lòng thử lại",
                        icon: "error",
                        button: "Đã hiểu!",
                    });
                }
            });
        });
    </script>
</asp:Content>
