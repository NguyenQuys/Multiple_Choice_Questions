using Microsoft.AspNetCore.Http;
using MCQ.Areas.Teacher.ViewModel;
using MCQ.Models;
using MCQ.Models.Other;
using MCQ.ViewModel;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.VisualBasic;
using System.Diagnostics;
using Microsoft.AspNetCore.Authorization;
using AspNetCoreHero.ToastNotification.Abstractions;

namespace MCQ.Controllers
{
    public class HomeController : Controller
    {
        private readonly McqContext data;
        private readonly TimerModel _timerModel;
        private readonly INotyfService _notify;

        static HashSet<int> ListLapIdQuestion = new HashSet<int>();
        static int countA = 0;


        public HomeController(McqContext data, TimerModel timerModel, INotyfService _notify)
        {
            this.data = data;
            this._timerModel = timerModel;
            this._notify = _notify;
        }

        public IActionResult Index()
        {
            bool kiemTraDangNhap = false;
            User user = new User();
            if (User.Identity.IsAuthenticated)
            {
                string idUser = User.Identity.Name;
                if (idUser != null)
                {
                    user = data.Users.FirstOrDefault(m => m.IdUser == idUser);
                    kiemTraDangNhap = true;
                }
            }
            return View(kiemTraDangNhap);
        }

        public IActionResult CourseList()
        {
            var courseList = data.Subjects.ToList();
            return View(courseList);
        }

        private static bool TimerCalled;

        public IActionResult Timer(string IdSubject)
        {
            if (!TimerCalled)
            {
                if (!HttpContext.Request.Headers["X-Requested-With"].ToString().Equals("XMLHttpRequest", StringComparison.OrdinalIgnoreCase))
                {
                    var subject = data.Subjects.FirstOrDefault(s => s.IdSubject.Equals(IdSubject));
                    if (subject != null && subject.Time != null)
                    {
                        var timerModel = new TimerModel(TimeSpan.FromMinutes(0.35));

                        HttpContext.Session.SetString("timeout", timerModel.Timeout.ToString());
                    }
                }
                TimerCalled = true;
            }

            return View();
        }

        [HttpPost]
        public IActionResult TimerTick()
        {
            var remainingTime = _timerModel.GetRemainingTime(HttpContext.Session);
            return Json(new { hours = remainingTime.hours, minutes = remainingTime.minutes, seconds = remainingTime.seconds });
        }

        private static bool callRandom;
        private static List<Question> selectedQuestions = new List<Question>();
        public IActionResult Exam(string IdSubject, int lapIdquestion, int id = 1)
        {
            ListLapIdQuestion.Add(lapIdquestion);
            Timer(IdSubject);

            var user = new User();
            if (User.Identity.IsAuthenticated)
            {
                string idUser = User.Identity.Name;
                if (idUser != null)
                {
                    user = data.Users.FirstOrDefault(m => m.IdUser == idUser);
                }
            }

            TempData["IdSubject"] = IdSubject;
            TempData["userId"] = user.IdUser;

            if (data.Results.Any(m => m.IdUser.Equals(user.IdUser) && m.Idsubject.Equals(IdSubject)))
            {
                _notify.Error("Hệ thống ghi nhận bạn đã làm bài kiểm tra này trước dó");
                return RedirectToAction("CourseList");
            }

            var queryNumberForEachLevel = data.Subjects
                .Where(m => m.IdSubject.Equals(IdSubject))
                .Select(m => m.NumberForEachLevel)
                .FirstOrDefault();

            int numberForEachLevel = 0;
            if (queryNumberForEachLevel != null)
            {
                if (int.TryParse(queryNumberForEachLevel, out int parsedValue))
                {
                    numberForEachLevel = parsedValue;
                }
                else
                {
                    numberForEachLevel = 0;
                }
            }

            if (!callRandom)
            {
                List<Question> questions = data.Questions.Where(m => m.IdSubject.Equals(IdSubject)).ToList();
                selectedQuestions = SelectRandomQuestions(questions, numberForEachLevel);
                callRandom = true;
            }

            selectedQuestions.RemoveAll(m => ListLapIdQuestion.Contains(m.IdQuestion));

            if (id <= selectedQuestions.Count + countA)
            {
                Question ques = selectedQuestions[0];
                var answer = data.Answers.Where(x => x.IdQuestion == ques.IdQuestion).ToList();
                HttpContext.Session.SetInt32("CurrentQuestion", id);
                countA++;
                var viewModel = new ExamViewModal
                {
                    IdSubjectFVM = IdSubject,
                    Question = ques,
                    AnswersList = answer
                };

                return View(viewModel);
            }

            return RedirectToAction("Result", new { idStudentFCA = user.IdUser, IdSubject = IdSubject });
        }

        public List<Question> SelectRandomQuestions(List<Question> questions, int countPerLevel)
        {
            // Tạo danh sách để lưu trữ câu hỏi được chọn ngẫu nhiên
            List<Question> selectedQuestions = new List<Question>();

            // Tạo danh sách chứa câu hỏi của mỗi mức độ
            List<Question> level1Questions = questions.Where(q => q.Level == 1).ToList();
            List<Question> level2Questions = questions.Where(q => q.Level == 2).ToList();
            List<Question> level3Questions = questions.Where(q => q.Level == 3).ToList();

            // Chọn ngẫu nhiên 2 câu hỏi từ mỗi mức độ
            Random rand = new Random();
            selectedQuestions.AddRange(SelectRandomQuestionsFromLevel(level1Questions, countPerLevel, rand));
            selectedQuestions.AddRange(SelectRandomQuestionsFromLevel(level2Questions, countPerLevel, rand));
            selectedQuestions.AddRange(SelectRandomQuestionsFromLevel(level3Questions, countPerLevel, rand));

            return selectedQuestions;
        }

        private List<Question> SelectRandomQuestionsFromLevel(List<Question> questions, int count, Random rand)
        {
            List<Question> selectedQuestions = new List<Question>();

            // Tạo một bản sao của danh sách câu hỏi để không ảnh hưởng đến danh sách gốc
            List<Question> remainingQuestions = new List<Question>(questions);

            // Đảm bảo rằng số lượng câu hỏi được chọn không vượt quá số lượng câu hỏi có sẵn
            count = Math.Min(count, remainingQuestions.Count);

            var checkSelectedQuestion = selectedQuestions.Select(m => m.IdQuestion).ToList();
            var checkRemainingQuestion = remainingQuestions.Select(m => m.IdQuestion).ToList();


            // Chọn ngẫu nhiên số lượng câu hỏi yêu cầu từ danh sách câu hỏi còn lại
            while (selectedQuestions.Count < count)
            {
                // Chọn một câu hỏi ngẫu nhiên từ danh sách câu hỏi còn lại
                int randomIndex = rand.Next(remainingQuestions.Count);
                Question randomQuestion = remainingQuestions[randomIndex];

                if (selectedQuestions.Any(q => q.IdQuestion == randomQuestion.IdQuestion))
                {
                    // Nếu có, tiếp tục vòng lặp để chọn câu hỏi khác
                    continue;
                }
                // Thêm câu hỏi vào danh sách đã chọn
                selectedQuestions.Add(randomQuestion);

                // Loại bỏ câu hỏi đã chọn khỏi danh sách câu hỏi còn lại
                remainingQuestions.RemoveAt(randomIndex);
            }

            return selectedQuestions;
        }

        [HttpPost]
        public IActionResult CheckAnswer(string IdSubject, int IdQuestion, List<int> studentAnswersList)
        {
            var user = new User();

            int countStudentAnswer = studentAnswersList.Count();
            int _idStudentAnswer = data.StudentAnswers.Count();
            int currentQuestion = HttpContext.Session.GetInt32("CurrentQuestion") ?? 1;
            if (User.Identity.IsAuthenticated)
            {
                string idUser = User.Identity.Name;
                if (idUser != null)
                {
                    user = data.Users.FirstOrDefault(m => m.IdUser == idUser);
                }
            }
            StudentAnswer studentAnswerObject = new StudentAnswer();
            studentAnswerObject.IdStudentAnswer = "STAN" + (++_idStudentAnswer).ToString();
            studentAnswerObject.IdUser = user.IdUser; // KHI NAO XONG DANG NHAP THI GAN VO
            studentAnswerObject.IdQuestion = IdQuestion;
            studentAnswerObject.IdSubject = IdSubject;
            if (studentAnswersList.Count > 0)
            {
                for (int i = 0; i < studentAnswersList.Count(); i++)
                {
                    studentAnswerObject.IdAnswer = studentAnswersList[i];
                    var checkCorrect = data.Answers.Where(m => m.IdAnswer == studentAnswersList[i] && m.Key).ToList();

                    if (checkCorrect.Count() > 0)
                    {
                        studentAnswerObject.IsCorrect = true;
                    }
                    else if (checkCorrect.Count() == 0)
                    {
                        studentAnswerObject.IsCorrect = false;
                    }
                    data.StudentAnswers.Add(studentAnswerObject);
                    data.SaveChanges();
                }
            }
            else
            {
                studentAnswerObject.IdAnswer = null;
                studentAnswerObject.IsCorrect = null;
                data.StudentAnswers.Add(studentAnswerObject);
                data.SaveChanges();
            }
            return RedirectToAction("Exam", new { IdSubject = IdSubject, lapIdquestion = IdQuestion, id = currentQuestion + 1 });
        }

        public IActionResult Result(string idStudentFCA, string IdSubject)
        {
            var resultPage = data.Subjects.FirstOrDefault(s => s.IdSubject.Equals(IdSubject));
            TempData["PassedOrFailed"] = "";
            int _idCountResult = data.Results.Count();
            var IdQuestionFromQuestionTable = data.Questions.Where(m => m.IdSubject.Equals(IdSubject)).Select(m => m.IdQuestion).ToList();
            var chamDiem = data.Questions
                .Where(m => IdQuestionFromQuestionTable.Contains(m.IdQuestion))
                .Join(
                    data.StudentAnswers.Where(m => m.IdUser.Equals(idStudentFCA)),
                    question => question.IdQuestion,
                    studentAnswer => studentAnswer.IdQuestion,
                    (question, studentAnswer) => new Mark
                    {
                        IdQuestion = question.IdQuestion,
                        Level = question.Level,
                        IsCorrect = studentAnswer.IsCorrect ?? false,
                    }).ToList();

            var amountRightLevel1 = chamDiem.Count(m => m.Level == 1 && m.IsCorrect == true);
            TempData["amountRightLevel1"] = amountRightLevel1;
            var amountWrongLevel1 = chamDiem.Count(m => m.Level == 1 && m.IsCorrect == false);

            var amountRightLevel2 = chamDiem.Count(m => m.Level == 2 && m.IsCorrect == true);
            TempData["amountRightLevel2"] = amountRightLevel2;
            var amountWrongLevel2 = chamDiem.Count(m => m.Level == 2 && m.IsCorrect == false);

            var amountRightLevel3 = chamDiem.Count(m => m.Level == 3 && m.IsCorrect == true);
            TempData["amountRightLevel3"] = amountRightLevel3;
            var amountWrongLevel3 = chamDiem.Count(m => m.Level == 3 && m.IsCorrect == false);

            var markSkipped = chamDiem.Count(m => m.IsCorrect == null);

            var minLevel1 = data.Subjects.FirstOrDefault(m => m.IdSubject == IdSubject)?.MinCorrectAnswerLevel1 ?? 0;
            var minLevel2 = data.Subjects.FirstOrDefault(m => m.IdSubject == IdSubject)?.MinCorrectAnswerLevel2 ?? 0;
            var minLevel3 = data.Subjects.FirstOrDefault(m => m.IdSubject == IdSubject)?.MinCorrectAnswerLevel3 ?? 0;

            Result result = new Result();
            result.IdResult = "RE" + (++_idCountResult).ToString();
            result.IdUser = idStudentFCA;
            result.Idsubject = IdSubject;
            result.CorrectedLevel1 = amountRightLevel1;
            result.CorrectedLevel2 = amountRightLevel2;
            result.CorrectedLevel3 = amountRightLevel3;
            result.Skipped = markSkipped;

            int totalQuestions = amountRightLevel1 + amountRightLevel2 + amountRightLevel3 + amountWrongLevel1 + amountWrongLevel2 + amountWrongLevel3 + markSkipped;
            if (totalQuestions > 0)
            {
                double scorePerQuestion = 10.0 / totalQuestions;
                double calculatedScore = scorePerQuestion * (amountRightLevel1 + amountRightLevel2 + amountRightLevel3) - (amountWrongLevel1 + amountWrongLevel2 + amountWrongLevel3) * (scorePerQuestion * 0.2);
                result.Score = Math.Round(calculatedScore, 2);

                if (result.Score < 0)
                {
                    result.Score = 0;
                }
            }
            else
            {
                result.Score = 0;
            }

            result.ExamDate = DateTime.Now;

            if (amountRightLevel1 >= minLevel1 && amountRightLevel2 >= minLevel2 && amountRightLevel3 >= minLevel3 && result.Score >= 5)
            {
                result.Status = true;
                TempData["PassedOrFailed"] = "Bạn passed bài kiểm tra";
            }
            else
            {
                result.Status = false;
                if (amountRightLevel1 < minLevel1 || amountRightLevel2 < minLevel2 || amountRightLevel3 < minLevel3)
                {
                    TempData["PassedOrFailed"] = "Bạn không đạt số lượng câu trả lời đúng";
                }
                else if (result.Score < 5)
                {
                    TempData["PassedOrFailed"] = "Bạn không đạt điểm số đủ để qua bài kiểm tra";
                }
            }

            ListLapIdQuestion = new HashSet<int>();
            callRandom = false;
            countA = 0;

            data.Add(result);
            data.SaveChanges();
            TempData["IdResult"] = result.IdResult;
            return View(resultPage);
        }

        [HttpPost]
        public IActionResult Feedback(string feedback, string IdResultFromView)
        {
            var findAvailableResult = data.Results.FirstOrDefault(m => m.IdResult.Equals(IdResultFromView));
            findAvailableResult.Feedback = feedback;
            data.SaveChanges();
            _notify.Success("Bạn đã hoàn thành bài kiểm tra");
            return RedirectToAction("Index");
        }

        //--------Contact Area Starts---------
        [HttpGet]
        public IActionResult AddContact()
        {
            return View();
        }

        [HttpGet]
        public async Task<IActionResult> ExamHistory()
        {
            User user = new User();
            if (User.Identity.IsAuthenticated)
            {
                string idUser = User.Identity.Name;
                if (idUser != null)
                {
                    user = data.Users.FirstOrDefault(m => m.IdUser == idUser);
                }
            }
            var idSubject = await data.Results.Where(m => m.IdUser.Equals(user.IdUser)).Select(m => m.Idsubject).ToListAsync();
            var subjectName = await data.Subjects.Where(m => idSubject.Contains(m.IdSubject)).Select(m => m.SubjectName).ToListAsync();
            var results = await data.Results.Where(m => m.IdUser.Equals(user.IdUser)).ToListAsync();
            var viewModel = new ExamHistoryViewModel
            {
                Results = results,
                Subjects = subjectName
            };
            return View(viewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult AddContact(Contact contact)
        {
            if (!data.Users.Any(m => m.IdUser.Equals(contact.IdUser)))
            {
                _notify.Error("Không tìm thấy mã người dùng này");
                return View();
            }
            else
            {
                contact.SendDate = DateTime.Now;
                data.Add(contact);
                data.SaveChanges();
                _notify.Success("Gửi Report thành công!");
                return RedirectToAction("Index");
            }
        }
        //--------Contact Area Ends---------
    }
}