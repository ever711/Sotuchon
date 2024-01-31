 
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
using System.Data;
using System.Data.SqlClient;
using Public;
using System.Reflection;

namespace DAL
{
	public class GamesDAL
	{
		public int Insert_Games(GamesPublic p)
		{
		Database cn = new Database();
		        SqlParameter[] prams = new SqlParameter[]
		        {
		        cn.MakeOutParam("@IDGame_Output", SqlDbType.Int, 4),
				cn.MakeInParam("@NgayChoi", SqlDbType.Int, 4, p.NgayChoi),
				cn.MakeInParam("@MaDai", SqlDbType.NChar, 20, p.MaDai),
				cn.MakeInParam("@Lo", SqlDbType.NChar, 20, p.Lo),
				cn.MakeInParam("@So", SqlDbType.NChar, 20, p.So),
				cn.MakeInParam("@SoTien", SqlDbType.Float, 20, p.SoTien),
				cn.MakeInParam("@TaiKhoan", SqlDbType.NVarChar, 100, p.TaiKhoan)
				};
		        cn.RunProc("sp_Games_Insert",prams);
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
		public int Update_Games(GamesPublic p)
		{
		Database cn = new Database();
		        SqlParameter[] prams = new SqlParameter[]
        		{
		        cn.MakeInParam("@IDGame", SqlDbType.Int, 4, p.IDGame),
		        cn.MakeInParam("@NgayChoi", SqlDbType.Int, 4, p.NgayChoi),
		        cn.MakeInParam("@MaDai", SqlDbType.NChar, 20, p.MaDai),
		        cn.MakeInParam("@Lo", SqlDbType.NChar, 20, p.Lo),
		        cn.MakeInParam("@So", SqlDbType.NChar, 20, p.So),
		        cn.MakeInParam("@SoTien", SqlDbType.Float, 20, p.SoTien),
		        cn.MakeInParam("@TaiKhoan", SqlDbType.NVarChar, 100, p.TaiKhoan)
        		};
		        cn.RunProc("sp_Games_Update",prams);
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
		public int Delete_Games(GamesPublic p)
		{
		Database cn = new Database();
		        SqlParameter[] prams = new SqlParameter[]
        		{
		        cn.MakeInParam("@IDGame", SqlDbType.Int, 4,p.IDGame)
        		};
		        cn.RunProc("sp_Games_Delete",prams);
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
		public DataTable All_Games()
		{
		Database cn = new Database();
		        DataTable dt=  cn.RunExecProc("sp_Games_All").Tables[0];
		        cn.Dispose();
		        return dt;
		}
	}
}
