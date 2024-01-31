 
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
	public class NapTienDAL
	{
		public int Insert_NapTien(NapTienPublic p)
		{
		Database cn = new Database();
		        SqlParameter[] prams = new SqlParameter[]
		        {
		        cn.MakeOutParam("@IDNap_Output", SqlDbType.Int, 4),
				 cn.MakeInParam("@NgayNap", SqlDbType.Int, 4, p.NgayNap),
				cn.MakeInParam("@TaiKhoan", SqlDbType.NVarChar, 100, p.TaiKhoan),
				cn.MakeInParam("@SoTien", SqlDbType.Float, 20, p.SoTien),
				cn.MakeInParam("@NganHang", SqlDbType.NVarChar, 4000, p.NganHang),
				cn.MakeInParam("@XacNhan", SqlDbType.Bit, 1, p.XacNhan),
				cn.MakeInParam("@NguoiXacNhan", SqlDbType.NVarChar, 100, p.NguoiXacNhan),
				cn.MakeInParam("@NgayXacNhan", SqlDbType.Int, 4, p.NgayXacNhan),
				cn.MakeInParam("@HinhDinhKem", SqlDbType.NVarChar, 4000, p.HinhDinhKem)
				};
		        cn.RunProc("sp_NapTien_Insert",prams);
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
		public int Update_NapTien(NapTienPublic p)
		{
		Database cn = new Database();
		        SqlParameter[] prams = new SqlParameter[]
        		{
		        cn.MakeInParam("@IDNap", SqlDbType.Int, 4, p.IDNap),
		        cn.MakeInParam("@NgayNap", SqlDbType.Int, 4, p.NgayNap),
		        cn.MakeInParam("@TaiKhoan", SqlDbType.NVarChar, 100, p.TaiKhoan),
		        cn.MakeInParam("@SoTien", SqlDbType.Float, 20, p.SoTien),
		        cn.MakeInParam("@NganHang", SqlDbType.NVarChar, 4000, p.NganHang),
		        cn.MakeInParam("@XacNhan", SqlDbType.Bit, 1, p.XacNhan),
		        cn.MakeInParam("@NguoiXacNhan", SqlDbType.NVarChar, 100, p.NguoiXacNhan),
		        cn.MakeInParam("@NgayXacNhan", SqlDbType.Int, 4, p.NgayXacNhan),
		        cn.MakeInParam("@HinhDinhKem", SqlDbType.NVarChar, 4000, p.HinhDinhKem)
        		};
		        cn.RunProc("sp_NapTien_Update",prams);
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
		public int Delete_NapTien(NapTienPublic p)
		{
		Database cn = new Database();
		        SqlParameter[] prams = new SqlParameter[]
        		{
		        cn.MakeInParam("@IDNap", SqlDbType.Int, 4,p.IDNap)
        		};
		        cn.RunProc("sp_NapTien_Delete",prams);
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
		public DataTable All_NapTien()
		{
		Database cn = new Database();
		        DataTable dt=  cn.RunExecProc("sp_NapTien_All").Tables[0];
		        cn.Dispose();
		        return dt;
		}
	}
}
