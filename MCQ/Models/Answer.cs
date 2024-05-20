using System;
using System.Collections.Generic;

namespace MCQ.Models;

public partial class Answer
{
    public int IdAnswer { get; set; }

    public int IdQuestion { get; set; }

    public string AnswerTitle { get; set; } = null!;

    public bool Key { get; set; }

    public virtual Question IdQuestionNavigation { get; set; } = null!;

    public virtual ICollection<StudentAnswer> StudentAnswers { get; set; } = new List<StudentAnswer>();
}
