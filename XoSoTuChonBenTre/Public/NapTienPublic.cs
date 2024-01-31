 
//////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                  // 
// Ngày tạo:7/19/2023 9:44:58 PM                                                     //
// Tác giả: Mr. Thanh                                                                                //
//                                                                                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////
 
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.Data.SqlClient;
namespace Public
{
	public class NapTienPublic
	{
	 	protected int  _IDNap;
	 	public  int IDNap
	 		{
 	 			 get 	{ return _IDNap;	}
	 			set 	{_IDNap= value ;	}
	 		}
	 	protected int  _NgayNap;
	 	public  int NgayNap
	 		{
 	 			 get 	{ return _NgayNap;	}
	 			set 	{_NgayNap= value ;	}
	 		}
	 	protected String  _TaiKhoan;
	 	public  String TaiKhoan
	 		{
 	 			 get 	{ return _TaiKhoan;	}
	 			set 	{ _TaiKhoan= value;	}
	 		}
	 	protected Double  _SoTien;
	 	public  Double SoTien
	 		{
 	 			 get 	{ return _SoTien;	}
	 			set 	{ _SoTien= value;	}
	 		}
	 	protected String  _NganHang;
	 	public  String NganHang
	 		{
 	 			 get 	{ return _NganHang;	}
	 			set 	{ _NganHang= value;	}
	 		}
	 	protected bool  _XacNhan;
	 	public  bool XacNhan
	 		{
 	 			 get 	{ return _XacNhan;	}
	 			set 	{_XacNhan=value;	}
	 		}
	 	protected String  _NguoiXacNhan;
	 	public  String NguoiXacNhan
	 		{
 	 			 get 	{ return _NguoiXacNhan;	}
	 			set 	{ _NguoiXacNhan= value;	}
	 		}
	 	protected int  _NgayXacNhan;
	 	public  int NgayXacNhan
	 		{
 	 			 get 	{ return _NgayXacNhan;	}
	 			set 	{_NgayXacNhan= value ;	}
	 		}
	 	protected String  _HinhDinhKem;
	 	public  String HinhDinhKem
	 		{
 	 			 get 	{ return _HinhDinhKem;	}
	 			set 	{ _HinhDinhKem= value;	}
	 		}
	}
}