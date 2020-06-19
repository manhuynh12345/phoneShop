using phoneShop.Data.Enums;
using System;
using System.Collections.Generic;
using System.Text;

namespace phoneShop.ViewModels.Catalog.Order
{
    public class OrderUpdateRequest
    {
        public int Id { set; get; }
        public string name { set; get; }
        public string Address { set; get; }
        public string Phone { set; get; }
        public string mail { set; get; }
        public OrderStatus Status { set; get; }
    }
}
