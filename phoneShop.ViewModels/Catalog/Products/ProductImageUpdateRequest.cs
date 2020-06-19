using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;

namespace phoneShop.ViewModels.Catalog.Products
{
    public class ProductImageUpdateRequest
    {
        public int Id { get; set; }
        public int productId { get; set; }
        public bool IsDefault { get; set; }
        public IFormFile ImageFile { get; set; }
    }
}
