<%@ Page ValidateRequest="false" Title="" Language="C#" MasterPageFile="~/GiaoDien.Master" AutoEventWireup="true" CodeBehind="Buy.aspx.cs" Inherits="XoSoTuChonBenTre.Buy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="script1" runat="server"></asp:ScriptManager>
    <div class="container-full">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="d-flex align-items-center">
                <div class="me-auto">
                    <h4 class="page-title">Mua vé số
                        <asp:Label ID="lblLoai" runat="server" ForeColor="Red" Font-Bold="true" Text="2 số"></asp:Label>
                    </h4>
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
                <%--                <div class="col-3">
                    <div class="form-group">
                        <asp:TextBox ID="txtNgay" runat="server" CssClass="form-control" TextMode="Date" ></asp:TextBox>
                    </div>
                </div>--%>
                <%--<div class="col-lg-2">
                    <div class="form-group">
                        <label>Miền</label>
                        <asp:DropDownList ID="ddlMien" runat="server" CssClass="form-control" OnSelectedIndexChanged="ChangeSide">
                            <asp:ListItem Selected="True" Value="">Chọn miền</asp:ListItem>
                             <asp:ListItem Value="South">Miền Nam</asp:ListItem>
                            <asp:ListItem Value="Middle">Miền Trung</asp:ListItem>
                           <asp:ListItem Value="North">Miền Bắc</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <input type="hidden" id="hiddenSelectedTab" runat="server" />
                <div class="col-lg-2">
                    <div class="form-group">
                        <label>Đài</label>
                        <asp:DropDownList ID="ddlDai" runat="server" CssClass="form-control" DataValueField="MaDai" DataTextField="TenDai"  OnSelectedIndexChanged="ChangeDai"></asp:DropDownList>
                    </div>
                </div>--%>
                <div>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" class="row">
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
                                    <asp:DropDownList ID="ddlDai" runat="server" CssClass="form-control" DataValueField="MaDai" DataTextField="TenDai" OnSelectedIndexChanged="ChangeDai"></asp:DropDownList>
                                </div>
                            </div>
                        </contenttemplate>
                    </asp:UpdatePanel>
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
                                <ul class="nav nav-tabs" role="tablist" style="" >
                                    <li class="nav-item active" onclick="return handleSubmit('home');"><a class="nav-link" data-bs-toggle="tab" href="#home" role="tab"><span class="hidden-sm-up"><i class="ion-person"></i></span>ĐẦU</a> </li>
                                    <li class="nav-item" onclick="return handleSubmit('profile');"><a class="nav-link" data-bs-toggle="tab" href="#profile" role="tab"><span class="hidden-sm-up"><i class="ion-person"></i></span>CUỐI</a> </li>
                                    <li class="nav-item" onclick="return handleSubmit('messages');"><a class="nav-link" data-bs-toggle="tab" href="#messages" role="tab"><span class="hidden-sm-up"><i class="ion-person"></i></span>ĐẦU - CUỐI</a> </li>
                                    <li class="nav-item" onclick="return handleSubmit('messages1');"><a class="nav-link" data-bs-toggle="tab" href="#messages1" role="tab"><span class="hidden-sm-up"><i class="ion-person"></i></span>LÔ</a> </li>
                                    <%--<a class="nav-link" data-bs-toggle="tab" href="#test" role="tab"><span class="hidden-sm-up"><i class="ion-person"></i></span>test</a>--%>
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
                                    function divFunction3(id) {
                                        var x = $('#triggerxx' + id).text();
                                        $("#ContentPlaceHolder1_txtSoLieu3").val('');
                                        $("#lblSoChon3").val(x.toString().trim());
                                        $("#myModal3").modal('show');
                                    };
                                    function divFunction4(id) {
                                        var x = $('#triggerxxx' + id).text();
                                        $("#ContentPlaceHolder1_txtSoLieu4").val('');
                                        $("#lblSoChon4").val(x.toString().trim());
                                        $("#myModal4").modal('show');
                                    };
                                     function setTab() {
                                       <%--debugger
                                         var selectedTab = $('.nav-tabs .active a').attr('href'); // Get the href of the active tab
                                         console.log(selectedTab);
                                       document.getElementById('<%= hiddenSelectedTab.ClientID %>').value = selectedTab;--%>
                                   }

                                    function handleSubmit(tabId) {
                                        localStorage.setItem('lastActiveTab', tabId);
                                        let a = $("#<%= txtNama.ClientID %>").val(tabId);
                                        return true;
                                    }

                                    document.addEventListener('DOMContentLoaded', function () {
                                        let lastActiveTab = localStorage.getItem('lastActiveTab');
                                        if (lastActiveTab) {
                                            if (lastActiveTab !== null || lastActiveTab !== "") {
                                                $('.nav-link.active').removeClass('active');
                                                console.log(lastActiveTab)

                                                $('.nav-link[href="#' + lastActiveTab + '"]').addClass('active');
                                                if (lastActiveTab === "messages1") {
                                                    $('#messages1').addClass('active');
                                                }
                                                else if (lastActiveTab === "messages") {
                                                    $('#messages').addClass('active');
                                                } else if (lastActiveTab === "profile") {
                                                    $('#profile').addClass('active');
                                                }
                                                else {
                                                    $('#home').addClass('active');
                                                }


                                            } else {
                                                $('.nav-link[href="#home"]').addClass('active');
                                                $('#home').addClass('active');
                                            }
                                        } else {
                                            $('.nav-link[href="#home"]').addClass('active');
                                            $('#home').addClass('active');
                                        }

                                    });


                                </script>
                                <div class="tab-content tabcontent-border">
                                    <div class="tab-pane" id="home" role="tabpanel">
                                        <asp:DataList  ID="DList_dau" CssClass="table-responsive" border="0" RepeatDirection="Horizontal" RepeatColumns="5" Width="100%" runat="server">
                                            <itemtemplate>

                                                <div style="border-radius: 3px; border: solid 1px #CCC; height: 30px; margin: 6px 6px 6px 6px !important;">
                                                    <a onclick='divFunction("<%# (Container.ItemIndex).ToString() %>");' data-bs-toggle="modal" id="trigger<%# (Container.ItemIndex).ToString() %>" data-bs-target="#myModal1">
                                                        <center style="margin-top: 3px;">
                                                            <asp:Label ID="lblSTT" runat="Server" Text='<%# Eval("stt") %>'></asp:Label>
                                                            <div style="float: right !important; padding-top: 5px; padding-right: 2px; font-size: 12px;">
                                                                <sub>
                                                                    <asp:Label ID="lblSoTien" runat="server" Text=' <%# Eval("sotien") %>'></asp:Label>
                                                                </sub>
                                                            </div>
                                                        </center>
                                                    </a>
                                                </div>
                                            </itemtemplate>
                                        </asp:DataList>
                                    </div>
                                    <div class="tab-pane" id="profile" role="tabpanel">
                                        <asp:DataList ID="DList_cuoi" CssClass="table-responsive" border="0" RepeatDirection="Horizontal" RepeatColumns="5" Width="100%" runat="server">
                                            <itemtemplate>

                                                <div style="border-radius: 3px; border: solid 1px #CCC; height: 30px; margin: 6px 6px 6px 6px !important;">
                                                    <a onclick='divFunction2("<%# (Container.ItemIndex).ToString() %>");' data-bs-toggle="modal" id="triggerx<%# (Container.ItemIndex).ToString() %>" data-bs-target="#myModal1">
                                                        <center style="margin-top: 3px;">
                                                            <asp:Label ID="lblSTT" runat="Server" Text='<%# Eval("stt") %>'></asp:Label>
                                                            <div style="float: right !important; padding-top: 5px; padding-right: 2px; font-size: 12px;">
                                                                <sub>
                                                                    <asp:Label ID="lblSoTien" runat="server" Text=' <%# Eval("sotien") %>'></asp:Label>
                                                                </sub>
                                                            </div>
                                                        </center>
                                                    </a>
                                                </div>
                                            </itemtemplate>
                                        </asp:DataList>
                                    </div>
                                    <div class="tab-pane" id="messages" role="tabpanel">
                                        <asp:DataList ID="DList_daucuoi" CssClass="table-responsive" border="0" RepeatDirection="Horizontal" RepeatColumns="5" Width="100%" runat="server">
                                            <itemtemplate>

                                                <div style="border-radius: 3px; border: solid 1px #CCC; height: 30px; margin: 6px 6px 6px 6px !important;">
                                                    <a onclick='divFunction3("<%# (Container.ItemIndex).ToString() %>");' data-bs-toggle="modal" id="triggerxx<%# (Container.ItemIndex).ToString() %>" data-bs-target="#myModal1">
                                                        <center style="margin-top: 3px;">
                                                            <asp:Label ID="lblSTT" runat="Server" Text='<%# Eval("stt") %>'></asp:Label>
                                                            <div style="float: right !important; padding-top: 5px; padding-right: 2px; font-size: 12px;">
                                                                <sub>
                                                                    <asp:Label ID="lblSoTien" runat="server" Text=' <%# Eval("sotien") %>'></asp:Label>
                                                                </sub>
                                                            </div>
                                                        </center>
                                                    </a>
                                                </div>
                                            </itemtemplate>
                                        </asp:DataList>
                                    </div>
                                    <div class="tab-pane" id="messages1" role="tabpanel">
                                        <asp:DataList ID="DList_18Lo" CssClass="table-responsive" border="0" RepeatDirection="Horizontal" RepeatColumns="5" Width="100%" runat="server">
                                            <itemtemplate>

                                                <div style="border-radius: 3px; border: solid 1px #CCC; height: 30px; margin: 6px 6px 6px 6px !important;">
                                                    <a onclick='divFunction4("<%# (Container.ItemIndex).ToString() %>");' data-bs-toggle="modal" id="triggerxxx<%# (Container.ItemIndex).ToString() %>" data-bs-target="#myModal1">
                                                        <center style="margin-top: 3px;">
                                                            <asp:Label ID="lblSTT" runat="Server" Text='<%# Eval("stt") %>'></asp:Label>
                                                            <div style="float: right !important; padding-top: 5px; padding-right: 2px; font-size: 12px;">
                                                                <sub>
                                                                    <asp:Label ID="lblSoTien" runat="server" Text=' <%# Eval("sotien") %>'></asp:Label>
                                                                </sub>
                                                            </div>
                                                        </center>
                                                    </a>
                                                </div>
                                            </itemtemplate>
                                        </asp:DataList>
                                    </div>
                                    <%--<div class="tab-pane" id="test"  role="tabpanel">
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                            <contenttemplate>
                                                <asp:GridView ID="DList_2" ShowHeader="false" CssClass="table-responsive" OnRowCommand="DList_2_RowCommand" AutoGenerateColumns="false" border="0" Width="100%" runat="server">
                                                    <columns>
                                                        <asp:TemplateField>
                                                            <itemtemplate>
                                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("stt")%>' Visible="false"></asp:Label>
                                                                <asp:LinkButton ID="lblChon" runat="server" CssClass="ball" CommandName="chon">
                                                                    <div style="margin: 0 auto; padding-left: 15px;">
                                                                        <%# Eval("stt")%>
                                                                    </div>
                                                                </asp:LinkButton>
                                                            </itemtemplate>
                                                        </asp:TemplateField>
                                                    </columns>
                                                </asp:GridView>
                                            </contenttemplate>
                                            <triggers>
                                                <asp:PostBackTrigger ControlID="DList_2" />
                                            </triggers>
                                        </asp:UpdatePanel>
                                    </div>--%>
                                    <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                           
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h4 class="modal-title" id="myModalLabel">Nhập số tiền số:
                                                            <input type="text" name="lblSoChon" value="" id="lblSoChon" style="border: none" forecolor="Red" /></h4>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                            <contenttemplate>
                                                                <div class="modal-body">
                                                                    <p>
                                                                        <asp:DropDownList ID="ddlSoLieu1" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlSoLieu1_SelectedIndexChanged" AutoPostBack="true">
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
                                                                <div>
                                                                    <asp:Label ID="lblPreCal" runat="server" Text=  'Ước tính thắng: ' CssClass="p1rem">
                                                                        <asp:Literal ID="amountPreCal" runat="server" />
                                                                    </asp:Label>
                                                                </div>

                                                            </contenttemplate>
                                                        </asp:UpdatePanel>
                                                        <div class="modal-footer">
                                                            <asp:Button id="btnChapNhan" runat="server" class="btn btn-danger" data-bs-dismiss="modal1" Text="Chấp nhận" OnClick="btnChapNhan_Click" AutoPostBack="true"/>
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
                                                    <h4 class="modal-title" id="myModalLabel2">Nhập số tiền số:
                                                              <input type="text" name="lblSoChon2" value="" id="lblSoChon2" style="border: none" forecolor="Red" /></h4>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <asp:UpdatePanel ID="UpdatePanelMyModal2" runat="server">
                                                    <contenttemplate>
                                                        <div class="modal-body">
                                                            <p>
                                                                <asp:DropDownList ID="ddlSoLieu2" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlSoLieu2_SelectedIndexChanged" AutoPostBack="true">
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
                                                        <asp:Label ID="lblPreCal2" runat="server" Text='Ước tính thắng: ' CssClass="p1rem">
                                                            <asp:Literal ID="amountPreCal2" runat="server" />
                                                        </asp:Label>
                                                    </contenttemplate>
                                                </asp:UpdatePanel>
                                                <div class="modal-footer">
                                                    <asp:Button id="btnChapNhan2" runat="server" class="btn btn-danger" data-bs-dismiss="modal1" Text="Chấp nhận" OnClick="btnChapNhan2_Click" OnClientClick="return setTab();" />
                                                    <asp:Button id="btnHuy2" runat="server" class="btn btn-dark" data-bs-dismiss="modal" Text="Huỷ" />
                                                </div>
                                            </div>
                                            <!-- /.modal-content -->
                                        </div>
                                        <!-- /.modal-dialog -->
                                    </div>
                                    <div id="myModal3" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="myModalLabel3">Nhập số tiền số:
                                                                <input type="text" name="lblSoChon3" value="" id="lblSoChon3" style="border: none" forecolor="Red" /></h4>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <asp:UpdatePanel ID="UpdatePanelMoDal3" runat="server">
                                                    <contenttemplate>
                                                        <div class="modal-body">
                                                             <asp:TextBox runat="server" ID="txtNama2" EnableViewState="true" style="display:none;"> </asp:TextBox>
                                                            <p>
                                                                <asp:DropDownList ID="ddlSoLieu3" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlSoLieu3_SelectedIndexChanged" AutoPostBack="true">
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
                                                        <asp:Label ID="lblPreCal3" runat="server" Text='Ước tính thắng: ' CssClass="p1rem">
                                                            <asp:Literal ID="amountPreCal3" runat="server" />
                                                        </asp:Label>
                                                    </contenttemplate>
                                                </asp:UpdatePanel>
                                                <div class="modal-footer">
                                                    <asp:Button id="btnChapNhan3" runat="server" class="btn btn-danger" data-bs-dismiss="modal1" Text="Chấp nhận" OnClick="btnChapNhan3_Click" />
                                                    <asp:Button id="btnHuy3" runat="server" class="btn btn-dark" data-bs-dismiss="modal" Text="Huỷ" />
                                                </div>
                                            </div>
                                            <!-- /.modal-content -->
                                        </div>
                                        <!-- /.modal-dialog -->
                                    </div>

                                    <div id="myModal4" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="myModalLabel4">Nhập số tiền số:
                                                                    <input type="text" name="lblSoChon4" value="" id="lblSoChon4" style="border: none" forecolor="Red" /></h4>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <asp:UpdatePanel ID="UpdatePanelMoDal4" runat="server">
                                                    <contenttemplate>
                                                        <div class="modal-body">
                                                            <asp:TextBox runat="server" ID="txtNama" EnableViewState="true" style="display:none;"> </asp:TextBox>
                                                            <p>
                                                                <asp:DropDownList ID="ddlSoLieu4" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlSoLieu4_SelectedIndexChanged" AutoPostBack="true">
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
                                                        <asp:Label ID="lblPreCal4" runat="server" Text='Ước tính thắng: ' CssClass="p1rem">
                                                            <asp:Literal ID="amountPreCal4" runat="server" />
                                                        </asp:Label>
                                                    </contenttemplate>
                                                </asp:UpdatePanel>
                                                <div class="modal-footer">
                                                    <asp:Button id="btnChapNhan4" runat="server" class="btn btn-danger" data-bs-dismiss="modal1" Text="Chấp nhận" OnClick="btnChapNhan4_Click" />
                                                    <asp:Button id="btnHuy4" runat="server" class="btn btn-dark" data-bs-dismiss="modal" Text="Huỷ" />
                                                </div>
                                            </div>
                                            <!-- /.modal-content -->
                                        </div>
                                        <!-- /.modal-dialog -->
                                    </div>
                                    <!-- /.modal -->

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
                            <asp:Label ID="lblTongTam" runat="server" Text="0" ForeColor="Red" Font-Bold="true"></asp:Label>
                            VNĐ
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
        .p1rem{
            padding: 1rem;
        }
    </style>
</asp:Content>
