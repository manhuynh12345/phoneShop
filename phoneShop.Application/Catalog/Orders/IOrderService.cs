using phoneShop.ViewModels.Catalog.Order;
using phoneShop.ViewModels.Common;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace phoneShop.Application.Catalog.Orders
{
    public interface IOrderService
    {
        Task<int> CreateOrder(OrderCreateRequest request);
        Task<int> UpdateOrder(OrderUpdateRequest request);
        Task<int> DeleteOrder(int Order_Id);
        Task<OrderViewModel> GetById(int Order_Id);
        Task<PagedResult<OrderViewModel>> GetAllPaging(GetOrderPagingRequest request);

        Task<int> CreateOrderDetails(OrderDetailsCreateRequest request);
        Task<List<OrderViewModel>> GetListOrderDetail(int Order_Id);

    }
}
