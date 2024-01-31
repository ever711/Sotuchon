<%@ Page Title="" Language="C#" MasterPageFile="~/GiaoDien.Master" AutoEventWireup="true" CodeBehind="temp.aspx.cs" Inherits="XoSoTuChonBenTre.temp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-full">
		<!-- Content Header (Page header) -->	  
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="me-auto">
					<h4 class="page-title">Mua vé số</h4>
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
			 <div class="col-12">
				  <div class="form-group">
					 <table  class="table table-light" width="100%">
						 <tr>
							 <td colspan="4">
								  <img src="images/veso/banner.png" class="img" />
							 </td>
						 </tr>
						 <tr>
							 <th colspan="4" rowspan="1">LOẠI 2 CHỮ SỐ</th>
						 </tr>
						 <tr>
							 <th>Lô</th>
							 <th>Viết tắt</th>
							 <th>Cách thức tham gia dự thưởng</th>
							 <th></th>
						 </tr>
						 <tr>
							 <td>Đầu</td>
							 <td>Đ</td>
							 <td>Đối chiếu 2 số của giải 8</td>
							 <td>
								 <a href="Buy.aspx">
									 <i class="fa fa-opencart"><b style="color:red"> Mua</b></i>
								 </a>
							 </td>
						 </tr>
						 <tr>
							 <td>Cuối</td>
							 <td>C</td>
							 <td>Đối chiếu 2 số của giải đặc biệt</td>
							 <td>
								 <a href="Buy.aspx">
									 <i class="fa fa-opencart"><b style="color:red"> Mua</b></i>
								 </a>
							 </td>
						 </tr>
						 <tr>
							 <td>Đầu-Cuối</td>
							 <td>Đ/C</td>
							 <td>Đối chiếu 2 số của giải 8 và 2 số của giải đặc biệt</td>
							 <td>
								 <a href="Buy.aspx">
									 <i class="fa fa-opencart"><b style="color:red"> Mua</b></i>
								 </a>
							 </td>
						 </tr>
						 <tr>
							 <td>18 Lô</td>
							 <td>18L</td>
							 <td>Đối chiếu 2 số của 18 lô (từ giải 8 đến giải đặc biệt)</td>
							 <td>
								 <a href="Buy.aspx">
									 <i class="fa fa-opencart"><b style="color:red"> Mua</b></i>
								 </a>
							 </td>
						 </tr>
						<tr>
							 <th colspan="4" rowspan="1">LOẠI 3 CHỮ SỐ</th>
						 </tr>
						 <tr>
							 <th>Lô</th>
							 <th>Viết tắt</th>
							 <th>Cách thức tham gia dự thưởng</th>
							 <th></th>
						 </tr>
						 <tr>
							 <td>Đầu</td>
							 <td>Đ</td>
							 <td>Đối chiếu 3 số của giải 7</td>
							 <td>
								 <a href="Buy2.aspx">
									 <i class="fa fa-opencart"><b style="color:red"> Mua</b></i>
								 </a>
							 </td>
						 </tr>
						 <tr>
							 <td>Cuối</td>
							 <td>C</td>
							 <td>Đối chiếu 3 số của giải đặc biệt</td>
							 <td>
								 <a href="Buy2.aspx">
									 <i class="fa fa-opencart"><b style="color:red"> Mua</b></i>
								 </a>
							 </td>
						 </tr>
						 <tr>
							 <td>Đầu-Cuối</td>
							 <td>Đ/C</td>
							 <td>Đối chiếu 3 số của giải 7 và 3 số của giải đặc biệt</td>
							 <td>
								 <a href="Buy2.aspx">
									 <i class="fa fa-opencart"><b style="color:red"> Mua</b></i>
								 </a>
							 </td>
						 </tr>
						 <tr>
							 <td>7 Lô</td>
							 <td>7L</td>
							 <td>Đối chiếu 3 số của 7 lô giải 4(từ giải 8 đến giải đặc biệt)</td>
							 <td>
								 <a href="Buy2.aspx">
									 <i class="fa fa-opencart"><b style="color:red"> Mua</b></i>
								 </a>
							 </td>
						 </tr>
						 <tr>
							 <td>17 Lô</td>
							 <td>17L</td>
							 <td>Đối chiếu 3 số của 17 lô giải 4(từ giải 7 đến giải đặc biệt)</td>
							 <td>
								 <a href="Buy2.aspx">
									 <i class="fa fa-opencart"><b style="color:red"> Mua</b></i>
								 </a>
							 </td>
						 </tr>
						 <tr>
							 <th colspan="4" rowspan="1">LOẠI 4 CHỮ SỐ</th>
						 </tr>
						 <tr>
							 <th>Lô</th>
							 <th>Viết tắt</th>
							 <th>Cách thức tham gia dự thưởng</th>
							 <th></th>
						 </tr>
						 <tr>
							 <td>4 Lô</td>
							 <td>4L</td>
							 <td>Đối chiếu 4 số của giải Sáu và giải Năm</td>
							 <td>
								 <a href="Buy3.aspx">
									 <i class="fa fa-opencart"><b style="color:red"> Mua</b></i>
								 </a>
							 </td>
						 </tr>
						 <tr>
							 <td>16 Lô</td>
							 <td>16L</td>
							 <td>Đối chiếu 4 số cuối của 16 lô (từ giải 6 đến giải đặc biệt) </td>
							 <td>
								 <a href="Buy3.aspx">
									 <i class="fa fa-opencart"><b style="color:red"> Mua</b></i>
								 </a>
							 </td>
						 </tr>
					 </table>
				  </div>
			 </div>
		 </div>
		 
		</section>
		<!-- /.content -->
	  </div>
</asp:Content>
