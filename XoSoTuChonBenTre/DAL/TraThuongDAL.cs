 
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
using System.Data;
using System.Data.SqlClient;
using Public;
using System.Reflection;

namespace DAL
{
	public class TraThuongDAL
	{
		public int Insert_TraThuong(TraThuongPublic p)
		{
		Database cn = new Database();
		        SqlParameter[] prams = new SqlParameter[]
		        {
		        cn.MakeOutParam("@IDTraThuong_Output", SqlDbType.Int, 4),
				 cn.MakeInParam("@NgayTraThuong", SqlDbType.Int, 4, p.NgayTraThuong),
				cn.MakeInParam("@IDPhieuDuThuong", SqlDbType.Int, 4, p.IDPhieuDuThuong),
				cn.MakeInParam("@SoPhieu", SqlDbType.NVarChar, 100, p.SoPhieu),
				cn.MakeInParam("@SoDuThuong", SqlDbType.NVarChar, 100, p.SoDuThuong),
				cn.MakeInParam("@So", SqlDbType.NChar, 20, p.So),
				cn.MakeInParam("@Lo", SqlDbType.NChar, 20, p.Lo),
				cn.MakeInParam("@NguoiTra", SqlDbType.NVarChar, 100, p.NguoiTra)
				};
		        cn.RunProc("sp_TraThuong_Insert",prams);
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
		public int Update_TraThuong(TraThuongPublic p)
		{
		Database cn = new Database();
		        SqlParameter[] prams = new SqlParameter[]
        		{
		        cn.MakeInParam("@IDTraThuong", SqlDbType.Int, 4, p.IDTraThuong),
		        cn.MakeInParam("@NgayTraThuong", SqlDbType.Int, 4, p.NgayTraThuong),
		        cn.MakeInParam("@IDPhieuDuThuong", SqlDbType.Int, 4, p.IDPhieuDuThuong),
		        cn.MakeInParam("@SoPhieu", SqlDbType.NVarChar, 100, p.SoPhieu),
		        cn.MakeInParam("@SoDuThuong", SqlDbType.NVarChar, 100, p.SoDuThuong),
		        cn.MakeInParam("@So", SqlDbType.NChar, 20, p.So),
		        cn.MakeInParam("@Lo", SqlDbType.NChar, 20, p.Lo),
		        cn.MakeInParam("@NguoiTra", SqlDbType.NVarChar, 100, p.NguoiTra)
        		};
		        cn.RunProc("sp_TraThuong_Update",prams);
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
		public int Delete_TraThuong(TraThuongPublic p)
		{
		Database cn = new Database();
		        SqlParameter[] prams = new SqlParameter[]
        		{
		        cn.MakeInParam("@IDTraThuong", SqlDbType.Int, 4,p.IDTraThuong)
        		};
		        cn.RunProc("sp_TraThuong_Delete",prams);
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
		public DataTable All_TraThuong()
		{
		Database cn = new Database();
		        DataTable dt=  cn.RunExecProc("sp_TraThuong_All").Tables[0];
		        cn.Dispose();
		        return dt;
		}
	}
}
