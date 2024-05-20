using System;
using System.Collections.Generic;

namespace MCQ.Models;

public partial class Contact
{
    public int IdContact { get; set; }

    public string Title { get; set; } = null!;

    public string Content { get; set; } = null!;

    public DateTime SendDate { get; set; }

    public string IdUser { get; set; } = null!;

    public virtual User IdUserNavigation { get; set; } = null!;
}
