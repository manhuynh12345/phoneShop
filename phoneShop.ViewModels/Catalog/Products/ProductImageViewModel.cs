using System;
using System.Collections.Generic;
using System.Text;

namespace phoneShop.ViewModels.Catalog.Products
{
    public class ProductImageViewModel
    {
        public int Id { get; set; }

        public int ProductId { get; set; }

        public string ImagePath { get; set; }

        public bool IsDefault { get; set; }

        public DateTime DateCreated { get; set; }

        public long FileSize { get; set; }
    }
}
