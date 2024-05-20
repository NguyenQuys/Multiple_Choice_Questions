using System;
using System.Collections.Generic;

namespace MCQ.Models;

public partial class Statistic
{
    public string IdStatistic { get; set; } = null!;

    public string? IdUser { get; set; }

    public string? IdSubject { get; set; }

    public int? TotalStudent { get; set; }

    public int? AmountPassed { get; set; }

    public int? AmountFailed { get; set; }

    public double? AverageScore { get; set; }

    public virtual Subject? IdSubjectNavigation { get; set; }

    public virtual User? IdUserNavigation { get; set; }
}
