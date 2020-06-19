using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace phoneShop.WebApp.Models
{
    public class CartItems
    {
        public int  Id { set; get; }
        public string Name_Phone { set; get; }
        public string ImagePath { get; set; }
        public decimal Price { set; get; }
        public int Quantity { set; get; }
    }
}
