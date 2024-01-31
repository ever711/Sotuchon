 
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
	public class TaiKhoanHeThongDAL
	{
		public int Insert_TaiKhoanHeThong(TaiKhoanHeThongPublic p)
		{
		Database cn = new Database();
		        SqlParameter[] prams = new SqlParameter[]
		        {
		        cn.MakeOutParam("@IDTaiKhoan_Output", SqlDbType.Int, 4),
				 cn.MakeInParam("@TaiKhoan", SqlDbType.NVarChar, 100, p.TaiKhoan),
				cn.MakeInParam("@MatKhau", SqlDbType.NVarChar, 100, p.MatKhau),
				cn.MakeInParam("@LevelCode", SqlDbType.NChar, 20, p.LevelCode),
				cn.MakeInParam("@LaQuanLy", SqlDbType.Bit, 1, p.LaQuanLy),
				cn.MakeInParam("@MaDaiLy", SqlDbType.NChar, 20, p.MaDaiLy),
				cn.MakeInParam("@HoTen", SqlDbType.NVarChar, 4000, p.HoTen),
				cn.MakeInParam("@ChietKhau", SqlDbType.NVarChar, 100, p.ChietKhau),
				cn.MakeInParam("@SoDienThoai", SqlDbType.NVarChar, 100, p.SoDienThoai),
				cn.MakeInParam("@DiaChi", SqlDbType.NVarChar, 4000, p.DiaChi),
				cn.MakeInParam("@SoTaiKhoan", SqlDbType.NVarChar, 100, p.SoTaiKhoan),
				cn.MakeInParam("@NganHang", SqlDbType.NVarChar, 4000, p.NganHang),
				cn.MakeInParam("@KichHoat", SqlDbType.Bit, 1, p.KichHoat),
				cn.MakeInParam("@ViTien", SqlDbType.Float, 20, p.ViTien)
				};
		        cn.RunProc("sp_TaiKhoanHeThong_Insert",prams);
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
		public int Update_TaiKhoanHeThong(TaiKhoanHeThongPublic p)
		{
		Database cn = new Database();
		        SqlParameter[] prams = new SqlParameter[]
        		{
		        cn.MakeInParam("@IDTaiKhoan", SqlDbType.Int, 4, p.IDTaiKhoan),
		        cn.MakeInParam("@TaiKhoan", SqlDbType.NVarChar, 100, p.TaiKhoan),
		        cn.MakeInParam("@MatKhau", SqlDbType.NVarChar, 100, p.MatKhau),
		        cn.MakeInParam("@LevelCode", SqlDbType.NChar, 20, p.LevelCode),
		        cn.MakeInParam("@LaQuanLy", SqlDbType.Bit, 1, p.LaQuanLy),
		        cn.MakeInParam("@MaDaiLy", SqlDbType.NChar, 20, p.MaDaiLy),
		        cn.MakeInParam("@HoTen", SqlDbType.NVarChar, 4000, p.HoTen),
		        cn.MakeInParam("@ChietKhau", SqlDbType.NVarChar, 100, p.ChietKhau),
		        cn.MakeInParam("@SoDienThoai", SqlDbType.NVarChar, 100, p.SoDienThoai),
		        cn.MakeInParam("@DiaChi", SqlDbType.NVarChar, 4000, p.DiaChi),
		        cn.MakeInParam("@SoTaiKhoan", SqlDbType.NVarChar, 100, p.SoTaiKhoan),
		        cn.MakeInParam("@NganHang", SqlDbType.NVarChar, 4000, p.NganHang),
		        cn.MakeInParam("@KichHoat", SqlDbType.Bit, 1, p.KichHoat),
		        cn.MakeInParam("@ViTien", SqlDbType.Float, 20, p.ViTien)
        		};
		        cn.RunProc("sp_TaiKhoanHeThong_Update",prams);
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
		public int Delete_TaiKhoanHeThong(TaiKhoanHeThongPublic p)
		{
		Database cn = new Database();
		        SqlParameter[] prams = new SqlParameter[]
        		{
		        cn.MakeInParam("@IDTaiKhoan", SqlDbType.Int, 4,p.IDTaiKhoan)
        		};
		        cn.RunProc("sp_TaiKhoanHeThong_Delete",prams);
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
		public DataTable All_TaiKhoanHeThong()
		{
		Database cn = new Database();
		        DataTable dt=  cn.RunExecProc("sp_TaiKhoanHeThong_All").Tables[0];
		        cn.Dispose();
		        return dt;
		}
	}
}
