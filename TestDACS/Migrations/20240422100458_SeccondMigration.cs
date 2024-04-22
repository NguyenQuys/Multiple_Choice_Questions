using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace TestDACS.Migrations
{
    /// <inheritdoc />
    public partial class SeccondMigration : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { "1d3957d5-8afb-466f-81ff-caec8f7d24ed", null, "admin", null },
                    { "9a60f65d-08ce-40a0-bfcf-b06ccb988b79", null, "admin", "seller" },
                    { "b77f7107-1016-4752-bf6e-310ad20479e5", null, "admin", null }
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "1d3957d5-8afb-466f-81ff-caec8f7d24ed");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "9a60f65d-08ce-40a0-bfcf-b06ccb988b79");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "b77f7107-1016-4752-bf6e-310ad20479e5");
        }
    }
}
