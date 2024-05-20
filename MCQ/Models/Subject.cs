using System;
using System.Collections.Generic;

namespace MCQ.Models;

public partial class Subject
{
    public string IdSubject { get; set; } = null!;

    public string SubjectName { get; set; } = null!;

    public string? IdUser { get; set; }

    public int Time { get; set; }

    public int AmountQuestionLevel1 { get; set; }

    public int MinCorrectAnswerLevel1 { get; set; }

    public int AmountQuestionLevel2 { get; set; }

    public int MinCorrectAnswerLevel2 { get; set; }

    public int AmountQuestionLevel3 { get; set; }

    public int MinCorrectAnswerLevel3 { get; set; }

    public string NumberForEachLevel { get; set; } = null!;

    public virtual User? IdUserNavigation { get; set; }

    public virtual ICollection<Question> Questions { get; set; } = new List<Question>();

    public virtual ICollection<Result> Results { get; set; } = new List<Result>();

    public virtual ICollection<Statistic> Statistics { get; set; } = new List<Statistic>();

    public virtual ICollection<StudentAnswer> StudentAnswers { get; set; } = new List<StudentAnswer>();
}
