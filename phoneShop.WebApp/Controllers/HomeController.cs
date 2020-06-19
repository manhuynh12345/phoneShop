using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using phoneShop.ViewModels.Catalog.Categories;
using phoneShop.ViewModels.Catalog.Products;
using phoneShop.WebApp.Helpers;
using phoneShop.WebApp.Models;
using phoneShop.WebApp.Services;

namespace phoneShop.WebApp.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IProductApiClient _productApiClient;
        private readonly IConfiguration _configuration;
        private readonly ICategoryApiClient _categoryApiClient;

        public HomeController(ILogger<HomeController> logger, IProductApiClient productApiClient,
            IConfiguration configuration, ICategoryApiClient categoryApiClient)
        {
            _logger = logger;
            _productApiClient = productApiClient;
            _configuration = configuration;
            _categoryApiClient = categoryApiClient;

        }


        public async Task<IActionResult> Index(string keyword, int pageIndex = 1, int pageSize = 10)
        {
            var request = new GetProductByCategoryPagingRequest()
            {
                
                Keyword = keyword,
                PageIndex = pageIndex,
                PageSize = pageSize
            };

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


            var data = await _productApiClient.GetProductPagings(request);           
            ViewBag.Url = _configuration["BaseAddress"];
            ViewBag.Keyword = keyword;
            
            return View(data);
        }
        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
