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
            // Kiểm tra nếu yêu cầu không phải là Ajax request.
            if (!HttpContext.Request.Headers["X-Requested-With"].ToString().Equals("XMLHttpRequest", StringComparison.OrdinalIgnoreCase))
            {
                // Nếu không phải là Ajax request, lưu giá trị thời gian kết thúc vào session.
                HttpContext.Session.SetString("timeout", _timerModel.Timeout.ToString());
            }
            // Trả về view.
            return View();
        }

        [HttpPost]
        public IActionResult TimerTick()
        {
            var remainingTime = _timerModel.GetRemainingTime(HttpContext.Session);
            return Json(new { hours = remainingTime.hours, minutes = remainingTime.minutes, seconds = remainingTime.seconds });
        }
    }
}
