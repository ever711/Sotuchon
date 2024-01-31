<%@ Page ValidateRequest="false" Title="" Language="C#"  MasterPageFile="~/GiaoDien.Master" AutoEventWireup="true" CodeBehind="Buy31.aspx.cs" Inherits="XoSoTuChonBenTre.Buy31" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-full">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="d-flex align-items-center">
                <div class="me-auto">
                    <h4 class="page-title">Mua vé số
                        <asp:Label ID="lblLoai" runat="server" ForeColor="Red" Font-Bold="true" Text="4 số"></asp:Label></h4>
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
                <div class="col-3">
                    <div class="form-group">
                        <asp:TextBox ID="txtNgay" runat="server" CssClass="form-control" TextMode="Date" ></asp:TextBox>
                    </div>
                </div>
                <div class="col-12">
                    <style>
                        .ball {
                            border-color: red;
                            color: red;
                            display: inline-block;
                            width: 30px;
                            height: 30px;
                            line-height: 29px;
                            border: solid 1px #fa3;
                            border-radius: 50%;
                            margin: 2px 4px;
                            color: #fa3;
                            font-weight: 700;
                        }
                    </style>
                    <fieldset>
                        <legend>Chọn dãy số dự thưởng</legend>
                        <div class="box">
                            <!-- /.box-header -->
                            <div class="box-body">
                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs" role="tablist">
                                    <li class="nav-item"><a class="nav-link active" data-bs-toggle="tab" href="#home" role="tab"><span class="hidden-sm-up"><i class="ion-person"></i></span> 4 Lô</a> </li>
                                    <li class="nav-item"><a class="nav-link" data-bs-toggle="tab" href="#profile" role="tab"><span class="hidden-sm-up"><i class="ion-person"></i></span> 16 Lô</a> </li>
                                   
                                </ul>
                                <!-- Tab panes -->
                               <script type="text/javascript">
                                   function divFunction(id) {
                                       var x = $('#trigger' + id).text();
                                       $("#ContentPlaceHolder1_txtSoLieu").val('');
                                       $("#lblSoChon").val(x.toString().trim());
                                       $("#myModal").modal('show');
                                   };
                                   function divFunction2(id) {
                                       var x = $('#triggerx' + id).text();
                                       $("#ContentPlaceHolder1_txtSoLieu2").val('');
                                       $("#lblSoChon2").val(x.toString().trim());
                                       $("#myModal2").modal('show');
                                   };
                                   
                                  
                               </script>
                                <div class="tab-content tabcontent-border">
                                    <div class="tab-pane active" id="home" role="tabpanel">
                                         <asp:DataList ID="DList_4Lo"  CssClass="table-responsive" border="0"  RepeatDirection="Horizontal" RepeatColumns="5" Width="100%" runat="server"  >
                                                    <ItemTemplate>
                                                        
					                                           <div style="border-radius:3px; border:solid 1px #CCC; height:30px; margin:6px 6px 6px 6px !important;">
                                                                 <a  onclick='divFunction("<%# (Container.ItemIndex).ToString() %>");'  data-bs-toggle="modal" id="trigger<%# (Container.ItemIndex).ToString() %>" data-bs-target="#myModal1">
                                                                   <center style="margin-top:3px;">
                                                                       <asp:Label ID="lblSTT" runat="Server" Text='<%# Eval("stt") %>'></asp:Label>
                                                                    <div style="float:right !important; padding-top:5px;padding-right:2px; font-size:12px;">
                                                                      <sub><asp:Label ID="lblSoTien" runat="server" Text=' <%# Eval("sotien") %>'></asp:Label></sub>
                                                                    </div>
                                                                    </center>
                                                                  </a>
                                                            </div>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                    </div>
                                    <div class="tab-pane" id="profile" role="tabpanel">
                                       <asp:DataList ID="DList_16Lo" CssClass="table-responsive" border="0"  RepeatDirection="Horizontal" RepeatColumns="5" Width="100%" runat="server"  >
                                                    <ItemTemplate>
                                                        
					                                           <div style="border-radius:3px; border:solid 1px #CCC; height:30px; margin:6px 6px 6px 6px !important;">
                                                                 <a  onclick='divFunction2("<%# (Container.ItemIndex).ToString() %>");'  data-bs-toggle="modal" id="triggerx<%# (Container.ItemIndex).ToString() %>" data-bs-target="#myModal1">
                                                                   <center style="margin-top:3px;">
                                                                       <asp:Label ID="lblSTT" runat="Server" Text='<%# Eval("stt") %>'></asp:Label>
                                                                    <div style="float:right !important; padding-top:5px;padding-right:2px; font-size:12px;">
                                                                      <sub><asp:Label ID="lblSoTien" runat="server" Text=' <%# Eval("sotien") %>'></asp:Label></sub>
                                                                    </div>
                                                                    </center>
                                                                  </a>
                                                            </div>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                    </div>
                                   
                                     

                                  <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		                            <div class="modal-dialog">
			                            <div class="modal-content">
				                            <div class="modal-header">
					                            <h4 class="modal-title" id="myModalLabel">Nhập số tiền số: <input type="text" name="lblSoChon" value="" ID="lblSoChon"  style="border:none"  ForeColor="Red" /></h4>
					                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				                            </div>
				                            <div class="modal-body">
					                            <p>
                                                    <asp:DropDownList ID="ddlSoLieu1" runat="server" CssClass="form-control">
                                                        <asp:ListItem Text="Không chọn" Value="0"></asp:ListItem>
                                                        <asp:ListItem Text="10k" Value="10"></asp:ListItem>
                                                        <asp:ListItem Text="20k" Value="20"></asp:ListItem>
                                                        <asp:ListItem Text="50k" Value="50"></asp:ListItem>
                                                        <asp:ListItem Text="100k" Value="100"></asp:ListItem>
                                                        <asp:ListItem Text="200k" Value="200"></asp:ListItem>
                                                        <asp:ListItem Text="500k" Value="500"></asp:ListItem>
                                                    </asp:DropDownList>
					                            </p>
				                            </div>
				                            <div class="modal-footer">
					                             <asp:Button id="btnChapNhan" runat="server" class="btn btn-danger" data-bs-dismiss="modal1" Text="Chấp nhận"  OnClick="btnChapNhan_Click"  />
                                                 <asp:Button id="btnHuy" runat="server" class="btn btn-dark" data-bs-dismiss="modal" Text="Huỷ" />
				                            </div>
			                            </div>
			                            <!-- /.modal-content -->
		                            </div>
		                            <!-- /.modal-dialog -->
	                            </div>
                                  <div id="myModal2" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		                            <div class="modal-dialog">
			                            <div class="modal-content">
				                            <div class="modal-header">
					                            <h4 class="modal-title" id="myModalLabel2">Nhập số tiền số: <input type="text" name="lblSoChon2" value="" ID="lblSoChon2"  style="border:none"  ForeColor="Red" /></h4>
					                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				                            </div>
				                            <div class="modal-body">
					                            <p>
                                                    <asp:DropDownList ID="ddlSoLieu2" runat="server" CssClass="form-control">
                                                         <asp:ListItem Text="Không chọn" Value="0"></asp:ListItem>
                                                        <asp:ListItem Text="10k" Value="10"></asp:ListItem>
                                                        <asp:ListItem Text="20k" Value="20"></asp:ListItem>
                                                        <asp:ListItem Text="50k" Value="50"></asp:ListItem>
                                                        <asp:ListItem Text="100k" Value="100"></asp:ListItem>
                                                        <asp:ListItem Text="200k" Value="200"></asp:ListItem>
                                                        <asp:ListItem Text="500k" Value="500"></asp:ListItem>
                                                    </asp:DropDownList>
					                            </p>
				                            </div>
				                            <div class="modal-footer">
					                             <asp:Button id="btnChapNhan2" runat="server" class="btn btn-danger" data-bs-dismiss="modal1" Text="Chấp nhận" OnClick="btnChapNhan2_Click"    />
                                                 <asp:Button id="btnHuy2" runat="server" class="btn btn-dark" data-bs-dismiss="modal" Text="Huỷ" />
				                            </div>
			                            </div>
			                            <!-- /.modal-content -->
		                            </div>
		                            <!-- /.modal-dialog -->
	                            </div>
                                </div>
                            </div>
                            <!-- /.box-body -->
                          </div>
                    </fieldset>

                     </div>
                <div class="col-12">
                    <div class="form-group">
                        <div style="float: left; font-weight: bold; font-size: 20px;">Tạm tính</div>
                        <div style="float: right; color: red; font-weight: bold; font-size: 20px;">
                            <asp:Label ID="lblTongTam" runat="server" Text="0" ForeColor="Red" Font-Bold="true"></asp:Label> VNĐ
                         </div>
                    </div>
                </div>
               
            <div class="col-12">
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
