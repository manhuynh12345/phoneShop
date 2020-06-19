using phoneShop.Data.Enums;
using System;
using System.Collections.Generic;
using System.Text;

namespace phoneShop.ViewModels.Catalog.Order
{
    public class OrderViewModel
    {
        public int Id_order { set; get; }
        public int Id_Product { set; get; }
        public string name { set; get; }
        public string Address { set; get; }
        public string Phone { set; get; }
        public string mail { set; get; }
        public string name_Product { set; get; }
        public int Quantity { set; get; }
        public decimal Total_Price { set; get; }
        public DateTime OrderDate { set; get; }
        public OrderStatus Status { set; get; }
    }
}
