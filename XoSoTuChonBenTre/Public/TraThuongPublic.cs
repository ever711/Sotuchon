 
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
	public class TraThuongPublic
	{
	 	protected int  _IDTraThuong;
	 	public  int IDTraThuong
	 		{
 	 			 get 	{ return _IDTraThuong;	}
	 			set 	{_IDTraThuong= value ;	}
	 		}
	 	protected int  _NgayTraThuong;
	 	public  int NgayTraThuong
	 		{
 	 			 get 	{ return _NgayTraThuong;	}
	 			set 	{_NgayTraThuong= value ;	}
	 		}
	 	protected int  _IDPhieuDuThuong;
	 	public  int IDPhieuDuThuong
	 		{
 	 			 get 	{ return _IDPhieuDuThuong;	}
	 			set 	{_IDPhieuDuThuong= value ;	}
	 		}
	 	protected String  _SoPhieu;
	 	public  String SoPhieu
	 		{
 	 			 get 	{ return _SoPhieu;	}
	 			set 	{ _SoPhieu= value;	}
	 		}
	 	protected String  _SoDuThuong;
	 	public  String SoDuThuong
	 		{
 	 			 get 	{ return _SoDuThuong;	}
	 			set 	{ _SoDuThuong= value;	}
	 		}
	 	protected String  _So;
	 	public  String So
	 		{
 	 			 get 	{ return _So;	}
	 			set 	{ _So= value;	}
	 		}
	 	protected String  _Lo;
	 	public  String Lo
	 		{
 	 			 get 	{ return _Lo;	}
	 			set 	{ _Lo= value;	}
	 		}
	 	protected String  _NguoiTra;
	 	public  String NguoiTra
	 		{
 	 			 get 	{ return _NguoiTra;	}
	 			set 	{ _NguoiTra= value;	}
	 		}
	}
}