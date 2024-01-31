 
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
	public class RutTienDAL
	{
		public int Insert_RutTien(RutTienPublic p)
		{
		Database cn = new Database();
		        SqlParameter[] prams = new SqlParameter[]
		        {
		        cn.MakeOutParam("@IDRut_Output", SqlDbType.Int, 4),
				cn.MakeInParam("@NgayRut", SqlDbType.Int, 4, p.NgayRut),
				cn.MakeInParam("@TaiKhoan", SqlDbType.NVarChar, 100, p.TaiKhoan),
				cn.MakeInParam("@SoTien", SqlDbType.Float, 20, p.SoTien),
				cn.MakeInParam("@NganHang", SqlDbType.NVarChar, 4000, p.NganHang),
				cn.MakeInParam("@XacNhan", SqlDbType.Bit, 1, p.XacNhan),
				cn.MakeInParam("@NguoiXacNhan", SqlDbType.NVarChar, 100, p.NguoiXacNhan),
				cn.MakeInParam("@NgayXacNhan", SqlDbType.Int, 4, p.NgayXacNhan),
				cn.MakeInParam("@HinhDinhKem", SqlDbType.NChar, 20, p.HinhDinhKem)
				};
		        cn.RunProc("sp_RutTien_Insert",prams);
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
		public int Update_RutTien(RutTienPublic p)
		{
		Database cn = new Database();
		        SqlParameter[] prams = new SqlParameter[]
        		{
		        cn.MakeInParam("@IDRut", SqlDbType.Int, 4, p.IDRut),
		        cn.MakeInParam("@NgayRut", SqlDbType.Int, 4, p.NgayRut),
		        cn.MakeInParam("@TaiKhoan", SqlDbType.NVarChar, 100, p.TaiKhoan),
		        cn.MakeInParam("@SoTien", SqlDbType.Float, 20, p.SoTien),
		        cn.MakeInParam("@NganHang", SqlDbType.NVarChar, 4000, p.NganHang),
		        cn.MakeInParam("@XacNhan", SqlDbType.Bit, 1, p.XacNhan),
		        cn.MakeInParam("@NguoiXacNhan", SqlDbType.NVarChar, 100, p.NguoiXacNhan),
		        cn.MakeInParam("@NgayXacNhan", SqlDbType.Int, 4, p.NgayXacNhan),
		        cn.MakeInParam("@HinhDinhKem", SqlDbType.NChar, 20, p.HinhDinhKem)
        		};
		        cn.RunProc("sp_RutTien_Update",prams);
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
		public int Delete_RutTien(RutTienPublic p)
		{
		Database cn = new Database();
		        SqlParameter[] prams = new SqlParameter[]
        		{
		        cn.MakeInParam("@IDRut", SqlDbType.Int, 4,p.IDRut)
        		};
		        cn.RunProc("sp_RutTien_Delete",prams);
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
		public DataTable All_RutTien()
		{
		Database cn = new Database();
		        DataTable dt=  cn.RunExecProc("sp_RutTien_All").Tables[0];
		        cn.Dispose();
		        return dt;
		}
	}
}
