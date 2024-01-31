 
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
	public class PhanQuyenPublic
	{
	 	protected int  _AuthorDetailsID;
	 	public  int AuthorDetailsID
	 		{
 	 			 get 	{ return _AuthorDetailsID;	}
	 			set 	{_AuthorDetailsID= value ;	}
	 		}
	 	protected String  _TaiKhoan;
	 	public  String TaiKhoan
	 		{
 	 			 get 	{ return _TaiKhoan;	}
	 			set 	{ _TaiKhoan= value;	}
	 		}
	 	protected int  _menu_id;
	 	public  int menu_id
	 		{
 	 			 get 	{ return _menu_id;	}
	 			set 	{_menu_id= value ;	}
	 		}
	 	protected bool  _them;
	 	public  bool them
	 		{
 	 			 get 	{ return _them;	}
	 			set 	{_them=value;	}
	 		}
	 	protected bool  _sua;
	 	public  bool sua
	 		{
 	 			 get 	{ return _sua;	}
	 			set 	{_sua=value;	}
	 		}
	 	protected bool  _xoa;
	 	public  bool xoa
	 		{
 	 			 get 	{ return _xoa;	}
	 			set 	{_xoa=value;	}
	 		}
	 	protected bool  _inan;
	 	public  bool inan
	 		{
 	 			 get 	{ return _inan;	}
	 			set 	{_inan=value;	}
	 		}
	}
}