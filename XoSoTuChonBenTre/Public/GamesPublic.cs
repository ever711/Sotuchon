 
//////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                  // 
// Ngày tạo:7/19/2023 9:44:56 PM                                                     //
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
	public class GamesPublic
	{
	 	protected int  _IDGame;
	 	public  int IDGame
	 		{
 	 			 get 	{ return _IDGame;	}
	 			set 	{_IDGame= value ;	}
	 		}
	 	protected int  _NgayChoi;
	 	public  int NgayChoi
	 		{
 	 			 get 	{ return _NgayChoi;	}
	 			set 	{_NgayChoi= value ;	}
	 		}
	 	protected String  _MaDai;
	 	public  String MaDai
	 		{
 	 			 get 	{ return _MaDai;	}
	 			set 	{ _MaDai= value;	}
	 		}
	 	protected String  _Lo;
	 	public  String Lo
	 		{
 	 			 get 	{ return _Lo;	}
	 			set 	{ _Lo= value;	}
	 		}
	 	protected String  _So;
	 	public  String So
	 		{
 	 			 get 	{ return _So;	}
	 			set 	{ _So= value;	}
	 		}
	 	protected Double  _SoTien;
	 	public  Double SoTien
	 		{
 	 			 get 	{ return _SoTien;	}
	 			set 	{ _SoTien= value;	}
	 		}
	 	protected String  _TaiKhoan;
	 	public  String TaiKhoan
	 		{
 	 			 get 	{ return _TaiKhoan;	}
	 			set 	{ _TaiKhoan= value;	}
	 		}
	}
}