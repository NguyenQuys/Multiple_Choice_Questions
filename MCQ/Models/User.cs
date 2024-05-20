using System;
using System.Collections.Generic;

namespace MCQ.Models;

public partial class User
{
    public string IdUser { get; set; } = null!;

    public string Name { get; set; } = null!;

    public DateOnly DateOfBirth { get; set; }

    public bool? Gender { get; set; }

    public string? Email { get; set; }

    public int IdRole { get; set; }

    public string PhoneNumber { get; set; } = null!;

    public string? Password { get; set; }

    public bool Hide { get; set; }

    public DateTime? LockTime { get; set; }

    public int FailedLoginAttempts { get; set; }

    public virtual ICollection<Contact> Contacts { get; set; } = new List<Contact>();

    public virtual Role IdRoleNavigation { get; set; } = null!;

    public virtual ICollection<Result> Results { get; set; } = new List<Result>();

    public virtual ICollection<Statistic> Statistics { get; set; } = new List<Statistic>();

    public virtual ICollection<StudentAnswer> StudentAnswers { get; set; } = new List<StudentAnswer>();

    public virtual ICollection<Subject> Subjects { get; set; } = new List<Subject>();
}
