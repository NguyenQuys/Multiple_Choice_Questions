using AspNetCoreHero.ToastNotification;
using MCQ;
using MCQ.Filters;
using MCQ.Models;
using MCQ.Models.Other;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.EntityFrameworkCore;
using System.Configuration;

var builder = WebApplication.CreateBuilder(args);

var configuration = builder.Configuration;

//-------Phân quyền------------
builder.Services.AddScoped<AdminAuthorizationFilter>();
//--------------------------------

//Gui email
builder.Services.Configure<EmailSetting>(configuration.GetSection("EmailSettings"));
builder.Services.AddTransient<IEmailSender, EmailSender>();
//

// Connect to SQL Server
builder.Services.AddDbContext<McqContext>(options =>
options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

//--------Toastr-------
builder.Services.AddNotyf(config =>
{
    config.DurationInSeconds = 5;
    config.IsDismissable = true;
    config.Position = NotyfPosition.BottomRight;
});
//-----------------------


// Add services to the container.
builder.Services.AddControllersWithViews();

builder.Services.AddSession(options =>
{
    // Set a short timeout for easy testing.
    options.IdleTimeout = TimeSpan.FromMinutes(30);
    options.Cookie.HttpOnly = true;
    // Make the session cookie essential
    options.Cookie.IsEssential = true;
});



builder.Services.AddScoped<TimerModel>(); // Đăng ký TimerModel ở đây


//---------- Login Logout
builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme).
 AddCookie(options =>
 {
     options.Cookie.Name = "MultipleChoiceQuestionsCookie";
     options.LoginPath = "/User/Login";
 });
//-----------------------------------------------------------

builder.Services.AddSession(); // Thêm dịch vụ session


var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();


app.UseRouting();

//---------- Login Logout
app.UseAuthentication();
//--------------------------------------

app.UseAuthorization();

// Thêm session vào pipeline
app.UseSession();

app.UseEndpoints(endpoints =>
{
    
    endpoints.MapControllerRoute(
        name: "default",
        pattern: "{controller=Home}/{action=Index}/{id?}");

    endpoints.MapControllerRoute(
		name: "dang-nhap",
		pattern: "dang-nhap",
		defaults: new { controller = "User", action = "LogIn" });

	endpoints.MapControllerRoute(
        name: "dang-ky",
        pattern: "dang-ky",
        defaults: new { controller = "User", action = "Register" });

	endpoints.MapControllerRoute(
        name: "dang-xuat",
        pattern: "dang-xuat",
        defaults: new { controller = "User", action = "LogOut" });

    endpoints.MapControllerRoute(
        name: "lien-he",
        pattern: "lien-he",
        defaults: new { controller = "Home", action = "AddContact" });

    endpoints.MapControllerRoute(
        name: "lich-su-kiem-tra",
        pattern: "lich-su-kiem-tra",
        defaults: new { controller = "Home", action = "ExamHistory" });

    // Area 
    //endpoints.MapControllerRoute(
    //       name: "areas",
    //       pattern: "{area:exists}/{controller=Home}/{action=Index}/{id?}");
    //
    //-------------Teacher-----------

    endpoints.MapControllerRoute(
          name: "Teacher",
          pattern: "{area:exists}/{controller=TeacherHome}/{action=Index}/{id?}");

    //endpoints.MapControllerRoute(
    //    name: "danh-sach-bai-kiem-tra",
    //    pattern: "{area:exists}/danh-sach-bai-kiem-tra", // chỉ định khu vực và tên điều khiển trong pattern
    //    defaults: new { area = "Teacher", controller = "Teacherhome", action = "SubjectList" });

    //------------User--------------
    endpoints.MapControllerRoute(
        name: "thong-tin-ca-nhan",
        pattern: "thong-tin-ca-nhan",
        defaults: new { controller = "User", action = "Info" });

    endpoints.MapControllerRoute(
        name: "chinh-sua-thong-tin",
        pattern: "chinh-sua-thong-tin",
        defaults: new { controller = "User", action = "EditInfo" });

});

app.Run();
