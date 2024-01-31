<%@ Page Title="" Language="C#" MasterPageFile="~/GiaoDien.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="XoSoTuChonBenTre.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container-full">
		<!-- Content Header (Page header) -->	  
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="me-auto">
					<h4 class="page-title">Giỏ hàng </h4>
				</div>
				
			</div>
		</div>  
		  <asp:ScriptManager ID="script1" runat="server"></asp:ScriptManager>
		<!-- Main content -->
		<section class="invoice printableArea">
		 
			<div class="col-lg-12">
			    <asp:Button ID="btnMua" runat="server"  Text="Thanh toán" CssClass="waves-effect waves-light btn btn-default mb-5" OnClick="btnMua_Click"  />
			 
			    <asp:Button ID="btnXoa" Visible="true" runat="server"  Text="Xoá" CssClass="waves-effect waves-light btn btn-warning mb-5" OnClick="btnXoa_Click"/>
			   
			
			</div>
		    <div class="col-lg-12">
				<div class="table-responsive">
				 <asp:UpdatePanel ID="update1" runat="server">
					 <ContentTemplate>
						  <asp:GridView ID="gridview1"  runat="server" OnRowCommand="gridview1_RowCommand" CssClass="table table-lg invoice-archive" ShowHeader="true" AutoGenerateColumns="false" width="100%" ShowHeaderWhenEmpty="true">
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
									  <HeaderTemplate>Đài</HeaderTemplate>
									 <ItemTemplate>
										<%# Eval("MaDai") %>
									 </ItemTemplate>
								 </asp:TemplateField>
								 <asp:TemplateField>
									  <HeaderTemplate>Lô</HeaderTemplate>
									 <ItemTemplate>
										<%# Eval("Lo") %>
									 </ItemTemplate>
								 </asp:TemplateField>
								 <asp:TemplateField>
									  <HeaderTemplate>Loại số</HeaderTemplate>
									 <ItemTemplate>
										<%# Eval("Loai") %> số
									 </ItemTemplate>
								 </asp:TemplateField>
								 <asp:TemplateField>
									  <HeaderTemplate>Số</HeaderTemplate>
									 <ItemTemplate>
										<%# Eval("So") %>
									 </ItemTemplate>
								 </asp:TemplateField>
								  <asp:TemplateField>
									  <HeaderTemplate>Số tiền</HeaderTemplate>
									 <ItemTemplate>
										<%# Eval("SoTien","{0:#,##}") %>
									 </ItemTemplate>
								 </asp:TemplateField>
								 <asp:TemplateField>
									  <HeaderTemplate></HeaderTemplate>
									 <ItemTemplate>
										<asp:LinkButton CommandName="xoa" CommandArgument='<%# Container.DataItemIndex %>' ID="btnXoa" runat="server"  CssClass="text-danger" data-bs-toggle="tooltip" data-bs-original-title="Delete">
											<i class="ti-trash" aria-hidden="true"></i>
										</asp:LinkButton>
										 </ItemTemplate>
								 </asp:TemplateField>
							 </Columns>
						 </asp:GridView>
					 </ContentTemplate>
					 <Triggers>
						 <asp:AsyncPostBackTrigger ControlID="btnXoa" EventName="Click" />
					 </Triggers>
				 </asp:UpdatePanel>
				
			    </div>
		    </div>
		</section>
		<!-- /.content -->
	  </div>
</asp:Content>
