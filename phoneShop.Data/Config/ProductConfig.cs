using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using phoneShop.Data.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace phoneShop.Data.Config
{
    public class ProductConfig : IEntityTypeConfiguration<Product>
    {
        public void Configure(EntityTypeBuilder<Product> builder)
        {
            builder.ToTable("Products");

            builder.HasKey(x => x.Id);
            builder.Property(x => x.Id).UseIdentityColumn();
            builder.Property(x => x.Name_Phone).IsRequired().HasMaxLength(100);
            builder.Property(x => x.Description).IsRequired().HasMaxLength(255);
            builder.Property(x => x.Details).IsRequired().HasMaxLength(500);
            builder.Property(x => x.Price).IsRequired();
            builder.Property(x => x.Promotion_Price).IsRequired();
        }
    }
}
