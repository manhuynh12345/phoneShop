using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using phoneShop.Application.Catalog.Orders;
using phoneShop.ViewModels.Catalog.Order;

namespace phoneShop.BackEndAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class OrdersController : ControllerBase
    {
        private readonly IOrderService _orderService;

        public OrdersController(
            IOrderService orderService)
        {
            _orderService = orderService;
        }

        ///////////// Đơn hàng////////////////////////

        //api/orders?pageIndex=1&pageSize=10&keyword=
        [HttpGet]
        public async Task<IActionResult> GetAllPaging([FromQuery] GetOrderPagingRequest request)
        {
            var orders = await _orderService.GetAllPaging(request);
            return Ok(orders);
        }

        //api/orders/productId
        [AllowAnonymous]
        [HttpGet("{orderId}")]
        public async Task<IActionResult> GetById(int orderId)
        {
            var order = await _orderService.GetById(orderId);
            if (order == null)
                return BadRequest("Không tìm thấy sản phẩm");
            return Ok(order);
        }

        [AllowAnonymous]
        [HttpPost]
        public async Task<IActionResult> Create([FromBody] OrderCreateRequest request)
        {

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            
            var order = await _orderService.CreateOrder(request);
            if (order == 0)
                return BadRequest();

            return Ok(order);

        }

        [HttpPut]
        public async Task<IActionResult> Update([FromBody] OrderUpdateRequest request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var Result = await _orderService.UpdateOrder(request);
            if (Result == 0)
                return BadRequest();

            return Ok(Result);
        }

        [HttpDelete("{orderId}")]
        public async Task<IActionResult> Delete(int orderId)
        {
            var Result = await _orderService.DeleteOrder(orderId);
            if (Result == 0)
                return BadRequest();
            return Ok(Result);
        }

        ///////////// Chi tiết đơn hàng////////////////////////
        
        [AllowAnonymous]
        [HttpPost("details")]
        public async Task<IActionResult> CreateDetails([FromBody] OrderDetailsCreateRequest request)
        {

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var orderDetial = await _orderService.CreateOrderDetails(request);
            if (orderDetial == 0)
                return BadRequest();

            return Ok();
        }


        [AllowAnonymous]
        [HttpGet("details/{orderId}")]
        public async Task<IActionResult> GetListOrderDetail(int orderId)
        {
            var image = await _orderService.GetListOrderDetail(orderId);
            if (image == null)
                return BadRequest("Không tìm thấy hình ảnh");
            return Ok(image);
        }
    }
}
