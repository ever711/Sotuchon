 
//////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                  // 
// Ngày tạo:7/19/2023 9:45:00 PM                                                     //
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
	public class TaiKhoanHeThongPublic
	{
	 	protected int  _IDTaiKhoan;
	 	public  int IDTaiKhoan
	 		{
 	 			 get 	{ return _IDTaiKhoan;	}
	 			set 	{_IDTaiKhoan= value ;	}
	 		}
	 	protected String  _TaiKhoan;
	 	public  String TaiKhoan
	 		{
 	 			 get 	{ return _TaiKhoan;	}
	 			set 	{ _TaiKhoan= value;	}
	 		}
	 	protected String  _MatKhau;
	 	public  String MatKhau
	 		{
 	 			 get 	{ return _MatKhau;	}
	 			set 	{ _MatKhau= value;	}
	 		}
	 	protected String  _LevelCode;
	 	public  String LevelCode
	 		{
 	 			 get 	{ return _LevelCode;	}
	 			set 	{ _LevelCode= value;	}
	 		}
	 	protected bool  _LaQuanLy;
	 	public  bool LaQuanLy
	 		{
 	 			 get 	{ return _LaQuanLy;	}
	 			set 	{_LaQuanLy=value;	}
	 		}
	 	protected String  _MaDaiLy;
	 	public  String MaDaiLy
	 		{
 	 			 get 	{ return _MaDaiLy;	}
	 			set 	{ _MaDaiLy= value;	}
	 		}
	 	protected String  _HoTen;
	 	public  String HoTen
	 		{
 	 			 get 	{ return _HoTen;	}
	 			set 	{ _HoTen= value;	}
	 		}
	 	protected String  _ChietKhau;
	 	public  String ChietKhau
	 		{
 	 			 get 	{ return _ChietKhau;	}
	 			set 	{ _ChietKhau= value;	}
	 		}
	 	protected String  _SoDienThoai;
	 	public  String SoDienThoai
	 		{
 	 			 get 	{ return _SoDienThoai;	}
	 			set 	{ _SoDienThoai= value;	}
	 		}
	 	protected String  _DiaChi;
	 	public  String DiaChi
	 		{
 	 			 get 	{ return _DiaChi;	}
	 			set 	{ _DiaChi= value;	}
	 		}
	 	protected String  _SoTaiKhoan;
	 	public  String SoTaiKhoan
	 		{
 	 			 get 	{ return _SoTaiKhoan;	}
	 			set 	{ _SoTaiKhoan= value;	}
	 		}
	 	protected String  _NganHang;
	 	public  String NganHang
	 		{
 	 			 get 	{ return _NganHang;	}
	 			set 	{ _NganHang= value;	}
	 		}
	 	protected bool  _KichHoat;
	 	public  bool KichHoat
	 		{
 	 			 get 	{ return _KichHoat;	}
	 			set 	{_KichHoat=value;	}
	 		}
	 	protected Double  _ViTien;
	 	public  Double ViTien
	 		{
 	 			 get 	{ return _ViTien;	}
	 			set 	{ _ViTien= value;	}
	 		}
	}
}