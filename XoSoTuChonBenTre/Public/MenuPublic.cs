 
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
	public class MenuPublic
	{
	 	protected int  _menu_id;
	 	public  int menu_id
	 		{
 	 			 get 	{ return _menu_id;	}
	 			set 	{_menu_id= value ;	}
	 		}
	 	protected String  _menu_title;
	 	public  String menu_title
	 		{
 	 			 get 	{ return _menu_title;	}
	 			set 	{ _menu_title= value;	}
	 		}
	 	protected String  _menu_description;
	 	public  String menu_description
	 		{
 	 			 get 	{ return _menu_description;	}
	 			set 	{ _menu_description= value;	}
	 		}
	 	protected String  _menu_url;
	 	public  String menu_url
	 		{
 	 			 get 	{ return _menu_url;	}
	 			set 	{ _menu_url= value;	}
	 		}
	 	protected String  _menu_valuepath;
	 	public  String menu_valuepath
	 		{
 	 			 get 	{ return _menu_valuepath;	}
	 			set 	{ _menu_valuepath= value;	}
	 		}
	 	protected int  _menu_parent_id;
	 	public  int menu_parent_id
	 		{
 	 			 get 	{ return _menu_parent_id;	}
	 			set 	{_menu_parent_id= value ;	}
	 		}
	 	protected String  _menu_order;
	 	public  String menu_order
	 		{
 	 			 get 	{ return _menu_order;	}
	 			set 	{ _menu_order= value;	}
	 		}
	}
}