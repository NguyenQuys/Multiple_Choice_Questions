using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MCQ.Migrations
{
    /// <inheritdoc />
    public partial class editNull : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Role",
                columns: table => new
                {
                    ID_Role = table.Column<string>(type: "varchar(10)", unicode: false, maxLength: 10, nullable: false),
                    Role_Name = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Role", x => x.ID_Role);
                });

            migrationBuilder.CreateTable(
                name: "Subject",
                columns: table => new
                {
                    IdSubject = table.Column<string>(type: "varchar(10)", unicode: false, maxLength: 10, nullable: false),
                    SubjectName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    AmountQuestionLevel1 = table.Column<int>(type: "int", nullable: false),
                    MinCorrectAnswerLevel1 = table.Column<int>(type: "int", nullable: false),
                    AmountQuestionLevel2 = table.Column<int>(type: "int", nullable: false),
                    MinCorrectAnswerLevel2 = table.Column<int>(type: "int", nullable: false),
                    AmountQuestionLevel3 = table.Column<int>(type: "int", nullable: false),
                    MinCorrectAnswerLevel3 = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Subject", x => x.IdSubject);
                });

            migrationBuilder.CreateTable(
                name: "Admin",
                columns: table => new
                {
                    ID_Admin = table.Column<string>(type: "varchar(10)", unicode: false, maxLength: 10, nullable: false),
                    ID_Role = table.Column<string>(type: "varchar(10)", unicode: false, maxLength: 10, nullable: false),
                    Admin_Name = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: false),
                    Phone_Number = table.Column<decimal>(type: "decimal(10,0)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Admin", x => x.ID_Admin);
                    table.ForeignKey(
                        name: "FK_Admin_Role",
                        column: x => x.ID_Role,
                        principalTable: "Role",
                        principalColumn: "ID_Role");
                });

            migrationBuilder.CreateTable(
                name: "Student",
                columns: table => new
                {
                    ID_Student = table.Column<string>(type: "varchar(10)", unicode: false, maxLength: 10, nullable: false),
                    Student_Name = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: false),
                    Date_Of_Birth = table.Column<DateOnly>(type: "date", nullable: false),
                    ID_Role = table.Column<string>(type: "varchar(10)", unicode: false, maxLength: 10, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Student", x => x.ID_Student);
                    table.ForeignKey(
                        name: "FK_Student_Role",
                        column: x => x.ID_Role,
                        principalTable: "Role",
                        principalColumn: "ID_Role");
                });

            migrationBuilder.CreateTable(
                name: "Teacher",
                columns: table => new
                {
                    ID_Teacher = table.Column<string>(type: "varchar(10)", unicode: false, maxLength: 10, nullable: false),
                    Teacher_Name = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    Date_Of_Birth = table.Column<DateOnly>(type: "date", nullable: false),
                    Phone_Number = table.Column<string>(type: "varchar(10)", unicode: false, maxLength: 10, nullable: false),
                    Specialization = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: false),
                    ID_Role = table.Column<string>(type: "varchar(10)", unicode: false, maxLength: 10, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Teacher", x => x.ID_Teacher);
                    table.ForeignKey(
                        name: "FK_Teacher_Role",
                        column: x => x.ID_Role,
                        principalTable: "Role",
                        principalColumn: "ID_Role");
                });

            migrationBuilder.CreateTable(
                name: "Question",
                columns: table => new
                {
                    IdQuestion = table.Column<int>(type: "int", nullable: false),
                    Title = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    IdSubject = table.Column<string>(type: "varchar(10)", unicode: false, maxLength: 10, nullable: false),
                    Level = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Question", x => x.IdQuestion);
                    table.ForeignKey(
                        name: "FK_Question_Subject",
                        column: x => x.IdSubject,
                        principalTable: "Subject",
                        principalColumn: "IdSubject");
                });

            migrationBuilder.CreateTable(
                name: "Answer",
                columns: table => new
                {
                    IdAnswer = table.Column<string>(type: "varchar(10)", unicode: false, maxLength: 10, nullable: false),
                    IdQuestion = table.Column<int>(type: "int", nullable: false),
                    Answer_Title = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Key = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Answer", x => x.IdAnswer);
                    table.ForeignKey(
                        name: "FK_Answer_Question",
                        column: x => x.IdQuestion,
                        principalTable: "Question",
                        principalColumn: "IdQuestion");
                });

            migrationBuilder.CreateTable(
                name: "Student_Answer",
                columns: table => new
                {
                    ID_Student_Answer = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ID_Student = table.Column<string>(type: "varchar(10)", unicode: false, maxLength: 10, nullable: true),
                    IdQuestion = table.Column<int>(type: "int", nullable: false),
                    IdAnswer = table.Column<string>(type: "varchar(10)", unicode: false, maxLength: 10, nullable: true),
                    IsCorrect = table.Column<bool>(type: "bit", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Student_Answer", x => x.ID_Student_Answer);
                    table.ForeignKey(
                        name: "FK_Student_Answer_Answer",
                        column: x => x.IdAnswer,
                        principalTable: "Answer",
                        principalColumn: "IdAnswer");
                    table.ForeignKey(
                        name: "FK_Student_Answer_Question",
                        column: x => x.IdQuestion,
                        principalTable: "Question",
                        principalColumn: "IdQuestion");
                    table.ForeignKey(
                        name: "FK_Student_Answer_Student",
                        column: x => x.ID_Student,
                        principalTable: "Student",
                        principalColumn: "ID_Student");
                });

            migrationBuilder.CreateIndex(
                name: "IX_Admin_ID_Role",
                table: "Admin",
                column: "ID_Role");

            migrationBuilder.CreateIndex(
                name: "IX_Answer_IdQuestion",
                table: "Answer",
                column: "IdQuestion");

            migrationBuilder.CreateIndex(
                name: "IX_Question_IdSubject",
                table: "Question",
                column: "IdSubject");

            migrationBuilder.CreateIndex(
                name: "IX_Student_ID_Role",
                table: "Student",
                column: "ID_Role");

            migrationBuilder.CreateIndex(
                name: "IX_Student_Answer_ID_Student",
                table: "Student_Answer",
                column: "ID_Student");

            migrationBuilder.CreateIndex(
                name: "IX_Student_Answer_IdAnswer",
                table: "Student_Answer",
                column: "IdAnswer");

            migrationBuilder.CreateIndex(
                name: "IX_Student_Answer_IdQuestion",
                table: "Student_Answer",
                column: "IdQuestion");

            migrationBuilder.CreateIndex(
                name: "IX_Teacher_ID_Role",
                table: "Teacher",
                column: "ID_Role");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Admin");

            migrationBuilder.DropTable(
                name: "Student_Answer");

            migrationBuilder.DropTable(
                name: "Teacher");

            migrationBuilder.DropTable(
                name: "Answer");

            migrationBuilder.DropTable(
                name: "Student");

            migrationBuilder.DropTable(
                name: "Question");

            migrationBuilder.DropTable(
                name: "Role");

            migrationBuilder.DropTable(
                name: "Subject");
        }
    }
}
