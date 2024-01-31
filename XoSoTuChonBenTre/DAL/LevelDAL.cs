 
//////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                  // 
// Ngày tạo:7/19/2023 9:44:57 PM                                                     //
// Tác giả: Mr. Bon                                                                               //
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
	public class LevelDAL
	{
		public int Insert_Level(LevelPublic p)
		{
		Database cn = new Database();
		        SqlParameter[] prams = new SqlParameter[]
		        {
		        cn.MakeOutParam("@LevelID_Output", SqlDbType.Int, 4),
				 cn.MakeInParam("@LevelCode", SqlDbType.NChar, 20, p.LevelCode),
				cn.MakeInParam("@LevelName", SqlDbType.NVarChar, 4000, p.LevelName)
				};
		        cn.RunProc("sp_Level_Insert",prams);
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
		public int Update_Level(LevelPublic p)
		{
		Database cn = new Database();
		        SqlParameter[] prams = new SqlParameter[]
        		{
		        cn.MakeInParam("@LevelID", SqlDbType.Int, 4, p.LevelID),
		        cn.MakeInParam("@LevelCode", SqlDbType.NChar, 20, p.LevelCode),
		        cn.MakeInParam("@LevelName", SqlDbType.NVarChar, 4000, p.LevelName)
        		};
		        cn.RunProc("sp_Level_Update",prams);
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
		public int Delete_Level(LevelPublic p)
		{
		Database cn = new Database();
		        SqlParameter[] prams = new SqlParameter[]
        		{
		        cn.MakeInParam("@LevelID", SqlDbType.Int, 4,p.LevelID)
        		};
		        cn.RunProc("sp_Level_Delete",prams);
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
		public DataTable All_Level()
		{
		Database cn = new Database();
		        DataTable dt=  cn.RunExecProc("sp_Level_All").Tables[0];
		        cn.Dispose();
		        return dt;
		}
		public DataTable All_Level(LevelPublic p)
		{
			Database cn = new Database();
			SqlParameter[] prams = new SqlParameter[]
				{
				cn.MakeInParam("@LevelID", SqlDbType.Int, 4,p.LevelID)
				};
			DataTable dt = cn.RunExecProc("sp_Level_TheoID", prams).Tables[0];
			cn.Dispose();
			return dt;
		}
		public DataTable All_Level_TrungThem(LevelPublic p)
		{
			Database cn = new Database();
			SqlParameter[] prams = new SqlParameter[]
				{
				cn.MakeInParam("@LevelCode", SqlDbType.NChar, 10,p.LevelCode)
				};
			DataTable dt = cn.RunExecProc("sp_Level_TheoMa", prams).Tables[0];
			cn.Dispose();
			return dt;
		}
		public DataTable All_Level_TrungSua(LevelPublic p)
		{
			Database cn = new Database();
			SqlParameter[] prams = new SqlParameter[]
				{
				cn.MakeInParam("@LevelCode", SqlDbType.NChar, 10,p.LevelCode),
				cn.MakeInParam("@LevelID", SqlDbType.Int, 4,p.LevelID)
				};
			DataTable dt = cn.RunExecProc("sp_Level_TheoMaID", prams).Tables[0];
			cn.Dispose();
			return dt;
		}
	}
}
