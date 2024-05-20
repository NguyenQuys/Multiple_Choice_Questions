using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MCQ.Models;
using Microsoft.EntityFrameworkCore;
using MCQ.Filters;
using AspNetCoreHero.ToastNotification.Abstractions;

namespace MCQ.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Route("Admin")]
    [ServiceFilter(typeof(AdminAuthorizationFilter))]
    public class AdminHomeController : Controller
    {
        private readonly McqContext data;
        private readonly INotyfService _notify;
        public AdminHomeController(McqContext data, INotyfService _notify)
        {
            this.data = data;
            this._notify = _notify;
        }

        //--------------Admin Area Starts---------------
        [Route("")]
        [Route("Index")]
        public ActionResult Index()
        {
            return View();
        }

        //---------------------------------------------

        // ------------------- Teacher Area Starts ---------------------
        [Route("TeacherList")]
        public async Task<ActionResult> TeacherList()
        {
            var teacherList = await data.Users.Where(m=>m.IdRole == 2).ToListAsync();
            return View(teacherList);
        }

        [Route("AddTeacher")]
        [HttpGet]
        public IActionResult AddTeacher()
        {
            return View();
        }

        [Route("AddTeacher")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult AddTeacher(User teacher)
        {
            teacher.Password = BCrypt.Net.BCrypt.HashPassword(teacher.Password);
            data.Add(teacher);
            data.SaveChanges();
            _notify.Success("Thêm giảng viên thành công");
            return RedirectToAction("TeacherList");
        }

        [Route("DeleteTeacher")]
        [HttpPost]
        public async Task<IActionResult> DeleteTeacher(string id)
        {
            var model = await data.Users.FindAsync(id);
            data.Remove(model);
            data.SaveChangesAsync();
            return Ok(new { RedirectToAction = Url.Action("TeacherList") });
        }

        [Route("UpdateTeacher")]
        [HttpGet]
        public IActionResult UpdateTeacher(string id)
        {
            var model = data.Users.Find(id);
            return View(model);
        }

        [Route("UpdateTeacher")]
        [HttpPost]
        public IActionResult UpdateTeacher(User teacher)
        {
            data.Update(teacher);
            data.SaveChanges();
            return RedirectToAction("TeacherList");
        }

        [Route("BlockTeacher")]
        [HttpPost]
        public IActionResult BlockTeacher(string id, bool value)
        {
            var teacher = data.Users.Find(id);
            teacher.Hide = value;
            data.Update(teacher);
            
            data.SaveChanges();
            return RedirectToAction("TeacherList");
        }


        // -------------- Teacher Area Ends --------------------

        // --------------- Student Area Starts -----------------
        [Route("StudentList")]
        public ActionResult StudentList()
        {
            var teacherList = data.Users.Where(m => m.IdRole == 1).ToList();
            return View(teacherList);
        }

        [Route("AddStudent")]
        [HttpGet]
        public IActionResult AddStudent()
        {
            return View();
        }

        [Route("AddStudent")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult AddStudent(User student)
        {
            student.Password = BCrypt.Net.BCrypt.HashPassword(student.Password);
            data.Add(student);
            data.SaveChanges();
            _notify.Success("Thêm sinh viên thành công");
            return RedirectToAction("StudentList");
        }

        [Route("DeleteStudent")]
        [HttpPost]
        public async Task<IActionResult> DeleteStudent(string id)
        {
            var model = await data.Users.FindAsync(id);
            data.Remove(model);
            data.SaveChangesAsync();
            return Ok(new { RedirectToAction = Url.Action("StudentList") });
        }

        [Route("UpdateStudent")]
        [HttpGet]
        public IActionResult UpdateStudent(string id)
        {
            var model = data.Users.Find(id);
            return View(model);
        }

        [Route("UpdateStudent")]
        [HttpPost]
        public IActionResult UpdateStudent(User student)
        {
            data.Update(student);
            data.SaveChanges();
            _notify.Success("Chỉnh sửa thông tin thành công");
            return RedirectToAction("StudentList");
        }

        [Route("BlockStudent")]
        [HttpPost]
        public IActionResult BlockStudent(string id, bool value)
        {
            var student = data.Users.Find(id);
            student.Hide = value;
            data.Update(student);
            data.SaveChanges();
            return RedirectToAction("StudentList");
        }
    }
}
