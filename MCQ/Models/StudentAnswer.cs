using System;
using System.Collections.Generic;

namespace MCQ.Models;

public partial class StudentAnswer
{
    public string IdStudentAnswer { get; set; } = null!;

    public string? IdUser { get; set; }

    public string? IdSubject { get; set; }

    public int IdQuestion { get; set; }

    public int? IdAnswer { get; set; }

    public bool? IsCorrect { get; set; }

    public virtual Answer? IdAnswerNavigation { get; set; }

    public virtual Question IdQuestionNavigation { get; set; } = null!;

    public virtual Subject? IdSubjectNavigation { get; set; }

    public virtual User? IdUserNavigation { get; set; }
}
