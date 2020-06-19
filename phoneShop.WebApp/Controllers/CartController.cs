using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using phoneShop.ViewModels.Catalog.Categories;
using phoneShop.ViewModels.Catalog.Order;
using phoneShop.WebApp.Helpers;
using phoneShop.WebApp.Models;
using phoneShop.WebApp.Service;
using phoneShop.WebApp.Services;

namespace phoneShop.WebApp.Controllers
{
    public class CartController : Controller
    {
        private readonly IProductApiClient _productApiClient;
        private readonly IConfiguration _configuration;
        private readonly ICategoryApiClient _categoryApiClient;
        private readonly IOrderApiClient _orderApiClient;

        public List<CartItems> cart;

        public CartController(IProductApiClient productApiClient,
            IConfiguration configuration, ICategoryApiClient categoryApiClient, IOrderApiClient orderApiClient)
        {
            _productApiClient = productApiClient;
            _configuration = configuration;
            _categoryApiClient = categoryApiClient;
            _orderApiClient = orderApiClient;
        }
        public async Task<IActionResult> Index()
        {
            List<CategoryViewModel> categoryList = await _categoryApiClient.GetList();
            ViewBag.CategoryList = categoryList;
            ViewBag.Url = _configuration["BaseAddress"];

            cart = SessionExtensions.Get<List<CartItems>>(HttpContext.Session, "cart");
            var list = new List<CartItems>();
            if (cart != null)
            {
                list = cart;
            }
            ViewBag.Cart = list;


            decimal total = 0;
            foreach (var item in list)
            {
                total += (item.Price * item.Quantity);
            }
            ViewBag.total = total;

            return View(list);
        }

        public IActionResult DeleteCart(int id)
        {
            cart = SessionExtensions.Get<List<CartItems>>(HttpContext.Session, "cart");

            cart.RemoveAll(x => x.Id == id);

            SessionExtensions.Set(HttpContext.Session, "cart", cart);

            return RedirectToAction("Index");
        }

        public async Task<IActionResult> AddCart(int productId)
        {
            var product = await _productApiClient.GetProductId(productId);

            cart = SessionExtensions.Get<List<CartItems>>(HttpContext.Session, "cart");
            if(cart != null)
            {
                
                if( cart.Exists(x=>x.Id == productId))
                {
                    foreach(var item in cart)
                    {
                        if(item.Id == productId)
                        {
                            item.Quantity++;
                        }    
                    }    
                }
                else
                {
                    cart.Add(new CartItems
                    {
                        Id = productId,
                        Name_Phone = product.Name_Phone,
                        ImagePath = product.ImagePath,
                        Price = product.Price,
                        Quantity = 1
                    });
                }    
                
                SessionExtensions.Set(HttpContext.Session, "cart", cart);
            }
            else
            {
                cart = new List<CartItems>();
                cart.Add(new CartItems
                {
                    Id = productId,
                    Name_Phone = product.Name_Phone,
                    ImagePath = product.ImagePath,
                    Price = product.Price,
                    Quantity = 1
                });
                SessionExtensions.Set(HttpContext.Session, "cart", cart);
            }

            return RedirectToAction("Index");
        }

        [HttpGet]
        public async Task<IActionResult> Payment()
        {

            List<CategoryViewModel> categoryList = await _categoryApiClient.GetList();
            ViewBag.CategoryList = categoryList;

            cart = SessionExtensions.Get<List<CartItems>>(HttpContext.Session, "cart");
            var list = new List<CartItems>();
            if (cart != null)
            {
                list = cart;
            }
            ViewBag.Cart = list;

            decimal total = 0;
            foreach (var item in list)
            {
                total += (item.Price * item.Quantity);
            }
            ViewBag.total = total;

            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Payment(OrderCreateRequest request)
        {
            List<CategoryViewModel> categoryList = await _categoryApiClient.GetList();
            ViewBag.CategoryList = categoryList;

            cart = SessionExtensions.Get<List<CartItems>>(HttpContext.Session, "cart");
            var list = new List<CartItems>();
            if (cart != null)
            {
                list = cart;
            }
            ViewBag.Cart = list;

            decimal total = 0;
            foreach (var item in list)
            {
                total += (item.Price * item.Quantity);
            }
            ViewBag.total = total;

            if (!ModelState.IsValid)
                return View(request);

            var id = await _orderApiClient.CreateOrder(request);
            cart = SessionExtensions.Get<List<CartItems>>(HttpContext.Session, "cart");
            var orderDetail = new OrderDetailsCreateRequest();
            
            foreach(var item in cart)
            {
                orderDetail.OrderId = id;
                orderDetail.ProductId = item.Id;
                orderDetail.Price = item.Price;
                orderDetail.Quantity = item.Quantity;
                await _orderApiClient.CreateOrderDetail(orderDetail);

                
            }
            return RedirectToAction("Success");
        }

        public async Task<IActionResult> Success()
        {
            List<CategoryViewModel> categoryList = await _categoryApiClient.GetList();
            ViewBag.CategoryList = categoryList;

            List<CartItems> cart = SessionExtensions.Get<List<CartItems>>(HttpContext.Session, "cart");
            var list = new List<CartItems>();
            if (cart != null)
            {
                list = cart;
            }
            ViewBag.Cart = list;

            decimal total = 0;
            foreach (var item in list)
            {
                total += (item.Price * item.Quantity);
            }
            ViewBag.total = total;

            SessionExtensions.Set(HttpContext.Session, "cart", null);
            return View();
        }


    }
}
