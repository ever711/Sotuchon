 
//////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                  // 
// Ngày tạo:7/19/2023 9:44:59 PM                                                     //
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
	public class PhieuDuThuongPublic
	{
	 	protected int  _IDPhieuDuThuong;
	 	public  int IDPhieuDuThuong
	 		{
 	 			 get 	{ return _IDPhieuDuThuong;	}
	 			set 	{_IDPhieuDuThuong= value ;	}
	 		}
	 	protected int  _IDGame;
	 	public  int IDGame
	 		{
 	 			 get 	{ return _IDGame;	}
	 			set 	{_IDGame= value ;	}
	 		}
	 	protected int  _NgayXuat;
	 	public  int NgayXuat
	 		{
 	 			 get 	{ return _NgayXuat;	}
	 			set 	{_NgayXuat= value ;	}
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
	 	protected String  _KetQua;
	 	public  String KetQua
	 		{
 	 			 get 	{ return _KetQua;	}
	 			set 	{ _KetQua= value;	}
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
	 	protected String  _GhiChu;
	 	public  String GhiChu
	 		{
 	 			 get 	{ return _GhiChu;	}
	 			set 	{ _GhiChu= value;	}
	 		}
	 	protected String  _NguoiXuat;
	 	public  String NguoiXuat
	 		{
 	 			 get 	{ return _NguoiXuat;	}
	 			set 	{ _NguoiXuat= value;	}
	 		}
	}
}