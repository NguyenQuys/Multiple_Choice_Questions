using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace MCQ.Models;

public partial class McqContext : DbContext
{
    public McqContext()
    {
    }

    public McqContext(DbContextOptions<McqContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Answer> Answers { get; set; }

    public virtual DbSet<Contact> Contacts { get; set; }

    public virtual DbSet<Question> Questions { get; set; }

    public virtual DbSet<Result> Results { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<Statistic> Statistics { get; set; }

    public virtual DbSet<StudentAnswer> StudentAnswers { get; set; }

    public virtual DbSet<Subject> Subjects { get; set; }

    public virtual DbSet<User> Users { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        if (!optionsBuilder.IsConfigured)
        {
            IConfigurationRoot configuration = new ConfigurationBuilder()
                .SetBasePath(AppDomain.CurrentDomain.BaseDirectory)
                .AddJsonFile("appsettings.json")
                .Build();

            optionsBuilder.UseSqlServer(configuration.GetConnectionString("DefaultConnection"));
        }
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Answer>(entity =>
        {
            entity.HasKey(e => e.IdAnswer);

            entity.ToTable("Answer");

            entity.HasIndex(e => e.IdQuestion, "IX_Answer_IDQuestion");

            entity.Property(e => e.IdAnswer).ValueGeneratedNever();
            entity.Property(e => e.AnswerTitle).HasColumnName("Answer_Title");

            entity.HasOne(d => d.IdQuestionNavigation).WithMany(p => p.Answers)
                .HasForeignKey(d => d.IdQuestion)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Answer_Question");
        });

        modelBuilder.Entity<Contact>(entity =>
        {
            entity.HasKey(e => e.IdContact);

            entity.Property(e => e.IdUser)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.SendDate).HasColumnType("datetime");

            entity.HasOne(d => d.IdUserNavigation).WithMany(p => p.Contacts)
                .HasForeignKey(d => d.IdUser)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Contacts_User");
        });

        modelBuilder.Entity<Question>(entity =>
        {
            entity.HasKey(e => e.IdQuestion);

            entity.ToTable("Question");

            entity.HasIndex(e => e.IdSubject, "IX_Question_IDSubject");

            entity.Property(e => e.IdQuestion).ValueGeneratedNever();
            entity.Property(e => e.IdSubject)
                .HasMaxLength(10)
                .IsUnicode(false);

            entity.HasOne(d => d.IdSubjectNavigation).WithMany(p => p.Questions)
                .HasForeignKey(d => d.IdSubject)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Question_Subject");
        });

        modelBuilder.Entity<Result>(entity =>
        {
            entity.HasKey(e => e.IdResult);

            entity.ToTable("Result");

            entity.HasIndex(e => e.Idsubject, "IX_Result_IDSubject");

            entity.HasIndex(e => e.IdUser, "IX_Result_ID_Student");

            entity.Property(e => e.IdResult)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.IdUser)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.Idsubject)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("IDSubject");

            entity.HasOne(d => d.IdUserNavigation).WithMany(p => p.Results)
                .HasForeignKey(d => d.IdUser)
                .HasConstraintName("FK_Result_User");

            entity.HasOne(d => d.IdsubjectNavigation).WithMany(p => p.Results)
                .HasForeignKey(d => d.Idsubject)
                .HasConstraintName("FK_Result_Subject");
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.HasKey(e => e.IdRole);

            entity.ToTable("Role");

            entity.Property(e => e.IdRole)
                .ValueGeneratedNever()
                .HasColumnName("Id_Role");
            entity.Property(e => e.RoleName)
                .HasMaxLength(50)
                .HasColumnName("Role_Name");
        });

        modelBuilder.Entity<Statistic>(entity =>
        {
            entity.HasKey(e => e.IdStatistic);

            entity.ToTable("Statistic");

            entity.Property(e => e.IdStatistic)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.IdSubject)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.IdUser)
                .HasMaxLength(10)
                .IsUnicode(false);

            entity.HasOne(d => d.IdSubjectNavigation).WithMany(p => p.Statistics)
                .HasForeignKey(d => d.IdSubject)
                .HasConstraintName("FK_Statistic_Subject");

            entity.HasOne(d => d.IdUserNavigation).WithMany(p => p.Statistics)
                .HasForeignKey(d => d.IdUser)
                .HasConstraintName("FK_Statistic_User");
        });

        modelBuilder.Entity<StudentAnswer>(entity =>
        {
            entity.HasKey(e => e.IdStudentAnswer);

            entity.ToTable("Student_Answer");

            entity.HasIndex(e => e.IdAnswer, "IX_Student_Answer_IDAnswer");

            entity.HasIndex(e => e.IdQuestion, "IX_Student_Answer_IDQuestion");

            entity.HasIndex(e => e.IdSubject, "IX_Student_Answer_IDSubject");

            entity.HasIndex(e => e.IdUser, "IX_Student_Answer_ID_Student");

            entity.Property(e => e.IdStudentAnswer)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("ID_Student_Answer");
            entity.Property(e => e.IdSubject)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.IdUser)
                .HasMaxLength(10)
                .IsUnicode(false);

            entity.HasOne(d => d.IdAnswerNavigation).WithMany(p => p.StudentAnswers)
                .HasForeignKey(d => d.IdAnswer)
                .HasConstraintName("FK_Student_Answer_Answer");

            entity.HasOne(d => d.IdQuestionNavigation).WithMany(p => p.StudentAnswers)
                .HasForeignKey(d => d.IdQuestion)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Student_Answer_Question");

            entity.HasOne(d => d.IdSubjectNavigation).WithMany(p => p.StudentAnswers)
                .HasForeignKey(d => d.IdSubject)
                .HasConstraintName("FK_Student_Answer_Subject");

            entity.HasOne(d => d.IdUserNavigation).WithMany(p => p.StudentAnswers)
                .HasForeignKey(d => d.IdUser)
                .HasConstraintName("FK_Student_Answer_User");
        });

        modelBuilder.Entity<Subject>(entity =>
        {
            entity.HasKey(e => e.IdSubject);

            entity.ToTable("Subject");

            entity.Property(e => e.IdSubject)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.IdUser)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.NumberForEachLevel).HasColumnType("text");

            entity.HasOne(d => d.IdUserNavigation).WithMany(p => p.Subjects)
                .HasForeignKey(d => d.IdUser)
                .HasConstraintName("FK_Subject_User");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.IdUser);

            entity.ToTable("User");

            entity.Property(e => e.IdUser)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.DateOfBirth).HasColumnName("Date_Of_Birth");
            entity.Property(e => e.Email)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.IdRole).HasColumnName("Id_Role");
            entity.Property(e => e.LockTime).HasColumnType("datetime");
            entity.Property(e => e.Password).IsUnicode(false);
            entity.Property(e => e.PhoneNumber)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("Phone_Number");

            entity.HasOne(d => d.IdRoleNavigation).WithMany(p => p.Users)
                .HasForeignKey(d => d.IdRole)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_User_Role");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
