﻿using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;

namespace phoneShop.ViewModels.Catalog.Products
{
    public class ProductUpdateRequest
    {
        public int Id { set; get; }
        public string Name_Phone { set; get; }
        public string Description { set; get; }
        public string Details { set; get; }
        public decimal Price { set; get; }
        public decimal Promotion_Price { set; get; }

        public IFormFile Image { get; set; }
    }
}
