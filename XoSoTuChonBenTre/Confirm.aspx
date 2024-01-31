<%@ Page Title="" Language="C#" MasterPageFile="~/GiaoDien.Master" AutoEventWireup="true" CodeBehind="Confirm.aspx.cs" Inherits="XoSoTuChonBenTre.Confirm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	 <asp:ScriptManager ID="script1" runat="server"></asp:ScriptManager>
     <div class="container-full">
		<!-- Content Header (Page header) -->	  
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="me-auto">
					<h4 class="page-title">Xác nhận đơn hàng </h4>
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
		 <div class="col-lg-2">
			  <div class="form-group">
			    <asp:Button ID="btnTim" runat="server" width="120px" Text="Xem" CssClass="btn btn-danger" OnClick="btnTim_Click" />
			  </div>
		 </div>
		    <div class="col-lg-12">
				<asp:UpdatePanel ID="UpdatePanel5" runat="server">
                      <ContentTemplate>
						  <asp:Panel ID="panel1" runat="server" Width="100%" ScrollBars="Auto">
							   <asp:GridView ID="gridview1"  OnRowCommand="gridview1_RowCommand"  runat="server" CssClass="table table-lg invoice-archive" ShowHeader="true" AutoGenerateColumns="false" width="100%" ShowHeaderWhenEmpty="true">
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
										<%# new DateTime(1900,1,1).AddDays(double.Parse(Eval("NgayChoi").ToString())).ToString("dd/MM/yyyy") %>
									 </ItemTemplate>
								 </asp:TemplateField>
								  <asp:TemplateField>
									  <HeaderTemplate>Thời gian đặt</HeaderTemplate>
									 <ItemTemplate>
										<%# Eval("ThoiGianDat") %>
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
										  <asp:Label ID="lblSoTien" runat="server" Text='<%# Eval("SoTien") %>' Visible="false"></asp:Label>
									 </ItemTemplate>
									   <ItemStyle HorizontalAlign="Right" />
								 </asp:TemplateField>
								 <asp:TemplateField>
									  <HeaderTemplate>Tài khoản đặt</HeaderTemplate>
									 <ItemTemplate>
										 <asp:Label ID="lblTK" runat="server" Text='<%# Eval("TenTaiKhoan") %>'></asp:Label>
									 </ItemTemplate>
									
								 </asp:TemplateField>
								 <asp:TemplateField>
									  <HeaderTemplate>Xác nhận</HeaderTemplate>
									 <ItemTemplate>
										<%# (Eval("XacNhan").ToString().ToUpper()=="TRUE")?"Đã xác nhận":"" %>
										 <br />
										 <%--<asp:Button ID="btnXacNhan" Width="90px" Visible='<%# (Eval("XacNhan").ToString().ToUpper()=="TRUE")?false:true %>' runat="server"  CssClass="btn btn-default"  CommandName="xacnhan" CommandArgument='<%# Eval("IDGame") %>' Text="Xác nhận" />--%>
										 <asp:Button ID="btnHuy"  Width="90px" Visible='<%# (Eval("XacNhan").ToString().ToUpper()=="TRUE")?true:false %>' runat="server"  CssClass="btn btn-danger"  CommandName="huyxacnhan" CommandArgument='<%# Eval("IDGame") %>' Text="Huỷ" />
									 </ItemTemplate>
								 </asp:TemplateField>
								 <asp:TemplateField>
									  <HeaderTemplate></HeaderTemplate>
									 <ItemTemplate>
										<asp:LinkButton CommandName="xoa" CommandArgument='<%# Eval("IDGame") %>' ID="btnXoa" runat="server"  CssClass="text-danger" data-bs-toggle="tooltip" data-bs-original-title="Delete">
											<i class="ti-trash" aria-hidden="true"></i>
										</asp:LinkButton>
										 </ItemTemplate>
								 </asp:TemplateField>
							 </Columns>
						 </asp:GridView>
						  </asp:Panel>
				      
				      </ContentTemplate>
                      <Triggers>
                             <asp:AsyncPostBackTrigger ControlID="btnTim" EventName="Click" />
                      </Triggers>
               </asp:UpdatePanel>
		    </div>
			</div>
		</section>
		<!-- /.content -->
	  </div>
</asp:Content>
