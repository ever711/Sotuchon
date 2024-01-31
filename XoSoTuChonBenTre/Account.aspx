<%@ Page Title="" Language="C#" MasterPageFile="~/GiaoDien.Master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="XoSoTuChonBenTre.Account" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-full">
		<!-- Content Header (Page header) -->	  
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="me-auto">
					<h4 class="page-title">Danh sách tài khoản </h4>
					<%--<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Invoice</li>
								<li class="breadcrumb-item active" aria-current="page">Invoice Sample</li>
							</ol>
						</nav>
					</div>--%>
				</div>
				
			</div>
		</div>  

		<!-- Main content -->
		<section class="invoice printableArea">
		  <div class="row">
			  <div class="col-lg-12">
			    <div class="form-group">
					<label>Họ tên ( không dấu )</label>
					<asp:TextBox ID="txtTen" runat="server" CssClass="form-control ps-15 bg-transparent"></asp:TextBox>
				</div>
			</div>
			  <div class="col-lg-6">
				  <div class="form-group">
					  <label>Mật khẩu</label>
					  <asp:TextBox ID="txtMatKhau" runat="server" CssClass="form-control ps-15 bg-transparent"></asp:TextBox>
				 </div>
			  </div>
			  <div class="col-lg-6">
				  <div class="form-group">
					  <label>Xác nhận mật khẩu</label>
					  <asp:TextBox ID="txtCheckMatKhau" runat="server" CssClass="form-control ps-15 bg-transparent"></asp:TextBox>
				 </div>
			  </div>
		  </div>
		  <div class="row">
			 <%-- <div class="col-lg-4">
			    <div class="form-group">
					<label>Thuộc cấp độ</label>
					<asp:DropDownList ID="ddlCapDo" DataTextField="LevelName" DataValueField="LevelCode" runat="server" CssClass="form-control"></asp:DropDownList>
				</div>
			</div>--%>
			  <%--<div class="col-lg-3">
			    <div class="form-group">
					<label>Mã giới thiệu</label>
					<asp:TextBox ID="txtMaDaiLy" runat="server" CssClass="form-control ps-15 bg-transparent"></asp:TextBox>
				</div>
			</div>--%>
			
			<div class="col-lg-3">
			    <div class="form-group">
					<label>Số điện thoại</label>
					<asp:TextBox ID="txtDT" runat="server" CssClass="form-control ps-15 bg-transparent" Enabled="false"></asp:TextBox>
				</div>
			</div>
			  <div class="col-lg-6">
			    <div class="form-group">
					<label>Địa chỉ</label>
					<asp:TextBox ID="txtDiaChi" runat="server" CssClass="form-control ps-15 bg-transparent"></asp:TextBox>
				</div>
			</div>
			<div class="col-lg-3">
			    <div class="form-group">
					<label>Số tài khoản</label>
					<asp:TextBox ID="txtSTK" runat="server" CssClass="form-control ps-15 bg-transparent"></asp:TextBox>
				</div>
			</div>
			<div class="col-lg-9">
			    <div class="form-group">
					<label>Tên ngân hàng</label>
					<asp:TextBox ID="txtNganHang" runat="server" CssClass="form-control ps-15 bg-transparent"></asp:TextBox>
				</div>
			</div>
			<div class="col-lg-3">
			    <div class="form-group">
					<label>Chiết khấu (%)</label>
					<%--<asp:TextBox ID="txtChietKhau" runat="server" CssClass="form-control ps-15 bg-transparent"></asp:TextBox>--%>
					<asp:DropDownList ID="ddlChietKhau" runat="server" CssClass="form-control dropdown">
						<asp:ListItem Text="Chọn mức chiết khấu" Value="0"></asp:ListItem>
						<asp:ListItem Text="1%" Value="1"></asp:ListItem>
						<asp:ListItem Text="2%" Value="2"></asp:ListItem>
						<asp:ListItem Text="3%" Value="3"></asp:ListItem>
						<asp:ListItem Text="5%" Value="5"></asp:ListItem>
						<asp:ListItem Text="10%" Value="10"></asp:ListItem>
					</asp:DropDownList>
				</div>
			</div>
			<%--<div class="col-lg-3">
			    <div class="form-group">
					<label>Ví tiền</label>
					<asp:TextBox ID="txtViTien" runat="server" CssClass="form-control ps-15 bg-transparent" Enabled="false"> </asp:TextBox>
				</div>
			</div>--%>
			<div class="col-lg-3">
			    <div class="form-group">
					<label>Thuộc quản lý</label>
					<asp:DropDownList ID="chkQuanLy" runat="server" CssClass="form-control dropdown">
						<asp:ListItem Text="Người chơi" Value="0"></asp:ListItem>
						<asp:ListItem Text="Quản lý" Value="1"></asp:ListItem>
					</asp:DropDownList>
				</div>
			</div>
			<%--<div class="col-lg-3">
			    <div class="form-group">
					<label>Kích hoạt tài khoản</label>
					<asp:DropDownList ID="ddlKichHoat" runat="server" CssClass="form-control dropdown">
						<asp:ListItem Text="Vô hiệu hoá" Value="0"></asp:ListItem>
						<asp:ListItem Text="Kích hoạt" Value="1"></asp:ListItem>
					</asp:DropDownList>
				</div>
			</div>--%>
			
		  </div>
					
			<div class="col-lg-12">
			 <asp:Button ID="btnThem" runat="server"  Text="Thêm mới" CssClass="waves-effect waves-light btn btn-default mb-5" OnClick="btnThem_Click" />
			    <asp:Button ID="btnLuu" runat="server" Text="Lưu" CssClass="waves-effect waves-light btn btn-info mb-5" OnClick="btnLuu_Click" />
			    <asp:Button ID="btnSua" Visible="false" runat="server"  Text="Sửa" CssClass="waves-effect waves-light btn btn-warning mb-5" OnClick="btnSua_Click" />
			 
			</div>
		    <div class="col-lg-12">
				<div class="table-responsive">
				 <asp:GridView ID="gridview1" OnRowCommand="gridview1_RowCommand" runat="server" CssClass="table table-lg invoice-archive" ShowHeader="true" AutoGenerateColumns="false" width="100%" ShowHeaderWhenEmpty="true">
							 <Columns>
								  <asp:TemplateField>
									 <HeaderTemplate>#</HeaderTemplate>
									 <ItemTemplate>
										 <%# Container.DataItemIndex+1 %>
									 </ItemTemplate>
									 <ItemStyle Width="35px" />
								 </asp:TemplateField>
								 <asp:TemplateField>
									 <HeaderTemplate>Tài khoản</HeaderTemplate>
									 <ItemTemplate>
										 <a href="Account.aspx?ID=<%# Eval("IDTaiKhoan") %>"> <%# Eval("TaiKhoan") %></a>
									 </ItemTemplate>
								 </asp:TemplateField>
								 <%--<asp:TemplateField>
									  <HeaderTemplate>Mã tài khoản</HeaderTemplate>
									 <ItemTemplate>
										<%# Eval("MaTaiKhoan") %>
									 </ItemTemplate>
								 </asp:TemplateField>--%>
								 <asp:TemplateField>
									  <HeaderTemplate>Vai trò</HeaderTemplate>
									 <ItemTemplate>
                                        <%# (bool)Eval("LaQuanLy")? "Quản lý" : "Người chơi" %>
									 </ItemTemplate>
								 </asp:TemplateField>
								 <asp:TemplateField>
									  <HeaderTemplate>Mật khẩu</HeaderTemplate>
									 <ItemTemplate>
										<%# Eval("MatKhau") %>
									 </ItemTemplate>
								 </asp:TemplateField>
								  <asp:TemplateField>
									  <HeaderTemplate>Họ và tên</HeaderTemplate>
									 <ItemTemplate>
										<%# Eval("HoTen") %>
									 </ItemTemplate>
								 </asp:TemplateField>
								  <%--<asp:TemplateField>
									  <HeaderTemplate>Ngày đăng ký</HeaderTemplate>
									 <ItemTemplate>
										<%# Eval("NgayDangKy","{0:dd/MM/yyyy}") %>
									 </ItemTemplate>
								 </asp:TemplateField>--%>
								 <asp:TemplateField >
									  <HeaderTemplate>Số dư tài khoản</HeaderTemplate>
									 <ItemTemplate>
										<%# Eval("ViTien", "{0:,#,###}") %>
									 </ItemTemplate>
								 </asp:TemplateField>
								 <asp:TemplateField>
									  <HeaderTemplate></HeaderTemplate>
									 <ItemTemplate>
										<asp:LinkButton CommandName="xoa" CommandArgument='<%# Eval("IDTaiKhoan") %>' ID="btnXoa" runat="server"  CssClass="text-danger" data-bs-toggle="tooltip" data-bs-original-title="Delete">
											<i class="ti-trash" aria-hidden="true"></i>
										</asp:LinkButton>
										 </ItemTemplate>
								 </asp:TemplateField>
							 </Columns>
						 </asp:GridView>
			    </div>
		    </div>
		</section>
		<!-- /.content -->
	  </div>
</asp:Content>
