 
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
using System.Data;
using System.Data.SqlClient;
using Public;
using System.Reflection;

namespace DAL
{
	public class PhieuDuThuongDAL
	{
		public int Insert_PhieuDuThuong(PhieuDuThuongPublic p)
		{
		Database cn = new Database();
		        SqlParameter[] prams = new SqlParameter[]
		        {
		        cn.MakeOutParam("@IDPhieuDuThuong_Output", SqlDbType.Int, 4),
				cn.MakeInParam("@IDGame", SqlDbType.Int, 4, p.IDGame),
				cn.MakeInParam("@NgayXuat", SqlDbType.Int, 4, p.NgayXuat),
				cn.MakeInParam("@SoPhieu", SqlDbType.NVarChar, 100, p.SoPhieu),
				cn.MakeInParam("@SoDuThuong", SqlDbType.NVarChar, 100, p.SoDuThuong),
				cn.MakeInParam("@KetQua", SqlDbType.NVarChar, 100, p.KetQua),
				cn.MakeInParam("@So", SqlDbType.NChar, 20, p.So),
				cn.MakeInParam("@Lo", SqlDbType.NChar, 20, p.Lo),
				cn.MakeInParam("@GhiChu", SqlDbType.NVarChar, 4000, p.GhiChu),
				cn.MakeInParam("@NguoiXuat", SqlDbType.NVarChar, 100, p.NguoiXuat)
				};
		        cn.RunProc("sp_PhieuDuThuong_Insert",prams);
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
		public int Update_PhieuDuThuong(PhieuDuThuongPublic p)
		{
		Database cn = new Database();
		        SqlParameter[] prams = new SqlParameter[]
        		{
		        cn.MakeInParam("@IDPhieuDuThuong", SqlDbType.Int, 4, p.IDPhieuDuThuong),
		        cn.MakeInParam("@IDGame", SqlDbType.Int, 4, p.IDGame),
		        cn.MakeInParam("@NgayXuat", SqlDbType.Int, 4, p.NgayXuat),
		        cn.MakeInParam("@SoPhieu", SqlDbType.NVarChar, 100, p.SoPhieu),
		        cn.MakeInParam("@SoDuThuong", SqlDbType.NVarChar, 100, p.SoDuThuong),
		        cn.MakeInParam("@KetQua", SqlDbType.NVarChar, 100, p.KetQua),
		        cn.MakeInParam("@So", SqlDbType.NChar, 20, p.So),
		        cn.MakeInParam("@Lo", SqlDbType.NChar, 20, p.Lo),
		        cn.MakeInParam("@GhiChu", SqlDbType.NVarChar, 4000, p.GhiChu),
		        cn.MakeInParam("@NguoiXuat", SqlDbType.NVarChar, 100, p.NguoiXuat)
        		};
		        cn.RunProc("sp_PhieuDuThuong_Update",prams);
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
		public int Delete_PhieuDuThuong(PhieuDuThuongPublic p)
		{
		Database cn = new Database();
		        SqlParameter[] prams = new SqlParameter[]
        		{
		        cn.MakeInParam("@IDPhieuDuThuong", SqlDbType.Int, 4,p.IDPhieuDuThuong)
        		};
		        cn.RunProc("sp_PhieuDuThuong_Delete",prams);
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
		public DataTable All_PhieuDuThuong()
		{
		Database cn = new Database();
		        DataTable dt=  cn.RunExecProc("sp_PhieuDuThuong_All").Tables[0];
		        cn.Dispose();
		        return dt;
		}
	}
}
