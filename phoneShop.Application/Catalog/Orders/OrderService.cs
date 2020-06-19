using phoneShop.Data.EF;
using phoneShop.Data.Entities;
using phoneShop.Data.Enums;
using phoneShop.ViewModels.Catalog.Order;
using phoneShop.ViewModels.Common;
using phoneShop.ViewModels.Exceptions;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using System.Linq;
using Microsoft.EntityFrameworkCore;

namespace phoneShop.Application.Catalog.Orders
{
    public class OrderService : IOrderService
    {
        private readonly EphoneShopDbContext _context;


        public OrderService(EphoneShopDbContext context)
        {
            _context = context;
        }


        ///////////// Đơn hàng////////////////////////
        public async Task<int> CreateOrder(OrderCreateRequest request)
        {
            var order = new Order()
            {
                name = request.name,
                Address = request.Address,
                mail = request.mail,
                Phone = request.Phone,
                Status = OrderStatus.InProgress,
                OrderDate = DateTime.Now

            };
            _context.Orders.Add(order);
            await _context.SaveChangesAsync();
            return order.Id;
        }

        public async Task<int> DeleteOrder(int Order_Id)
        {
            var order = await _context.Orders.FindAsync(Order_Id);
            if (order == null) throw new ShopException($"không tìm thấy đơn hàng với  : {Order_Id}");

            _context.Orders.Remove(order);
            var result = await _context.SaveChangesAsync();
            return result;
        }

        public async Task<PagedResult<OrderViewModel>> GetAllPaging(GetOrderPagingRequest request)
        {
            var query = from or in _context.Orders
                        select new { or };
            //2. Tim kiem 
            if (!string.IsNullOrEmpty(request.Keyword))
                query = query.Where(x => x.or.name.Contains(request.Keyword));
          
            //3. Phan trang 
            int totalRow = await query.CountAsync();

            var data = await query.Skip((request.PageIndex - 1) * request.PageSize)
                .Take(request.PageSize)
                .Select(x => new OrderViewModel()
                {
                    Id_order = x.or.Id,
                    name = x.or.name,
                    Address = x.or.Address,
                    mail = x.or.mail,
                    OrderDate = x.or.OrderDate,
                    Phone = x.or.Phone,
                    Status = x.or.Status,
                   

                }).ToListAsync();

            var pagedResult = new PagedResult<OrderViewModel>()
            {
                TotalRecords = totalRow,
                PageSize = request.PageSize,
                PageIndex = request.PageIndex,
                Items = data
            };
            return pagedResult;
        }

        public async Task<OrderViewModel> GetById(int order_Id)
        {
            var order = await _context.Orders.FindAsync(order_Id);
            if (order == null)
                throw new ShopException($"Không tìm thấy đơn hàng Id:  {order_Id}");


            var orderViewModel = new OrderViewModel()
            {
                Id_order = order.Id,
                name = order.name,
                mail = order.mail,
                Address = order.Address,
                Phone = order.Phone,
                Status = order.Status,
                OrderDate = order.OrderDate,
            };

            return orderViewModel;
        }

        public async Task<int> UpdateOrder(OrderUpdateRequest request)
        {
            var order = await _context.Orders.FindAsync(request.Id);
            if (order == null)
                throw new ShopException($" Khong tim thay don hang co Id: {request.Id}");

            order.name = request.name;
            order.mail = request.mail;
            order.Address = request.Address;
            order.Phone = request.Phone;
            order.Status = request.Status;

            var result = await _context.SaveChangesAsync();
            return result;
        }

        ///////////// Chi tiết đơn hàng////////////////////////

        public async Task<int> CreateOrderDetails(OrderDetailsCreateRequest request)
        {
            var orderDetails = new OrderDetail()
            {
                OrderId = request.OrderId,
                ProductId = request.ProductId,
                Quantity = request.Quantity,
                Price = request.Price,

            };
            _context.OrderDetails.Add(orderDetails);
           
            return await _context.SaveChangesAsync();
    }
       
        public async Task<List<OrderViewModel>> GetListOrderDetail(int Order_Id)
        {
            return await _context.OrderDetails.Where(x => x.OrderId == Order_Id)
                .Select(i => new OrderViewModel()
                {
                    Id_order = i.OrderId,
                    Id_Product = i.ProductId,
                    name = i.Order.name,
                    mail = i.Order.mail,
                    Address = i.Order.Address,
                    Phone = i.Order.Phone,
                    name_Product = i.Product.Name_Phone,
                    Quantity = i.Quantity,
                    Total_Price = i.Price

                }).ToListAsync();
        }

    }
}
