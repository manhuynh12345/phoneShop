using System;
using System.Collections.Generic;
using System.Text;

namespace phoneShop.Data.Entities
{
    public class Product
    {
        public int Id { set; get; }
        public string Name_Phone { set; get; }
        public string Description { set; get; }
        public string Details { set; get; }
        public decimal Price { set; get; }
        public decimal Promotion_Price { set; get; }
        public DateTime DateCreated { set; get; }
        public List<ProductInCategory> ProductInCategories { get; set; }
        public List<OrderDetail> OrderDetails { get; set; }
        public List<ProductImage> ProductImages { get; set; }
    }
}
