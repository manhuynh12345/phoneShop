using phoneShop.Data.Enums;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace phoneShop.ViewModels.Catalog.Order
{
    public class OrderCreateRequest
    {
        [Display(Name = "Tên khách hàng")]
        public string name { set; get; }

        [Display(Name = "Địa chỉ giao hàng")]
        public string Address { set; get; }

        [Display(Name = "Số điện thoại")]
        public string Phone { set; get; }

        [Display(Name = "Địa chỉ email")]
        public string mail { set; get; }

    }
}
