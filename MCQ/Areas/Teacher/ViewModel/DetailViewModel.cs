using MCQ.Models;

namespace MCQ.Areas.Teacher.ViewModel
{
    public class DetailViewModel
    {
        public List<Question> listQuestion { get; set; }
        public List<Answer> ListAnswer { get; set; }
        public string IdSubject { get; set; }
        public List<Question> questionLevel1 { get; set; }
        public List<Question> questionLevel2 { get; set; }
        public List<Question> questionLevel3 { get; set;}
    }
    
}
