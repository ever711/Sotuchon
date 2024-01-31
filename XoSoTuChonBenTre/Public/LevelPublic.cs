 
//////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                  // 
// Ngày tạo:7/19/2023 9:44:57 PM                                                     //
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
	public class LevelPublic
	{
	 	protected int  _LevelID;
	 	public  int LevelID
	 		{
 	 			 get 	{ return _LevelID;	}
	 			set 	{_LevelID= value ;	}
	 		}
	 	protected String  _LevelCode;
	 	public  String LevelCode
	 		{
 	 			 get 	{ return _LevelCode;	}
	 			set 	{ _LevelCode= value;	}
	 		}
	 	protected String  _LevelName;
	 	public  String LevelName
	 		{
 	 			 get 	{ return _LevelName;	}
	 			set 	{ _LevelName= value;	}
	 		}
	}
}