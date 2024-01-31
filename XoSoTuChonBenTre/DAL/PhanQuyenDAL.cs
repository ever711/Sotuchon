 
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
using System.Data;
using System.Data.SqlClient;
using Public;
using System.Reflection;

namespace DAL
{
	public class PhanQuyenDAL
	{
		public int Insert_PhanQuyen(PhanQuyenPublic p)
		{
		Database cn = new Database();
		        SqlParameter[] prams = new SqlParameter[]
		        {
		        cn.MakeOutParam("@AuthorDetailsID_Output", SqlDbType.Int, 4),
				cn.MakeInParam("@TaiKhoan", SqlDbType.NVarChar, 100, p.TaiKhoan),
				cn.MakeInParam("@menu_id", SqlDbType.Int, 4, p.menu_id),
				cn.MakeInParam("@them", SqlDbType.Bit, 1, p.them),
				cn.MakeInParam("@sua", SqlDbType.Bit, 1, p.sua),
				cn.MakeInParam("@xoa", SqlDbType.Bit, 1, p.xoa),
				cn.MakeInParam("@inan", SqlDbType.Bit, 1, p.inan)
				};
		        cn.RunProc("sp_PhanQuyen_Insert",prams);
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
		public int Update_PhanQuyen(PhanQuyenPublic p)
		{
		Database cn = new Database();
		        SqlParameter[] prams = new SqlParameter[]
        		{
		        cn.MakeInParam("@AuthorDetailsID", SqlDbType.Int, 4, p.AuthorDetailsID),
		        cn.MakeInParam("@TaiKhoan", SqlDbType.NVarChar, 100, p.TaiKhoan),
		        cn.MakeInParam("@menu_id", SqlDbType.Int, 4, p.menu_id),
		        cn.MakeInParam("@them", SqlDbType.Bit, 1, p.them),
		        cn.MakeInParam("@sua", SqlDbType.Bit, 1, p.sua),
		        cn.MakeInParam("@xoa", SqlDbType.Bit, 1, p.xoa),
		        cn.MakeInParam("@inan", SqlDbType.Bit, 1, p.inan)
        		};
		        cn.RunProc("sp_PhanQuyen_Update",prams);
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
		public int Delete_PhanQuyen(PhanQuyenPublic p)
		{
		Database cn = new Database();
		        SqlParameter[] prams = new SqlParameter[]
        		{
		        cn.MakeInParam("@AuthorDetailsID", SqlDbType.Int, 4,p.AuthorDetailsID)
        		};
		        cn.RunProc("sp_PhanQuyen_Delete",prams);
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
		public DataTable All_PhanQuyen()
		{
		Database cn = new Database();
		        DataTable dt=  cn.RunExecProc("sp_PhanQuyen_All").Tables[0];
		        cn.Dispose();
		        return dt;
		}
	}
}
