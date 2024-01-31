<%@ Page Title="Thông tin của bạn" Language="C#" MasterPageFile="~/GiaoDien.Master" AutoEventWireup="true" CodeBehind="account_info.aspx.cs" Inherits="XoSoTuChonBenTre.account_info" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-full">
		<!-- Content Header (Page header) -->	  
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="me-auto">
					<h4 class="page-title">Thông tin cá nhân </h4>
					
				</div>
				
			</div>
		</div>  

		<!-- Main content -->
		<section class="invoice printableArea">
		  <div class="row">
			  <div class="col-lg-12">
			    <div class="form-group">
					<label>Họ tên</label>
					<asp:TextBox ID="txtTen" runat="server" CssClass="form-control ps-15 bg-transparent"></asp:TextBox>
				</div>
			</div>
			  <div class="col-lg-6">
				  <label>Tài khoản</label>
				  <asp:TextBox ID="txtTaiKhoan" Enabled="false" runat="server" CssClass="form-control ps-15 bg-transparent"></asp:TextBox>
			  </div>
			  <div class="col-lg-6">
				  <label>Mật khẩu</label>
				  <asp:TextBox ID="txtMatKhau" runat="server" CssClass="form-control ps-15 bg-transparent"></asp:TextBox>
			  </div>
		  </div>
		  <div class="row">
			 <%-- <div class="col-lg-4">
			    <div class="form-group">
					<label>Thuộc cấp độ</label>
					<asp:DropDownList ID="ddlCapDo" Enabled="false" DataTextField="LevelName" DataValueField="LevelCode" runat="server" CssClass="form-control"></asp:DropDownList>
				</div>
			</div>--%>
			  <div class="col-lg-3">
			    <div class="form-group">
					<label>Mã tài khoản</label>
					<asp:TextBox ID="txtMa" Enabled="false" runat="server" CssClass="form-control ps-15 bg-transparent"></asp:TextBox>
				</div>
			</div>
			
			<div class="col-lg-3">
			    <div class="form-group">
					<label>Số điện thoại</label>
					<asp:TextBox ID="txtDT" runat="server" CssClass="form-control ps-15 bg-transparent"></asp:TextBox>
				</div>
			</div>
			  <div class="col-lg-6">
			    <div class="form-group">
					<label>Tên Đại lý</label>
					<asp:TextBox ID="txtDiaChi" runat="server" CssClass="form-control ps-15 bg-transparent"></asp:TextBox>
				</div>
			</div>
			<div class="col-lg-5">
			    <div class="form-group">
					<label>Số tài khoản</label>
					<asp:TextBox ID="txtSTK" runat="server" CssClass="form-control ps-15 bg-transparent"></asp:TextBox>
				</div>
			</div>
			<div class="col-lg-7">
			    <div class="form-group">
					<label>Tên ngân hàng</label>
					<asp:TextBox ID="txtNganHang" runat="server" CssClass="form-control ps-15 bg-transparent"></asp:TextBox>
				</div>
			</div>
			<div class="col-lg-2">
			    <div class="form-group">
					<label>Chiết khấu (%)</label>
					<asp:TextBox ID="txtChietKhau" Enabled="false" runat="server" CssClass="form-control ps-15 bg-transparent"></asp:TextBox>
				</div>
			</div>
			<div class="col-lg-3">
			    <div class="form-group">
					<label>Ví tiền</label>
					<asp:TextBox ID="txtViTien" Enabled="false" Font-Bold="true" ForeColor="Red" runat="server" CssClass="form-control ps-15 bg-transparent"> </asp:TextBox>
				</div>
			</div>
            <div class="col-lg-3">
			    <div class="form-group">
					<label>Ngày đăng ký</label>
					<asp:TextBox ID="txtNgayDK" Enabled="false" Font-Bold="true"  runat="server" CssClass="form-control ps-15 bg-transparent"> </asp:TextBox>
				</div>
			</div>
			<div class="col-lg-4">
			    <div class="form-group">
					<label>Kích hoạt tài khoản</label>
					<asp:DropDownList ID="ddlKichHoat" Enabled="false" runat="server" CssClass="form-control dropdown">
						<asp:ListItem Text="Vô hiệu hoá" Value="0"></asp:ListItem>
						<asp:ListItem Text="Kích hoạt" Value="1"></asp:ListItem>
					</asp:DropDownList>
				</div>
			</div>
			
		  </div>
		 
			<div class="col-lg-12">
			    <asp:Button ID="btnSua"  runat="server"  Text="Thay đổi" CssClass="waves-effect waves-light btn btn-warning mb-5" OnClick="btnSua_Click" />
			 
			</div>
		  
		</section>
		<!-- /.content -->
	  </div>
</asp:Content>
