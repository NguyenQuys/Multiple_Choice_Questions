namespace MCQ
{
    //
    // Summary:
    //     This API supports the ASP.NET Core Identity infrastructure and is not intended
    //     to be used as a general purpose email abstraction. It should be implemented by
    //     the application so the Identity infrastructure can send confirmation and password
    //     reset emails.
    public interface IEmailSender
    {
        //
        // Summary:
        //     This API supports the ASP.NET Core Identity infrastructure and is not intended
        //     to be used as a general purpose email abstraction. It should be implemented by
        //     the application so the Identity infrastructure can send confirmation and apassword
        //     reset emails.
        //
        // Parameters:
        //   email:
        //     The recipient's email address.
        //
        //   subject:
        //     The subject of the email.
        //
        //   htmlMessage:
        //     The body of the email which may contain HTML tags. Do not double encode this.
        Task SendEmailAsync(string email, string subject, string htmlMessage);
    }
}
