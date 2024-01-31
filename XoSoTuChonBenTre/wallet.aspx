<%@ Page Title="Ví của bạn" Language="C#" MasterPageFile="~/GiaoDien.Master" AutoEventWireup="true" CodeBehind="wallet.aspx.cs" Inherits="XoSoTuChonBenTre.wallet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-full">
		<!-- Content Header (Page header) -->	  
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="me-auto">
					<h4 class="page-title">Thông tin ví điện tử </h4>
					
				</div>
				
			</div>
		</div>  

		<!-- Main content -->
		<section class="invoice printableArea">
		  <div class="row">
			  <div class="col-lg-6">
				  <label>Tài khoản</label>
				  <asp:TextBox ID="txtTaiKhoan" Enabled="false" runat="server" CssClass="form-control ps-15 bg-transparent"></asp:TextBox>
			  </div>
			  
			<div class="col-lg-6">
			    <div class="form-group">
					<label>Họ tên</label>
					<asp:TextBox ID="txtTen" runat="server" CssClass="form-control ps-15 bg-transparent"></asp:TextBox>
				</div>
			</div>
			
			<div class="col-lg-3">
			    <div class="form-group">
					<label>Số tài khoản</label>
					<asp:TextBox ID="txtSTK" runat="server" CssClass="form-control ps-15 bg-transparent"></asp:TextBox>
				</div>
			</div>
			<div class="col-lg-5">
			    <div class="form-group">
					<label>Tên ngân hàng</label>
					<asp:TextBox ID="txtNganHang" runat="server" CssClass="form-control ps-15 bg-transparent"></asp:TextBox>
				</div>
			</div>
			<div class="col-lg-2">
			    <div class="form-group">
					<label>Ví tiền</label>
					<asp:TextBox ID="txtViTien" Enabled="false" Font-Bold="true" ForeColor="Red" runat="server" CssClass="form-control ps-15 bg-transparent"> </asp:TextBox>
				</div>
			</div>
            <div class="col-lg-2">
			    <div class="form-group">
					<label>Ngày đăng ký</label>
					<asp:TextBox ID="txtNgayDK" Enabled="false" Font-Bold="true"  runat="server" CssClass="form-control ps-15 bg-transparent"> </asp:TextBox>
				</div>
			</div>
		  </div>
		  <div class="row">
			   <div class="col-lg-12">
				     <asp:Panel ID="panel1" runat="server" Width="100%" ScrollBars="Auto">
							   <asp:GridView ID="gridview1" Width="100%"   runat="server" CssClass="table table-lg invoice-archive" ShowHeader="true" AutoGenerateColumns="false"  ShowHeaderWhenEmpty="true">
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
										<%# new DateTime(1900,1,1).AddDays(double.Parse(Eval("Ngay").ToString())).ToString("dd/MM/yyyy") %>
									 </ItemTemplate>
								 </asp:TemplateField>
								  <asp:TemplateField>
									  <HeaderTemplate>Nạp tiền</HeaderTemplate>
									 <ItemTemplate>
										<%# (Eval("TienNap").ToString()!="0")?"+":" " %><%# Eval("TienNap","{0:#,##}") %>
									 </ItemTemplate>
								 </asp:TemplateField>
								  <asp:TemplateField>
									  <HeaderTemplate>Rút tiền</HeaderTemplate>
									 <ItemTemplate>
										<%# (Eval("TienRut").ToString()!="0")?"-":" " %><%# Eval("TienRut","{0:#,##}") %>
									 </ItemTemplate>
								 </asp:TemplateField>
								 <asp:TemplateField>
									  <HeaderTemplate>Lý do</HeaderTemplate>
									 <ItemTemplate>
										<%# Eval("LyDo") %>
									 </ItemTemplate>
								 </asp:TemplateField>
								
							 </Columns>
						 </asp:GridView>
						  </asp:Panel>
			   </div>
		  </div>
			
		  
		</section>
		<!-- /.content -->
	  </div>
</asp:Content>
