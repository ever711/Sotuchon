<%@ Page ValidateRequest="false" Title="" Language="C#"  MasterPageFile="~/GiaoDien.Master" AutoEventWireup="true" CodeBehind="Buy2.aspx.cs" Inherits="XoSoTuChonBenTre.Buy2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="script1" runat="server"></asp:ScriptManager>
    <div class="container-full">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="d-flex align-items-center">
                <div class="me-auto">
                    <h4 class="page-title">Mua vé số
                        <asp:Label ID="lblLoai" runat="server" ForeColor="Red" Font-Bold="true" Text="3 số"></asp:Label></h4>
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
                <%--<div class="col-lg-2">
                    <div class="form-group">
                        <label>Ngày</label>
                        <asp:TextBox ID="txtNgay" runat="server" CssClass="form-control" TextMode="Date" ></asp:TextBox>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="form-group">
                        <label>Đài</label>
                        <asp:DropDownList ID="ddlDai" runat="server" CssClass="form-control" DataValueField="MaDai" DataTextField="TenDai" ></asp:DropDownList>
                    </div>
                </div>--%>
                <asp:UpdatePanel ID="UpdatePaneHeader" runat="server" class="row">
                        <contenttemplate>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <asp:Label ID="Label1" runat="server" Text="Miền" />
                                    <asp:DropDownList ID="ddlMien" runat="server" CssClass="form-control" OnSelectedIndexChanged="ChangeSide" AutoPostBack="true">
                                        <asp:ListItem Selected="True" Value="South">Miền Nam</asp:ListItem>
                                        <asp:ListItem Value="Middle"> Miền Trung</asp:ListItem>
                                        <asp:ListItem Value="North"> Miền Bắc</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <asp:Label ID="Label2" runat="server" Text="Đài" />
                                    <asp:DropDownList ID="ddlDai" runat="server" CssClass="form-control" DataValueField="MaDai" DataTextField="TenDai"></asp:DropDownList>
                                </div>
                            </div>
                        </contenttemplate>
                        <%--<triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlMien" />
                        </triggers>--%>
                    </asp:UpdatePanel>
                <div class="col-lg-12">
                    <style>
                        .ball {
                            border-color: red;
                            color: red;
                            display: inline-block;
                            width: 45px;
                            height: 45px;
                            line-height: 40px;
                            border: solid 1px #000000;
                            border-radius: 50%;
                            margin: 2px 2px;
                            padding:3px;
                            color: #000000;
                            font-weight: 700;
                               cursor: pointer;
                        }
                    </style>
                        <div class="box" style="margin-top:2px !important;">
                            <!-- /.box-header -->
                            <div class="box-body">
                                <div class="col-lg-12">
                                  <div class="form-group">
                                       <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                             <ContentTemplate>
                                                  <asp:Button ID="btnDau" ToolTip="Đ/X" runat="server" Text="Đầu" CssClass="btn btn-dark" OnClick="btnDau_Click" />
                                                  <asp:Button ID="btnCuoi"  ToolTip="X/C" runat="server" Text="Cuối" CssClass="btn btn-dark" OnClick="btnCuoi_Click" />
                                                   <asp:Button ID="btnDauCuoi" ToolTip="Đ/C" runat="server" Text="Đầu-Cuối" CssClass="btn btn-dark" OnClick="btnDauCuoi_Click" />
                                                   <asp:Button ID="btn7Lo" ToolTip="7L" runat="server" Text="7 Lô" CssClass="btn btn-dark" OnClick="btn7Lo_Click" />
                                                 <asp:Button ID="btn17Lo" ToolTip="BL" runat="server" Text="Lô" CssClass="btn btn-dark" OnClick="btn17Lo_Click" />
                                            </ContentTemplate>
                                           <Triggers>
                                               <asp:PostBackTrigger ControlID="btnDatVe" />
                                           </Triggers>
                                        </asp:UpdatePanel>
                                  </div>
                             </div>
                               <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="box-number box-number0 flex-d cursor-pointer">
                                             <div style="float:left">
                                                <asp:UpdatePanel ID="update1" runat="server">
                                                    <ContentTemplate>
                                                        <asp:GridView ID="DList_1"  ShowHeader="false"  CssClass="table-responsive" AutoGenerateColumns="false" border="0" OnRowCommand="DList_1_RowCommand" Width="100%" runat="server">
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                      <asp:Label ID="lblSTT" runat="server" Text=' <%# Eval("stt")%>' Visible="false"></asp:Label>
                                                                        <asp:LinkButton ID="lblChon" runat="server" CssClass="ball" CommandName="chon">
                                                                              <div style="margin:0 auto; padding-left:15px;">
                                                                                  <%# Eval("stt")%>
                                                                              </div>
                                                                        </asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:PostBackTrigger ControlID="btnDatVe" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                                  
                                            </div>
                                             <div style="float:left">
                                                 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                    <ContentTemplate>
                                                  <asp:GridView ID="DList_2"  ShowHeader="false"  CssClass="table-responsive" OnRowCommand="DList_2_RowCommand"  AutoGenerateColumns="false" border="0" Width="100%" runat="server">
                                                     <Columns>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                       <asp:Label ID="lblSTT" runat="server" Text='<%# Eval("stt")%>' Visible="false"></asp:Label>
                                                                        <asp:LinkButton ID="lblChon" runat="server" CssClass="ball" CommandName="chon">
                                                                              <div style="margin:0 auto; padding-left:15px;">
                                                                                  <%# Eval("stt")%>
                                                                              </div>
                                                                        </asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                 </asp:GridView>
                                                </ContentTemplate>
                                                    <Triggers>
                                                        <asp:PostBackTrigger ControlID="btnDatVe" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </div>
                                             <div style="float:left">
                                                 <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                    <ContentTemplate>
                                                    <asp:GridView ID="DList_3"  ShowHeader="false"  CssClass="table-responsive" OnRowCommand="DList_3_RowCommand"  AutoGenerateColumns="false" border="0" Width="100%" runat="server">
                                                      <Columns>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                       <asp:Label ID="lblSTT" runat="server" Text='<%# Eval("stt")%>' Visible="false"></asp:Label>
                                                                        <asp:LinkButton ID="lblChon" runat="server" CssClass="ball" CommandName="chon">
                                                                              <div style="margin:0 auto; padding-left:15px;">
                                                                                  <%# Eval("stt")%>
                                                                              </div>
                                                                        </asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                 </asp:GridView>
                                            </ContentTemplate>
                                                    <Triggers>
                                                        <asp:PostBackTrigger ControlID="btnDatVe" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </div>
                                            
                                              <div style="float:left; padding-left:50px; ">
                                                 <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                    <ContentTemplate>
                                                   <asp:GridView ID="gridTien"  ShowHeader="false"  CssClass="table-responsive" OnRowCommand="gridTien_RowCommand"  AutoGenerateColumns="false" border="0" Width="100%" runat="server">
                                                      <Columns>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                         <asp:Label ID="lblID" runat="server" Text='' Visible="false"></asp:Label>
                                                                       <asp:Label ID="lblSTT" runat="server" Text='<%# Eval("SoTien")%>' Visible="false"></asp:Label>
                                                                        <asp:LinkButton Width="100px" ID="lblChon" runat="server" CssClass="btn btn-default" CommandName="chon">
                                                                              <div style="margin:0 auto; padding-left:15px;">
                                                                                  <%# Eval("tien")%>
                                                                              </div>
                                                                        </asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    
                                                                </asp:TemplateField>
                                                            </Columns>
                                                 </asp:GridView>
                                            </ContentTemplate>
                                                    <Triggers>
                                                        <asp:PostBackTrigger ControlID="btnDatVe" />
                                                    </Triggers>
                                                </asp:UpdatePanel>

                                                  <div style="padding-bottom:5px;padding-top:70px;">
                                                       <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                                            <ContentTemplate>
                                                              <asp:Button ID="btnChon" runat="server" Text="Thêm" width="100px"  CssClass="btn btn-default" OnClick="btnChon_Click" /><br /><br />
                                                           <asp:Button ID="btnHuy" runat="server" Text="Huỷ"  width="100px"   CssClass="btn btn-default" OnClick="btnHuy_Click" />
                                                          </ContentTemplate>
                                                            <Triggers>
                                                                <asp:PostBackTrigger ControlID="btnDatVe" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                        </div>
                                            </div>
                                        </div>
                                      
                                    </div>
                               </div>
                            </div>
                            <!-- /.box-body -->
                          </div>
                    
                     </div>
                <div class="col-lg-12">
                    <div class="form-group">
                        <div style="float: left; font-weight: bold; font-size: 20px;">Tạm tính</div>
                        <div style="float: right; color: red; font-weight: bold; font-size: 20px;">
                             <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                     <ContentTemplate>
                                           <asp:Label ID="lblTongTam" runat="server" Text="0" ForeColor="Red" Font-Bold="true"></asp:Label> VNĐ
                                       </ContentTemplate>
                                        <Triggers>
                                              <asp:AsyncPostBackTrigger ControlID="btnChon" EventName="Click"  />
                                         </Triggers>
                             </asp:UpdatePanel>
                         </div>
                    </div>
                </div>
               
            <div class="col-lg-12">
                <center>
                    <asp:LinkButton ID="btnDatVe" runat="server" Text="Đặt vé" CssClass="btn" Width="100%" BackColor="Red" ForeColor="White" OnClick="btnDatVe_Click">
                        <i class="fa fa-credit-card"></i>Đặt vé
                    </asp:LinkButton>
                  
                </center>

            </div>
            </div>
        </section>
        <!-- /.content -->
    </div>
    <style>
        .number {
            border: #CCC solid 1px;
            border-radius: 1.1em;
            -moz-border-radius: 1.1em;
            -webkit-border-radius: 1.1em;
            display: inline-block;
            font-weight: 700;
            line-height: 2.2em;
            margin: 0 3px 6px;
            text-align: center;
            width: 2.2em;
            height: 2.2em;
            cursor: pointer;
        }
    </style>
   

</asp:Content>
