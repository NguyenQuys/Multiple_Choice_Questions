using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using TestDACS.Models;

namespace TestDACS.Services
{
    public class ApplicationDBContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDBContext(DbContextOptions options) :base(options)
        {

        }
        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
            var admin = new IdentityRole("admin");
            admin.NormalizedName = "admin";

            var client = new IdentityRole("admin");
            admin.NormalizedName = "client";

            var seller = new IdentityRole("admin");
            admin.NormalizedName = "seller";

            builder.Entity<IdentityRole>().HasData(admin, client, seller);
        }
    }
}
