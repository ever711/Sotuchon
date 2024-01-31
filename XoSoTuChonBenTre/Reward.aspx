<%@ Page Title="" Language="C#" MasterPageFile="~/GiaoDien.Master" AutoEventWireup="true" CodeBehind="Reward.aspx.cs" Inherits="XoSoTuChonBenTre.Reward" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-full">


		<!-- Content Header (Page header) -->	  
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="me-auto">
					<h4 class="page-title">Trả thưởng </h4>
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
		   <div class="col-lg-5">
			   <div class="form-group">
				   <asp:TextBox ID="txtTu"  placeholder="Từ ngày" runat="server" CssClass="form-control ps-15 bg-transparent"></asp:TextBox>
			   </div>
		   </div>
		   <div class="col-lg-5">
			   <div class="form-group">
				   <asp:TextBox ID="txtDen"  placeholder="Đến ngày"  runat="server" CssClass="form-control ps-15 bg-transparent"></asp:TextBox>
			   </div>
		   </div>
		 <div class="col-lg-2">
			  <div class="form-group">
			    <asp:Button ID="btnTim" runat="server" width="120px" Text="Xem" CssClass="btn-danger-light" />
			  </div>
		 </div>
		    <div class="col-lg-12">
				 <asp:GridView ID="gridview1" runat="server" CssClass="table-bordered" ShowHeader="true" AutoGenerateColumns="false" width="100%" ShowHeaderWhenEmpty="true">
							 <Columns>
								  <asp:TemplateField>
									 <HeaderTemplate>#</HeaderTemplate>
									 <ItemTemplate>
										 <%# Container.DataItemIndex+1 %>
									 </ItemTemplate>
									 <ItemStyle Width="35px" />
								 </asp:TemplateField>
								 <asp:TemplateField>
									 <HeaderTemplate>Số phiếu</HeaderTemplate>
									 <ItemTemplate>
										 <%# Eval("SoPhieu") %>
									 </ItemTemplate>
									 <ItemStyle Width="35px" />
								 </asp:TemplateField>
								 <asp:TemplateField>
									  <HeaderTemplate>Số dự thưởng</HeaderTemplate>
									 <ItemTemplate>
										<%# Eval("SoDT") %>
									 </ItemTemplate>
								 </asp:TemplateField>
								  <asp:TemplateField>
									  <HeaderTemplate>Số lô</HeaderTemplate>
									 <ItemTemplate>
										<%# Eval("SoLo") %>
									 </ItemTemplate>
								 </asp:TemplateField>
								  <asp:TemplateField>
									  <HeaderTemplate>Số tiền</HeaderTemplate>
									 <ItemTemplate>
										<%# Eval("SoTien") %>
									 </ItemTemplate>
								 </asp:TemplateField>
								  <asp:TemplateField>
									  <HeaderTemplate>Kết quả</HeaderTemplate>
									 <ItemTemplate>
										 <asp:DropDownList ID="ddlKQ" runat="server" CssClass="form-control-lg">
											  <asp:ListItem Text="Chọn KQ" Value="0"></asp:ListItem>
											  <asp:ListItem Text="Trúng" Value="1"></asp:ListItem>
											  <asp:ListItem Text="Trật" Value="2"></asp:ListItem>
										 </asp:DropDownList>
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
