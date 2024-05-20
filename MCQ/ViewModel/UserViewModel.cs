using MCQ.Models;

namespace MCQ.ViewModel
{
    public class UserViewModel
    {
        public User Register { get; set; }
        public UserViewModel()
        {
            Register = new User();
        }
    }
}
