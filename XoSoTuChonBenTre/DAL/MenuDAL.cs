 
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
using System.Data;
using System.Data.SqlClient;
using Public;
using System.Reflection;

namespace DAL
{
	public class MenuDAL
	{
		public int Insert_Menu(MenuPublic p)
		{
		Database cn = new Database();
		        SqlParameter[] prams = new SqlParameter[]
		        {
		        cn.MakeOutParam("@menu_id_Output", SqlDbType.Int, 4),
				 cn.MakeInParam("@menu_title", SqlDbType.NVarChar, 4000, p.menu_title),
				cn.MakeInParam("@menu_description", SqlDbType.NVarChar, 4000, p.menu_description),
				cn.MakeInParam("@menu_url", SqlDbType.NVarChar, 4000, p.menu_url),
				cn.MakeInParam("@menu_valuepath", SqlDbType.Text, 2147483647, p.menu_valuepath),
				cn.MakeInParam("@menu_parent_id", SqlDbType.Int, 4, p.menu_parent_id),
				cn.MakeInParam("@menu_order", SqlDbType.NVarChar, 100, p.menu_order)
				
		     };
		        cn.RunProc("sp_Menu_Insert",prams);
		        cn.Dispose();
		        try
		        {
		          return (int)prams[0].Value;
		        }
		        catch (Exception)
		        {
		         return 1;
		       }
        }		 
		public int Update_Menu(MenuPublic p)
		{
		Database cn = new Database();
		        SqlParameter[] prams = new SqlParameter[]
        		{
		        cn.MakeInParam("@menu_id", SqlDbType.Int, 4, p.menu_id),
		        cn.MakeInParam("@menu_title", SqlDbType.NVarChar, 4000, p.menu_title),
		        cn.MakeInParam("@menu_description", SqlDbType.NVarChar, 4000, p.menu_description),
		        cn.MakeInParam("@menu_url", SqlDbType.NVarChar, 4000, p.menu_url),
		        cn.MakeInParam("@menu_valuepath", SqlDbType.Text, 2147483647, p.menu_valuepath),
		        cn.MakeInParam("@menu_parent_id", SqlDbType.Int, 4, p.menu_parent_id),
		        cn.MakeInParam("@menu_order", SqlDbType.NVarChar, 100, p.menu_order)
        		};
		        cn.RunProc("sp_Menu_Update",prams);
		        cn.Dispose();
		        try
		        {
		          return (int)prams[0].Value;
		        }
		        catch (Exception)
		        {
		         return 1;
		       }
		}
		public int Delete_Menu(MenuPublic p)
		{
		Database cn = new Database();
		        SqlParameter[] prams = new SqlParameter[]
        		{
		        cn.MakeInParam("@menu_id", SqlDbType.Int, 4,p.menu_id)
        		};
		        cn.RunProc("sp_Menu_Delete",prams);
		        cn.Dispose();
		        try
		        {
		          return (int)prams[0].Value;
		        }
		        catch (Exception)
		        {
		         return 1;
		       }
		}
		public DataTable All_Menu()
		{
		Database cn = new Database();
		        DataTable dt=  cn.RunExecProc("sp_Menu_All").Tables[0];
		        cn.Dispose();
		        return dt;
		}
	}
}
