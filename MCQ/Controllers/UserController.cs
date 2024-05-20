using MCQ.Models;
using MCQ.ViewModel;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using AspNetCoreHero.ToastNotification.Abstractions;
using System.Text;
using System;

namespace MCQ.Controllers
{
    public class UserController : Controller
    {
        private readonly McqContext data;
        private readonly INotyfService _notify;
        private readonly IEmailSender _emailSender;

        public UserController(McqContext data, INotyfService _notify, IEmailSender emailSender)
        {
            this.data = data;
            this._notify = _notify;
            _emailSender = emailSender;
        }

        [HttpGet]
        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Register(UserViewModel model)
        {
            var kiemTraTrungSDT = data.Users.Where(m => m.PhoneNumber == model.Register.PhoneNumber).ToList();
            var kiemTraTrungEmail = data.Users.Where(m => m.Email == model.Register.Email).ToList();
            var viewModel = new UserViewModel
            {
                Register = model.Register,
            };

            if (kiemTraTrungSDT.Count() > 0)
            {
                TempData["thongBaoTrungSDT"] = "Số điện thoại này đã trùng";
                return View(viewModel);
            }
            else if (kiemTraTrungEmail.Count > 0)
            {
                TempData["thongBaoTrungEmail"] = "Email này đã trùng";
                return View(viewModel);
            }

            if (model.Register != null)
            {
                model.Register.Password = BCrypt.Net.BCrypt.HashPassword(model.Register.Password);
                model.Register.IdRole = 1;
                model.Register.Hide = false;
                data.Users.Add(model.Register);
                await data.SaveChangesAsync();
                return RedirectToAction("LogIn");
            }
            return View(viewModel);
        }

        [HttpGet]
        public async Task<IActionResult> LogIn()
        {
            TempData["numberOfFailedLoginAttempts"] = 0;
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> LogIn(UserViewModel model)
        {
            var viewModel = new UserViewModel
            {
                Register = model.Register,
            };

            if (model.Register != null)
            {
                var user = await data.Users.FirstOrDefaultAsync(u => u.IdUser == model.Register.IdUser);
                if (user != null)
                {
                    // Kiểm tra nếu Hide bằng true thì sẽ không cho đăng nhập vào 
                    if (user.Hide == true)
                    {
                        ViewBag.ErrorMessage = "Tài khoản của bạn đã bị lock. Vui lòng liên hệ với bên quản trị để giải quyết!";
                        return View(viewModel);
                    }
                    // Kiểm tra nếu tài khoản bị lock
                    if (user.LockTime != null && user.LockTime.Value > DateTime.Now.AddSeconds(-5))
                    {
                        ViewBag.ErrorMessage = "Tài khoản của bạn đã bị lock. Vui lòng thử lại sau!";
                        return View(viewModel);
                    }

                    // Kiểm tra mật khẩu
                    if (BCrypt.Net.BCrypt.Verify(model.Register.Password, user.Password))
                    {
                        var claims = new List<Claim>
                {
                    new Claim(ClaimTypes.Name, user.IdUser),
                    new Claim(ClaimTypes.Role, user.IdRole.ToString()),
                };

                        var claimsIdentity = new ClaimsIdentity(
                            claims, CookieAuthenticationDefaults.AuthenticationScheme);

                        var authProperties = new AuthenticationProperties
                        {
                        };

                        await HttpContext.SignInAsync(
                            CookieAuthenticationDefaults.AuthenticationScheme,
                            new ClaimsPrincipal(claimsIdentity),
                            authProperties);

                        // Đăng nhập thành công, đặt lại số lần nhập sai về 0
                        user.FailedLoginAttempts = 0;
                        // Cập nhật người dùng trong cơ sở dữ liệu
                        data.Entry(user).State = EntityState.Modified;
                        await data.SaveChangesAsync();

                        return RedirectToAction("Index", "Home");
                    }
                    else
                    {
                        user.FailedLoginAttempts++; // Tăng số lần nhập sai

                        // Kiểm tra số lần nhập sai và khóa tài khoản nếu cần
                        if (user.FailedLoginAttempts >= 5)
                        {
                            user.LockTime = DateTime.Now;
                        }
                        // Nếu đã qua thời gian khóa, đặt lại số lần nhập sai về 0
                        //if (user.LockTime != null && DateTime.Now > user.LockTime.Value.AddSeconds(5))
                        //{
                        //    user.FailedLoginAttempts = 0;
                        //    user.LockTime = null; // Đặt lại thời gian khóa về null
                        //}
                        // Cập nhật người dùng trong cơ sở dữ liệu
                        TempData["numberOfFailedLoginAttempts"] = user.FailedLoginAttempts;

                        data.Entry(user).State = EntityState.Modified;
                        await data.SaveChangesAsync();

                        ViewBag.ErrorMessage = "Tên đăng nhập hoặc mật khẩu không đúng.";
                        return View();
                    }
                }
                else
                {
                    ViewBag.ErrorMessage = "Tên đăng nhập hoặc mật khẩu không đúng.";
                    return View();
                }
            }
            return View(viewModel);
        }

        public async Task<IActionResult> LogOut()
		{
			await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
			return RedirectToAction("Index", "Home");
		}

        public IActionResult Info()
        {
            User user = new User();
            if (User.Identity.IsAuthenticated)
            {
                string username = User.Identity.Name;
                if (username != null)
                {
                    user = data.Users.FirstOrDefault(m => m.IdUser == username);
                }
            }
            return View(user);
        }

        [HttpGet]
        public IActionResult EditInfo(string idUser)
        {
            var model = data.Users.FirstOrDefault(m => m.IdUser.Equals(idUser));
            return View(model);
        }

        [HttpPost]
        public IActionResult EditInfo(User model)
        {
            data.Update(model);
            data.SaveChanges();
            _notify.Success("Cập nhật thông tin thành công");
            return RedirectToAction("Info");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ChangePassword(string oldPassword, string newPassword, string confirmPassword)
        {
            User user = new User();
            if (User.Identity.IsAuthenticated)
            {
                string username = User.Identity.Name;
                if (username != null)
                {
                    user = data.Users.FirstOrDefault(m => m.IdUser == username);
                }
            }
            if (!BCrypt.Net.BCrypt.Verify(oldPassword, user.Password))
            {
                _notify.Error("Mật khẩu cũ không đúng.");
                return View("ChangePassword",user);
            }

            if (newPassword != confirmPassword)
            {
                _notify.Error("Mật khẩu mới và mật khẩu xác nhận không khớp");
                return View("ChangePassword",user);
            }

            user.Password = BCrypt.Net.BCrypt.HashPassword(newPassword);
            data.Update(user);
            data.SaveChanges();
            _notify.Success("Cập nhật mật khẩu thành công");
            return RedirectToAction("Info");
        }

        [HttpGet]
        public IActionResult ChangePassword(string idUser)
        {
            var model = data.Users.FirstOrDefault(m => m.IdUser.Equals(idUser));
            return View(model);
        }

        [HttpGet]
        public IActionResult ForgotPassword()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> ForgotPassword(string email)
        {
            var model = await data.Users.FirstOrDefaultAsync(m=>m.Email.Equals(email));
            if (model == null)
            {
                _notify.Error("Chúng tôi không tìm thấy tài khoản Email này");
                return View();
            }
            else
            {
                string newPassword = GenerateRamdomString();
                model.Password = BCrypt.Net.BCrypt.HashPassword(newPassword);
                data.Users.Update(model);
                data.SaveChangesAsync();
                _emailSender.SendEmailAsync(email, "Khôi phục tài khoản Multiple Choice Questions","Chúng tôi đã Reset mật khẩu lại cho bạn,mật khẩu hiện tại của bạn là " + newPassword + ". Bạn nên đổi lại mật khẩu mới khi đã đăng nhập lại.");
                _notify.Success("Chúng tôi đã gửi Email khôi phục cho bạn. Vui lòng kiểm tra Email");
                return View();
            }
            return View();
        }

        Random random = new Random();
        private string GenerateRamdomString()
        {
            string LowercaseLetters = "abcdefghijklmnopqrstuvwxyz";
            string UppercaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            string Numbers = "0123456789";

            StringBuilder stringBuilder = new StringBuilder();
            // Thêm 1 ký tự chữ thường ngẫu nhiên
            stringBuilder.Append(LowercaseLetters[random.Next(0, LowercaseLetters.Length)]);

            // Thêm 1 ký tự chữ hoa ngẫu nhiên
            stringBuilder.Append(UppercaseLetters[random.Next(0, UppercaseLetters.Length)]);

            // Thêm 6 ký tự số ngẫu nhiên
            for (int i = 0; i < 6; i++)
            {
                stringBuilder.Append(Numbers[random.Next(0, Numbers.Length)]);
            }

            // Trộn chuỗi để tạo chuỗi ngẫu nhiên
            return Shuffle(stringBuilder.ToString());
        }

        private string Shuffle(string str) 
        {
            char[] array = str.ToCharArray();
            int n = array.Length;
            while (n > 1)
            {
                n--;
                int k = random.Next(n + 1);
                char value = array[k];
                array[k] = array[n];
                array[n] = value;
            }
            return new string(array);
        }
    }
}
