using MCQ.Areas.Teacher.ViewModel;
using MCQ.Models;
using Microsoft.AspNetCore.Mvc;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Drawing;
using MCQ.Models.Other;
using Humanizer;
using MCQ.Filters;
using Microsoft.EntityFrameworkCore;
using MCQ.ViewModel;
using AspNetCoreHero.ToastNotification.Abstractions;

namespace MCQ.Areas.Teacher.Controllers
{
    [Area("Teacher")]
    [Route("Teacher")]
    [ServiceFilter(typeof(AdminAuthorizationFilter))]
    public class TeacherHomeController : Controller
    {
        private readonly McqContext data;
        private readonly INotyfService _notify;
        public TeacherHomeController(McqContext data, INotyfService _notify)
        {
            this.data = data;
            this._notify = _notify;
        }
        [Route("")]
        [Route("Index")]
        public IActionResult Index()
        {
            return View();
        }

        [Route("SubjectList")]
        public IActionResult SubjectList()
        {
            var user = new User();
            if (User.Identity.IsAuthenticated)
            {
                string idUser = User.Identity.Name;
                if (idUser != null)
                {
                    user = data.Users.FirstOrDefault(m => m.IdUser == idUser);
                }
            }
            var subjectList = data.Subjects.Where(m => m.IdUser.Equals(user.IdUser)).ToList();
            return View(subjectList);
        }


        [Route("AddSubject")]
        [HttpGet]
        public IActionResult AddSubject()
        {
            return View();
        }

        [Route("AddSubject")]
        [HttpPost]
        public IActionResult AddSubject(Subject subject)
        {
            var user = new User();
            if (User.Identity.IsAuthenticated)
            {
                string idUser = User.Identity.Name;
                if (idUser != null)
                {
                    user = data.Users.FirstOrDefault(m => m.IdUser == idUser);
                }
            }

            TempData["IdSubject"] = subject.IdSubject;
            TempData["AmountLevel1"] = subject.AmountQuestionLevel1;
            TempData["AmountLevel2"] = subject.AmountQuestionLevel2;
            TempData["AmountLevel3"] = subject.AmountQuestionLevel3;
            subject.IdUser = user.IdUser;
            data.Add(subject);

            // Tạp thêm Statistic
            var _idStatisticCount = data.Statistics.Count();
            Statistic statistic = new Statistic();
            statistic.IdStatistic = (++_idStatisticCount).ToString();
            statistic.IdSubject = subject.IdSubject;
            statistic.IdUser = user.IdUser;
            data.Add(statistic);
            data.SaveChanges();
            return RedirectToAction("AddQuestion");
        }

        [Route("AddQuestion")]
        [HttpGet]
        public IActionResult AddQuestion()
        {
            return View();
        }

        [Route("AddQuestion")]
        [HttpPost]
        public IActionResult AddQuestion(QuestionViewModel viewModel)
        {
            int count = 0;
            int _IdQuestionCounter = data.Questions.Count();
            int _IdAnswerCounter = data.Answers.Count();
            foreach (var question in viewModel.questionsList)
            {
                question.IdSubject = (string)TempData["IdSubject"];
                question.IdQuestion = ++_IdQuestionCounter;
                TextDTO textdto = new TextDTO();
                textdto.Text = question.Title;
                IActionResult result = GetText(textdto);
                var jsonResult = result as JsonResult;
                dynamic temp = jsonResult.Value;
                string fileName = temp.fileName; // lấy tên file
                question.LinkImage = fileName;

                for (int i = count; i < viewModel.answersList.Count; i++)
                {
                    var answer = viewModel.answersList[i];
                    answer.IdAnswer = (++_IdAnswerCounter);
                    answer.IdQuestion = question.IdQuestion;
                    data.Add(answer);
                    count++;

                    if (count % 4 == 0)
                    {
                        break;
                    }
                }

                data.Add(question);
                continue;

            }
            data.SaveChanges();
            _notify.Success("Thêm bài kiểm tra thành công");
            return RedirectToAction("SubjectList");
        }

        [HttpPost]
        public IActionResult GetText([FromBody] TextDTO dto)
        {
            // Lấy văn bản từ dto
            string text = dto.Text;

            // Tạo hình ảnh từ văn bản
            using (Bitmap bitmap = new Bitmap(1, 1))
            {
                using (Graphics graphics = Graphics.FromImage(bitmap))
                {
                    Font font = new Font("Arial", 25, FontStyle.Regular, GraphicsUnit.Pixel);
                    SizeF textSize = graphics.MeasureString(text, font);
                    int width = (int)textSize.Width;
                    int height = (int)textSize.Height;
                    bitmap.Dispose();

                    // Tạo hình ảnh mới có kích thước dựa trên kích thước của văn bản
                    using (Bitmap newBitmap = new Bitmap(width, height))
                    {
                        using (Graphics newGraphics = Graphics.FromImage(newBitmap))
                        {
                            newGraphics.Clear(Color.White);
                            newGraphics.SmoothingMode = SmoothingMode.AntiAlias;
                            newGraphics.TextRenderingHint = System.Drawing.Text.TextRenderingHint.AntiAlias;
                            newGraphics.DrawString(text, font, Brushes.Black, new PointF(0, 0)); // Thay đổi màu thành đỏ

                            // Tạo tên tập tin ảnh dựa trên văn bản hoặc một quy tắc nào đó
                            string fileName = GenerateFileName(text);
                            string imagePath = Path.Combine("images", fileName);
                            string physicalPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", imagePath);

                            // Lưu hình ảnh vào thư mục wwwroot/images
                            newBitmap.Save(physicalPath, ImageFormat.Jpeg);

                            // Trả về tên tập tin ảnh
                            return Json(new { fileName });
                        }
                    }
                }
            }
        }

        // Phương thức để tạo tên tập tin ảnh dựa trên văn bản hoặc một quy tắc nào đó
        private string GenerateFileName(string text)
        {
            // Ví dụ đơn giản: sử dụng mã số thứ tự của ảnh được tạo ra
            string fileName = Guid.NewGuid().ToString() + ".jpg";
            return fileName;
        }

        [Route("DetailQuestion")]
        public IActionResult DetailSubject(string idSubject)
        {
            
            var listQuestion = data.Questions.Where(m => m.IdSubject.Equals(idSubject)).ToList();
            var listAnswer = data.Answers.Where(m => listQuestion.Select(n => n.IdQuestion).Contains(m.IdQuestion)).ToList();
            var questionLevel1 = data.Questions.Where(m => m.Level == 1 && m.IdSubject.Equals(idSubject)).ToList();
            var questionLevel2 = data.Questions.Where(m => m.Level == 2 && m.IdSubject.Equals(idSubject)).ToList();
            var questionLevel3 = data.Questions.Where(m => m.Level == 3 && m.IdSubject.Equals(idSubject)).ToList();
            var viewModal = new DetailViewModel
            {
                IdSubject = idSubject,
                listQuestion = listQuestion,
                ListAnswer = listAnswer,
                questionLevel1 = questionLevel1,
                questionLevel2 = questionLevel2,
                questionLevel3 = questionLevel3
            };
            return View(viewModal);
        }

        [HttpGet]
        [Route("EditSubject")]
        public IActionResult EditSubject(string idSubject)
        {
            if(data.Results.Any(m=>m.Idsubject.Equals(idSubject)))
            {
                _notify.Error("Không thể chỉnh sửa môn học này vì môn này đã được kiểm tra!!");
                return RedirectToAction("DetailSubject",new {idSubject = idSubject});
            }

            var model = data.Subjects.FirstOrDefault(m=>m.IdSubject.Equals(idSubject));
            return View(model);
        }

        [HttpPost]
        [Route("EditSubject")]
        public IActionResult EditSubject(Subject model)
        {
            data.Update(model);
            data.SaveChanges();
            return RedirectToAction("EditQuestion",new{ idSubject = model.IdSubject});
        }

        [HttpGet]
        [Route("EditQuestion")]
        public IActionResult EditQuestion(string idSubject)
        {
            var getIdQuestion = data.Questions.Where(m => m.IdSubject.Equals(idSubject)).Select(m=>m.IdQuestion).ToList();
            var questionList = data.Questions.Where(m=>m.IdSubject.Equals(idSubject)).ToList();
            var answerList = data.Answers.Where(m => getIdQuestion.Contains(m.IdQuestion)).ToList();
            var viewModel = new QuestionViewModel
            {
                questionsList = questionList,
                answersList = answerList
            };
            return View(viewModel);
        }

        [HttpPost]
        [Route("EditQuestion")]
        public IActionResult EditQuestion(QuestionViewModel viewModel)
        {
            int count = 0;
            foreach (var question in viewModel.questionsList)
            {
                var originalQuestion = data.Questions.FirstOrDefault(m => m.IdQuestion == question.IdQuestion);
                if (originalQuestion != null && originalQuestion.Title != question.Title)
                {
                    originalQuestion.Title = question.Title;
                    var tempResult = TaoHinh(question.Title);
                    string fileName = tempResult.fileName;
                    originalQuestion.LinkImage = fileName;
                }

                var associatedAnswers = viewModel.answersList.Where(a => a.IdQuestion == question.IdQuestion).ToList();

                for (int i = count; i < associatedAnswers.Count; i++)
                {
                    var originalAnswer = data.Answers.FirstOrDefault(m => m.IdAnswer == associatedAnswers[i].IdAnswer);
                    if (originalAnswer != null && (originalAnswer.AnswerTitle != associatedAnswers[i].AnswerTitle || originalAnswer.Key != associatedAnswers[i].Key))
                    {
                        data.Answers.Update(associatedAnswers[i]);
                    }
                    count++;

                    if (count % 4 == 0)
                    {
                        break;
                    }
                }

                data.Questions.Update(originalQuestion);
            }

            data.SaveChanges();
            _notify.Success("* Cập nhật bài kiểm tra thành công");
            return RedirectToAction("SubjectList");
        }

        private dynamic TaoHinh(string questionTitle)
        {
            TextDTO textdto = new TextDTO();
            textdto.Text = questionTitle;
            IActionResult result = GetText(textdto);
            var jsonResult = result as JsonResult;
            return jsonResult.Value;
        }

        [Route("DeleteQuestion")]
        [HttpGet]
        public IActionResult DeleteQuestion(string idSubject)
        {
            var questionList = data.Questions.Where(m=>m.IdSubject.Equals(idSubject)).ToList();
            ViewBag.IdSubject = idSubject;
            return View(questionList);
        }

        [Route("DeleteQuestion")]
        [HttpPost]
        public IActionResult DeleteQuestion(List<int> idQuestion)
        {
            foreach (var questionId in idQuestion)
            {
                var question = data.Questions.FirstOrDefault(m => m.IdQuestion == questionId);
                if (question != null)
                {
                    var answers = data.Answers.Where(m => m.IdQuestion == questionId).ToList();
                    foreach (var answer in answers)
                    {
                        data.Answers.Remove(answer);
                    }

                    data.Questions.Remove(question);
                }
            }

            data.SaveChanges();
            TempData["DeleteQuestionSuccessfully"] = "* Xóa câu hỏi thành công";
            // Chuyển hướng đến một action hoặc view khác (nếu cần)
            return RedirectToAction("DetailSubject", ViewBag.IdSubject); // Ví dụ: chuyển hướng đến action Index của controller Home
        }


        [Route("StatisticOfTeacher")]
        public IActionResult StatisticOfTeacher(string idSubject)
        {
            var subjectName = data.Subjects.Where(m => m.IdSubject.Equals(idSubject)).Select(m => m.SubjectName).FirstOrDefault();
            var dTB = data.Results.Where(m => m.Idsubject.Equals(idSubject)).Select(m => m.Score).ToList();
            var amountPassed = data.Results.Count(m => m.Idsubject.Equals(idSubject) && m.Status == true);
            var amountFailed = data.Results.Count(m => m.Idsubject.Equals(idSubject) && m.Status == false);
            int amountStudentTestSubject = data.Results.Count(m => m.Idsubject.Equals(idSubject));
            bool check = amountStudentTestSubject > 0 ? true : false;

            Statistic updateStatistic = data.Statistics.FirstOrDefault(m => m.IdSubject.Equals(idSubject));
            updateStatistic.TotalStudent = data.Results.Count(m => m.Idsubject.Equals(idSubject));
            updateStatistic.AmountPassed = amountPassed;
            updateStatistic.AmountFailed = amountFailed;
            updateStatistic.AverageScore = dTB.Average();
            data.SaveChanges();

            var viewModel = new ChartViewModel
            {
                DTBLabels = new List<string> { subjectName ?? "" },
                DTBData = new List<double> { dTB.Average() ?? 0 },
                AmountPassedOrFailedLabels = new List<string> { "Số người pass", "Số người fail" },
                AmountPassedOrFailedData = new List<int> { amountPassed, amountFailed },
                Deviation = 2,
                CheckIfDidTest = check,
            };

            return View(viewModel);
        }

    }
}
