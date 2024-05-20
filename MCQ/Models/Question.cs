using System;
using System.Collections.Generic;

namespace MCQ.Models;

public partial class Question
{
    public int IdQuestion { get; set; }

    public string Title { get; set; } = null!;

    public string IdSubject { get; set; } = null!;

    public int Level { get; set; }

    public string? LinkImage { get; set; }

    public virtual ICollection<Answer> Answers { get; set; } = new List<Answer>();

    public virtual Subject IdSubjectNavigation { get; set; } = null!;

    public virtual ICollection<StudentAnswer> StudentAnswers { get; set; } = new List<StudentAnswer>();
}
