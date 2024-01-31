using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using XoSoTuChonBenTre.Models;

namespace XoSoTuChonBenTre
{
    public static class Utils
    {
        public static int GetIndexTimeOfDay()
        {
            var dateNow = DateTime.Now;
            var hourNow = ((uint)dateNow.Hour);
            var minuteNow = ((uint)dateNow.Minute);
            if (hourNow == 18 && 10 <= minuteNow && minuteNow <= 59) //North
            {
                return 3;
            }
            else if (hourNow == 17 && 10 <= minuteNow && minuteNow <= 35) //Middle
            {
                return 2;
            }
            else if (hourNow == 16 && 10 <= minuteNow && minuteNow <= 35) //South
            {
                return 1;
            }
            return -1;
        }

        public static bool IsDisabledDaiByTime(int side)
        {
            var timeNow = DateTime.Now;
            var dateNow = DateTime.Today;
            var startTime = new DateTime();
            var endTime = new DateTime();
            switch (side)
            {
                case 1: 
                    startTime = dateNow.Add(new TimeSpan(16, 10, 0)); 
                    endTime  = dateNow.Add(new TimeSpan(18, 10, 0));
                    break;
                case 2: 
                    startTime = dateNow.Add(new TimeSpan(17, 10, 0)); 
                    endTime  = dateNow.Add(new TimeSpan(18, 10, 0));
                    break;
                case 3: 
                    startTime = dateNow.Add(new TimeSpan(18, 10, 0)); 
                    endTime  = dateNow.Add(new TimeSpan(19, 0, 0));
                    break;
                default:
                    break;
            }
            if (timeNow >= startTime && timeNow < endTime) {
                return true;
            }
            return false;

        }

        public static int GetDayOfWeekForSide(int side)
        {
            var dateNow = DateTime.Now;
            var hourNow = ((uint)dateNow.Hour);
            var minuteNow = ((uint)dateNow.Minute);
            var dayOfWeekNow = ((int)dateNow.DayOfWeek);
            if ((hourNow > 18 || (hourNow == 18 && minuteNow >= 10)) && (side == 1 || side == 2)) //South + Middle
            {
                return (dayOfWeekNow + 1) % 7;
            }
            if ((hourNow >= 19) && side == 3) //North
            {
                return (dayOfWeekNow + 1) % 7;
            }
            return dayOfWeekNow;
        }
        public static List<int> GetDayOfWeekFor3Side()
        {
            return new List<int> {
                GetDayOfWeekForSide(1),
                GetDayOfWeekForSide(2),
                GetDayOfWeekForSide(3),
            };
        }

        public static List<bool> GetListDiabledDai()
        {
            return new List<bool> {
                IsDisabledDaiByTime(1),
                IsDisabledDaiByTime(2),
                IsDisabledDaiByTime(3),
            };
        }
        public static void SetSessionModel(TaiKhoanHeThong account)
        {
            var session = new SessionModel(account);
            HttpContext.Current.Session["Account"] = session;
        }

        public static SessionModel GetSessionModel()
        {
            var session = HttpContext.Current.Session;
            if (session != null)
            {
                var sessionTaiKhoan = session["Account"];
                if (sessionTaiKhoan != null && !string.IsNullOrEmpty(sessionTaiKhoan.ToString())) {
                    return (SessionModel)sessionTaiKhoan;
                }
            }
            var cookie = HttpContext.Current.Request.Cookies.Get("IDTaiKhoan");
            if (cookie != null && !string.IsNullOrEmpty(cookie.Value))
            {
                var acc = getCurrentUserFromDB(int.Parse(cookie.Value));
                SetSessionModel(acc);
                return new SessionModel(acc);
            }
            HttpContext.Current.Response.Redirect("logout.aspx", true);
            return null;

        }

        public static void ClearSessionModel()
        {
            HttpContext.Current.Session["Account"] = null;
        }

        private static TaiKhoanHeThong getCurrentUserFromDB(int IDTaiKhoan) {
            using (var context = new SoXoTuChon_BenTreEntities())
            {
                var acc = context.TaiKhoanHeThongs.FirstOrDefault(x => x.IDTaiKhoan == IDTaiKhoan);
                return acc;
            }
        }

        public static bool ValidatePhoneNumber(string phoneNumber) {
            if (string.IsNullOrEmpty(phoneNumber)) return false;
            string pattern = @"(84|0[3|5|7|8|9])+([0-9]{8})\b";

            // Kiểm tra sự trùng khớp
            return Regex.IsMatch(phoneNumber, pattern);
        }

    }
}