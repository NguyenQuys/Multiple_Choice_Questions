using MCQ.Models;

namespace MCQ.ViewModel
{
    public class ExamViewModal
    {
        public string IdSubjectFVM { get; set; }
        public List<Subject> Subjects { get; set; }
        public Question Question { get; set; }
        public List<Answer> AnswersList { get; set; }
        public List<StudentAnswer> StudentAnswersList { get; set; }
    }
}
