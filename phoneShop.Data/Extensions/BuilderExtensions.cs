using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using phoneShop.Data.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace phoneShop.Data.Extensions
{
    public static class BuilderExtensions
    {
        public static void Seed(this ModelBuilder modelBuilder)
        {            
            var hasher = new PasswordHasher<AppUser>();
            modelBuilder.Entity<AppUser>().HasData(new AppUser
            {
                Id = 1,
                UserName = "admin",
                NormalizedUserName = "admin",
                Email = "manminh@gmail.com",
                NormalizedEmail = "manminh@gmail.com",
                EmailConfirmed = true,
                PasswordHash = hasher.HashPassword(null, "Abcd1234$"),
                SecurityStamp = string.Empty,
                PhoneNumber = "0909888888",
            },
            new AppUser
            {
                Id = 2,
                UserName = "admin1",
                NormalizedUserName = "admin1",
                Email = "manminh123@gmail.com",
                NormalizedEmail = "manminh123@gmail.com",
                EmailConfirmed = true,
                PasswordHash = hasher.HashPassword(null, "Abcd1234$"),
                SecurityStamp = string.Empty,
                PhoneNumber = "0909777777",
            }
            );
        }
    }
}
