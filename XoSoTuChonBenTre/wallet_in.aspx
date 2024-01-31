<%@ Page Title="Nạp tiền" Language="C#" MasterPageFile="~/GiaoDien.Master" AutoEventWireup="true" CodeBehind="wallet_in.aspx.cs" Inherits="XoSoTuChonBenTre.wallet_in" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" />
    <div class="container-full">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="d-flex align-items-center">
                <div class="me-auto">
                    <h4 class="page-title">Nạp tiền ví điện tử </h4>

                </div>

            </div>
        </div>
        <!-- Main content -->
        <asp:UpdatePanel runat="server" ID="updatePanel" UpdateMode="Conditional">
            <ContentTemplate>
                <section class="invoice printableArea">
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
                                <div class="d-flex justify-content-between mt-3">
                                    <asp:Button ID="btnNap" runat="server" Width="120px" Text="Nạp tiền" CssClass="btn btn-danger" OnClick="btnNap_Click" />
                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn rounded-circle bg-info" ToolTip="Thông tin tài khoản đại lý" OnClientClick="ShowDaiLyInfo()">
                                <i class="fa fa-info"></i>
                                    </asp:LinkButton>
                                </div>
                                <br />

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
                                                <%# new DateTime(1900,1,1).AddDays(double.Parse(Eval("NgayNap").ToString())).ToString("dd/MM/yyyy") %>
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
                                                <asp:Button ID="btnHuy" Width="90px" Visible='<%# Eval("XacNhan") == null %>' runat="server" CssClass="btn btn-danger" CommandName="xoa" CommandArgument='<%# Eval("IDNap") %>' Text="Huỷ" />
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
                                                <%# (Eval("NgayXacNhan") == null)?"": new DateTime(1900,1,1).AddDays(double.Parse(Eval("NgayXacNhan").ToString())).ToString("dd/MM/yyyy") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </asp:Panel>
                        </div>
                    </div>
                </section>
                <!-- /.content -->
            </ContentTemplate>
        </asp:UpdatePanel>
        <div id="myModal" class="modal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Thông tin tài khoản của đại lý</h4>
                    </div>
                    <div class="modal-body">
                        <div class="">
                            <div class="form-group">
                                <label for="account-number">Số tài khoản: </label>
                                <asp:Label ID="txtAccountNumber" runat="server"></asp:Label>
                            </div>
                            <div class="form-group">
                                <label for="bank">Ngân hàng: </label>
                                <asp:Label ID="txtBank" runat="server"></asp:Label>
                            </div>
                            <div class="form-group">
                                <label for="bank">Họ và tên: </label>
                                <asp:Label ID="txtName" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer justify-content-end d-flex">
                        <%--<asp:Button ID="btnHuy" runat="server" class="btn btn-dark" data-bs-dismiss="modal" Text="Huỷ" />--%>
                        <button id="btnChapNhan" class="btn btn-danger"  data-bs-dismiss="modal">OK<//button>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <script>
        function ShowDaiLyInfo() {
            $("#myModal").modal("show");
        }
    </script>
</asp:Content>
