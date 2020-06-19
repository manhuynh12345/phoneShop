using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using phoneShop.Data.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace phoneShop.Data.Config
{
    public class OrderConfig : IEntityTypeConfiguration<Order>
    {
        public void Configure(EntityTypeBuilder<Order> builder)
        {
            builder.ToTable("Orders");

            builder.HasKey(x => x.Id);

            builder.Property(x => x.Id).UseIdentityColumn();

            builder.Property(x => x.OrderDate);
            builder.Property(x => x.name).IsRequired().HasMaxLength(100);
            builder.Property(x => x.Phone).IsRequired();
            builder.Property(x => x.mail).IsRequired().HasMaxLength(100);
            builder.Property(x => x.Address).IsRequired().HasMaxLength(250);

        }
    }
}
