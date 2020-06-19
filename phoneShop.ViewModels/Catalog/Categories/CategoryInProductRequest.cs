using System;
using System.Collections.Generic;
using System.Text;

namespace phoneShop.ViewModels.Catalog.Categories
{
    public class CategoryInProductRequest
    {
        public int productId { set; get; }
        public int categoryId { set; get; }
    }
}
