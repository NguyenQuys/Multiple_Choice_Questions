using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CountDownTimer.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;

namespace CountDownTimer.Controllers
{
    public class TimerController : Controller
    {
        private readonly TimerModel _timerModel;

        public TimerController(TimerModel timerModel)
        {
            _timerModel = timerModel;
        }

        public IActionResult Index()
        {
            // Kiểm tra nếu yêu cầu không phải là Ajax request và không có thời gian kết thúc trong Session.
            if (!HttpContext.Request.Headers["X-Requested-With"].ToString().Equals("XMLHttpRequest", StringComparison.OrdinalIgnoreCase) && string.IsNullOrEmpty(HttpContext.Session.GetString("timeout")))
            {
                // Lưu giá trị thời gian kết thúc vào Session.
                HttpContext.Session.SetString("timeout", _timerModel.Timeout.ToString());
            }
            // Trả về view.
            return View();
        }

        [HttpPost]
        public IActionResult TimerTick()
        {
            var remainingTime = _timerModel.GetRemainingTime(HttpContext.Session);
            if (remainingTime.hours == 0 && remainingTime.minutes == 0 && remainingTime.seconds == 0)
            {
                return Json(new { hours = 0, minutes = 0, seconds = 0 });
            }
            return Json(new { hours = remainingTime.hours, minutes = remainingTime.minutes, seconds = remainingTime.seconds });
        }

    }
}
