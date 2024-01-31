<%@ Page Title="" Language="C#" MasterPageFile="~/GiaoDien.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="XoSoTuChonBenTre.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-full">
		
		<!-- Main content -->
		<section class="invoice printableArea">
		<div class="row">
			 <div class="col-12">
				  <div class="form-group">
					 <table  class="table table-striped" width="100%">
						 <tr>
							 <td align="center" colspan="3">
								<p style="color:#0f64cb;clear:both; text-align:center !important;">CÔNG TY TNHH MTV XỔ SỐ TỰ CHỌN</p>
								 <p style="color:red;font-size:18px; text-align:center !important;">VÉ SỐ TỰ CHỌN THỦ CÔNG </p>
							   
								 </td>
						 </tr>
						 <tr>
							 <th colspan="3" rowspan="1" style="background-color:#808080;color:#ffffff">LOẠI 2 CHỮ SỐ</th>
						 </tr>
						 <tr>
							 <th>Lô</th>
							 <th>Viết tắt</th>
							 <th></th>
						 </tr>
						 <tr>
							 <td rowspan="1">Đầu<%--<br /><i>Đối chiếu 2 số của giải 8</i>--%></td>
							 <td rowspan="1">Đ</td>
							 <td rowspan="4"  align="center">
									 <div class="preview">
										<a href="Buy.aspx">
										  <img src="images/veso/mua.png" width="100px" height="35px" />
										</a>
						              </div>
									
							 </td>
						 </tr>
						 <tr>
							 <td rowspan="1">Cuối<br /><%--<i>Đối chiếu 2 số của giải đặc biệt</i>--%></td>
							 <td rowspan="1">C</td>
							
						 </tr>
						 <tr>
							 <td rowspan="1">Đầu-Cuối<%--<br /><i>Đối chiếu 2 số của giải 8 và 2 số của giải đặc biệt</i>--%></td>
							 <td rowspan="1">Đ/C</td>
							
						 </tr>
						 <tr>
							 <td rowspan="1">18 Lô<%--<br /><i>Đối chiếu 2 số của 18 lô (từ giải 8 đến giải đặc biệt)</i>--%></td>
							 <td rowspan="1">18L</td>
						 </tr>
						<tr>
							 <th colspan="3" rowspan="1"  style="background-color:#808080;color:#ffffff">LOẠI 3 CHỮ SỐ</th>
						 </tr>
						 <tr>
							 <th>Lô</th>
							 <th>Viết tắt</th>
							 <th></th>
						 </tr>
						 <tr>
							 <td rowspan="1">Đầu<%--<br /><i>Đối chiếu 3 số của giải 7</i>--%></td>
							 <td rowspan="1">Đ</td>
							 <td rowspan="5"  align="center">
								  <div class="preview">
										<a href="Buy2.aspx">
										 <img src="images/veso/mua.png" width="100px" height="35px" />
										</a>
						              </div>
							 </td>
						 </tr>
						 <tr>
							 <td rowspan="1">Cuối<%--<br /><i>Đối chiếu 3 số của giải đặc biệt</i>--%></td>
							 <td rowspan="1">C</td>
						 </tr>
						 <tr>
							 <td rowspan="1">Đầu-Cuối<%--<br /><i>Đối chiếu 3 số của giải 7 và 3 số của giải đặc biệt</i>--%></td>
							 <td rowspan="1">Đ/C</td>
						 </tr>
						 <tr>
							 <td rowspan="1">7 Lô<%--<br /><i>Đối chiếu 3 số của 7 lô giải 4(từ giải 8 đến giải đặc biệt)</i>--%></td>
							 <td rowspan="1">7L</td>
						 </tr>
						 <tr>
							 <td rowspan="1">17 Lô<%--<br /><i>Đối chiếu 3 số của 17 lô giải 4(từ giải 7 đến giải đặc biệt)</i>--%></td>
							 <td rowspan="1">17L</td>
						 </tr>
						 <tr>
							 <th colspan="3" rowspan="1"  style="background-color:#808080;color:#ffffff">LOẠI 4 CHỮ SỐ</th>
						 </tr>
						 <tr>
							 <th>Lô</th>
							 <th>Viết tắt</th>
							 <th></th>
						 </tr>
						 <tr>
							 <td rowspan="1">4 Lô<%--<br /><i>Đối chiếu 4 số của giải Sáu và giải Năm</i>--%></td>
							 <td rowspan="1">4L</td>
							 <td rowspan="2"  align="center">
								 <div class="preview">
										<a href="Buy3.aspx">
										  <img src="images/veso/mua.png" width="100px" height="35px" />
										</a>
						              </div>
							 </td>
						 </tr>
						 <tr>
							 <td rowspan="1">16 Lô<br /><%--<i>Đối chiếu 4 số cuối của 16 lô (từ giải 6 đến giải đặc biệt)</i>--%></td>
							 <td rowspan="1">16L</td>
						 </tr>
					 </table>
				  </div>
			 </div>
		 </div>
		 
		</section>
		<!-- /.content -->
	  </div>
</asp:Content>
