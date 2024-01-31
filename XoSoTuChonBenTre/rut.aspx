<%@ Page Title="Nạp tiền" Language="C#" MasterPageFile="~/GiaoDien.Master" AutoEventWireup="true" CodeBehind="rut.aspx.cs" Inherits="XoSoTuChonBenTre.rut" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-full">
		<!-- Content Header (Page header) -->	  
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="me-auto">
					<h4 class="page-title">Rút tiền </h4>
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
		   <div class="col-lg-2">
			   <div class="form-group">
				   <asp:TextBox ID="txtTu"  placeholder="Từ ngày" runat="server" CssClass="form-control ps-15 bg-transparent" TextMode="Date"></asp:TextBox>
			   </div>
		   </div>
		   <div class="col-lg-2">
			   <div class="form-group">
				   <asp:TextBox ID="txtDen"  placeholder="Đến ngày"  runat="server" CssClass="form-control ps-15 bg-transparent" TextMode="Date"></asp:TextBox>
			   </div>
		   </div>
		 <div class="col-lg-5">
			  <div class="form-group">
			    <asp:Button ID="btnTim" runat="server" width="120px" Text="Xem" CssClass="btn btn-danger-light" />
				 <asp:Button ID="btnThem" runat="server" width="120px" Text="Thêm mới" CssClass="btn btn-default" />
			  </div>
		 </div>
		    <div class="col-lg-12">
				 <asp:GridView ID="gridview1"  runat="server" CssClass="table table-lg invoice-archive" ShowHeader="true" AutoGenerateColumns="false" width="100%" ShowHeaderWhenEmpty="true">
							 <Columns>
								  <asp:TemplateField>
									 <HeaderTemplate>#</HeaderTemplate>
									 <ItemTemplate>
										 <%# Container.DataItemIndex+1 %>
									 </ItemTemplate>
									 <ItemStyle Width="35px" />
								 </asp:TemplateField>
								 <asp:TemplateField>
									 <HeaderTemplate>Ngày</HeaderTemplate>
									 <ItemTemplate>
										<%# Eval("NgayRut") %>
									 </ItemTemplate>
								 </asp:TemplateField>
								 <asp:TemplateField>
									  <HeaderTemplate>Tài khoản</HeaderTemplate>
									 <ItemTemplate>
										<%# Eval("TaiKhoan") %>
									 </ItemTemplate>
								 </asp:TemplateField>
								 <asp:TemplateField>
									  <HeaderTemplate>Số tiền</HeaderTemplate>
									 <ItemTemplate>
										<%# Eval("SoTien") %>
									 </ItemTemplate>
								 </asp:TemplateField>
								 <asp:TemplateField>
									  <HeaderTemplate>Bank</HeaderTemplate>
									 <ItemTemplate>
										<%# Eval("NganHang") %> số
									 </ItemTemplate>
								 </asp:TemplateField>
								 <asp:TemplateField>
									  <HeaderTemplate>Xác nhận</HeaderTemplate>
									 <ItemTemplate>
										<%# Eval("XacNhan") %>
									 </ItemTemplate>
								 </asp:TemplateField>
								  <asp:TemplateField>
									  <HeaderTemplate>Người xác nhận</HeaderTemplate>
									 <ItemTemplate>
										<%# Eval("NguoiXacNhan") %>
									 </ItemTemplate>
								 </asp:TemplateField>
								   <asp:TemplateField>
									  <HeaderTemplate>Ngày xác nhận</HeaderTemplate>
									 <ItemTemplate>
										<%# Eval("NgayXacNhan") %>
									 </ItemTemplate>
								 </asp:TemplateField>
								    <asp:TemplateField>
									  <HeaderTemplate>Tệp đính  kèm</HeaderTemplate>
									 <ItemTemplate>
										<%# Eval("HinhDinhKem") %>
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
