using System;
using System.Collections.Generic;

namespace MCQ.Models;

public partial class Result
{
    public string IdResult { get; set; } = null!;

    public string? IdUser { get; set; }

    public string? Idsubject { get; set; }

    public int? CorrectedLevel1 { get; set; }

    public int? CorrectedLevel2 { get; set; }

    public int? CorrectedLevel3 { get; set; }

    public int? Skipped { get; set; }

    public double? Score { get; set; }

    public DateTime? ExamDate { get; set; }

    public bool? Status { get; set; }

    public string? Feedback { get; set; }

    public virtual User? IdUserNavigation { get; set; }

    public virtual Subject? IdsubjectNavigation { get; set; }
}
