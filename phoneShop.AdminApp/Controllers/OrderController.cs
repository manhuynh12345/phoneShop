using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using phoneShop.AdminApp.Services;
using phoneShop.ViewModels.Catalog.Order;

namespace phoneShop.AdminApp.Controllers
{
    public class OrderController : BaseController
    {
       
        private readonly IOrderApiClient _orderApiClient;
        private readonly IConfiguration _configuration;


        public OrderController(IOrderApiClient orderApiClient,
            IConfiguration configuration)
        {
            _orderApiClient = orderApiClient;           
            _configuration = configuration;
        }
        public async Task<IActionResult> Index(string keyword, int pageIndex = 1, int pageSize = 3)
        {
            var request = new GetOrderPagingRequest()
            {
                Keyword = keyword,
                PageIndex = pageIndex,
                PageSize = pageSize
            };
            var data = await _orderApiClient.GetAllPaging(request);                       
            ViewBag.Keyword = keyword;
            if (TempData["result"] != null)
            {
                ViewBag.SuccessMsg = TempData["result"];
            }
            return View(data);
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Create(OrderCreateRequest request)
        {
            if (!ModelState.IsValid)
                return View();

            var result = await _orderApiClient.CreateOrder(request);
            if (result == 1)
            {
                TempData["result"] = "Thêm mới đơn hàng thành công";
                return RedirectToAction("Index");
            }

            ModelState.AddModelError("", "Thêm đơn hàng thất bại");
            return View(request);
        }

        // Cập nhật đơn hàng
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var result = await _orderApiClient.GetById(id);

            var Request = new OrderUpdateRequest()
            {
                Id = id,
                Address = result.Address,
                mail = result.mail,
                name = result.name,
                Phone = result.Phone,
                Status = result.Status
            };
            return View(Request);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(OrderUpdateRequest request)
        {
            if (!ModelState.IsValid)
                return View();

            var result = await _orderApiClient.UpdateOrder(request);
            if (result == 1)
            {
                TempData["result"] = "Cập đơn hàng thành công";
                return RedirectToAction("Index");
            }

            ModelState.AddModelError("", "Cập nhật đơn hàng công");
            return View(request);
        }


        [HttpGet]
        public IActionResult Delete(int id)
        {

            return View(new OrderDeleteRequest()
            {
                Id = id
            });
        }

        [HttpPost]
        public async Task<IActionResult> Delete(OrderDeleteRequest request)
        {
            if (!ModelState.IsValid)
                return View();

            var result = await _orderApiClient.DeleteOrder(request.Id);
            if (result == 1)
            {
                TempData["result"] = "Xóa đơn hàng thành công";
                return RedirectToAction("Index");
            }

            ModelState.AddModelError("", "Xóa đơn hàng không thành công ");
            return View(request);
        }

        ///////////////Chi tiết đơn hàng////////


        [HttpGet]
        public IActionResult CreateOrderDetail(int id)
        {
            ViewBag.Id = id;
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> CreateOrderDetail(OrderDetailsCreateRequest request)
        {
            if (!ModelState.IsValid)
                return View();

            var result = await _orderApiClient.CreateOrderDetail(request);
            if (result == 1)
            {
                TempData["result"] = "Thêm mới đơn hàng thành công";
                return RedirectToAction("Index");
            }

            ModelState.AddModelError("", "Thêm đơn hàng thất bại");
            return View(request);
        }

        [HttpGet]
        public async Task<IActionResult> ListOrderDetails(int id)
        {
            var data = await _orderApiClient.GetListOrderDetail(id);           
            ViewBag.Id = id;           
            return View(data);
        }
    }
}
