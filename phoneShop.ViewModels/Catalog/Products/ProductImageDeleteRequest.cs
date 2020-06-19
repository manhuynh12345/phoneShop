using System;
using System.Collections.Generic;
using System.Text;

namespace phoneShop.ViewModels.Catalog.Products
{
    public class ProductImageDeleteRequest
    {
        public int Id { set; get; }
        public int productId { set; get; }
    }
}
