using phoneShop.ViewModels.Catalog.Order;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace phoneShop.WebApp.Service
{
    public interface IOrderApiClient
    {
        Task<int> CreateOrder(OrderCreateRequest request);
        Task<int> CreateOrderDetail(OrderDetailsCreateRequest request);
    }
}
