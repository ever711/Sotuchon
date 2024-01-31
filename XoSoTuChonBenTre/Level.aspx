<%@ Page Title="" Language="C#" MasterPageFile="~/GiaoDien.Master" AutoEventWireup="true" CodeBehind="Level.aspx.cs" Inherits="XoSoTuChonBenTre.Level" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-full">
		<!-- Content Header (Page header) -->	  
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="me-auto">
					<h4 class="page-title">Cấp độ đại lý </h4>
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
			<div class="col-lg-4">
			    <div class="form-group">
					<label>Mã cấp</label>
					<asp:TextBox ID="txtMa" runat="server" CssClass="form-control ps-15 bg-transparent"></asp:TextBox>
				</div>
			</div>
			<div class="col-lg-8">
			    <div class="form-group">
					<label>Tên cấp</label>
					<asp:TextBox ID="txtTen" runat="server" CssClass="form-control ps-15 bg-transparent"></asp:TextBox>
				</div>
			</div>
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
									 <HeaderTemplate>Mã cấp</HeaderTemplate>
									 <ItemTemplate>
										 <a href="Level.aspx?ID=<%# Eval("LevelID") %>"> <%# Eval("LevelCode") %></a>
									 </ItemTemplate>
								 </asp:TemplateField>
								 <asp:TemplateField>
									  <HeaderTemplate>Tên cấp</HeaderTemplate>
									 <ItemTemplate>
										<%# Eval("LevelName") %>
									 </ItemTemplate>
								 </asp:TemplateField>
								 <asp:TemplateField>
									  <HeaderTemplate></HeaderTemplate>
									 <ItemTemplate>
										<asp:LinkButton CommandName="xoa" CommandArgument='<%# Eval("LevelID") %>' ID="btnXoa" runat="server"  CssClass="text-danger" data-bs-toggle="tooltip" data-bs-original-title="Delete">
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
