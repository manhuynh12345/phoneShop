using phoneShop.Data.Enums;
using System;
using System.Collections.Generic;
using System.Text;

namespace phoneShop.Data.Entities
{
    public class Order
    {
        public int Id { set; get; }
        public string name { set; get; }
        public string Address { set; get; }
        public string Phone { set; get; }
        public string mail { set; get; }
        public DateTime OrderDate { set; get; }
        public OrderStatus Status { set; get; }
        public List<OrderDetail> OrderDetails { get; set; }
    }
}
