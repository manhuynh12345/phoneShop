using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace phoneShop.Data.EF
{
    public class EphoneShopDbContextFactory : IDesignTimeDbContextFactory<EphoneShopDbContext>
    {
        public EphoneShopDbContext CreateDbContext(string[] args)
        {
            IConfigurationRoot configuration = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json")
                .Build();

            var connectionString = configuration.GetConnectionString("ephoneShopDb");

            var optionsBuilder = new DbContextOptionsBuilder<EphoneShopDbContext>();
            optionsBuilder.UseSqlServer(connectionString);

            return new EphoneShopDbContext(optionsBuilder.Options);
        }
    }
}
