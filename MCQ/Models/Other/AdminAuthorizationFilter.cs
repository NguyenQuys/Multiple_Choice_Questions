using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System.Security.Claims;

namespace MCQ.Filters
{
    public class AdminAuthorizationFilter : IAuthorizationFilter
    {
        public void OnAuthorization(AuthorizationFilterContext context)
        {
            if (!context.HttpContext.User.Identity.IsAuthenticated)
            {
                // Chưa đăng nhập, chuyển hướng đến trang đăng nhập
                context.Result = new RedirectToActionResult("LogIn", "User", null);
                return;
            }

            // Kiểm tra quyền của người dùng
            var permissionClaim = context.HttpContext.User.FindFirst(ClaimTypes.Role);
            if (permissionClaim != null)
            {
                // Lấy giá trị quyền của người dùng
                var permissionValue = permissionClaim.Value;

                // Kiểm tra quyền và xử lý phù hợp
                if (permissionValue == "2")
                {
                    // Nếu người dùng có quyền 1 (admin), không cho phép truy cập vào quyền 2 (tourguider)
                    if (context.HttpContext.Request.Path.StartsWithSegments("/Admin"))
                    {
                        context.Result = new StatusCodeResult(403); // Chuyển hướng đến trang lỗi 403
                        return;
                    }
                }
                else if (permissionValue == "3")
                {
                    // Nếu người dùng có quyền 2 (tourguider), không cho phép truy cập vào quyền 1 (admin)
                    if (context.HttpContext.Request.Path.StartsWithSegments("/Teacher"))
                    {
                        context.Result = new StatusCodeResult(403); // Chuyển hướng đến trang lỗi 403
                        return;
                    }
                }
                else if (permissionValue == "1")
                {
                    if (context.HttpContext.Request.Path.StartsWithSegments("/Admin") || context.HttpContext.Request.Path.StartsWithSegments("/Teacher"))
                    {
                        context.Result = new StatusCodeResult(403); // Chuyển hướng đến trang lỗi 403
                        return;
                    }
                }
            }
        }

    }
}
