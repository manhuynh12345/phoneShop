using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Razor.TagHelpers;
using Microsoft.Extensions.Configuration;
using phoneShop.ViewModels.Catalog.Categories;
using phoneShop.ViewModels.Catalog.Products;
using phoneShop.WebApp.Helpers;
using phoneShop.WebApp.Models;
using phoneShop.WebApp.Services;

namespace phoneShop.WebApp.Controllers
{
    public class ProductController : Controller
    {
        private readonly IProductApiClient _productApiClient;
        private readonly IConfiguration _configuration;
        private readonly ICategoryApiClient _categoryApiClient;


        public ProductController(IProductApiClient productApiClient,
            IConfiguration configuration, ICategoryApiClient categoryApiClient)
        {           
            _productApiClient = productApiClient;
            _configuration = configuration;
            _categoryApiClient = categoryApiClient;
        }
        public async Task<IActionResult> Index(string keyword, int categoryId ,  int pageIndex = 1, int pageSize = 6)
        {
            var request = new GetProductByCategoryPagingRequest()
            {
                CategoryId = categoryId,
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
            ViewBag.Keyword = keyword;
            ViewBag.Url = _configuration["BaseAddress"];
 
            return View(data);
        }


        public async Task<IActionResult> Category(int Id, int pageIndex = 1, int pageSize = 3)
        {
            var request = new GetProductByCategoryPagingRequest()
            {
                CategoryId = Id,               
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

            ViewBag.CategoryId = Id;
            var data = await _productApiClient.GetProductPagings(request);           
            ViewBag.Url = _configuration["BaseAddress"];

            return View(data);
        }


        [HttpGet]
        public async Task<IActionResult> Details(int id)
        {
            List<CategoryViewModel> categoryList = await _categoryApiClient.GetList();
            ViewBag.CategoryList = categoryList;

            List<ProductImageViewModel> imageList = await _productApiClient.GetListImage(id);
            ViewBag.ImageList = imageList;

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



            ViewBag.productId = id;

            var result = await _productApiClient.GetProductId(id);
            var request = new GetProductByCategoryPagingRequest()
            {
                CategoryId = result.categoryId,
                PageIndex = 1,
                PageSize = 6
            };
            var data = await _productApiClient.GetProductPagings(request);
            ViewBag.data = data;


            ViewBag.Url = _configuration["BaseAddress"];
            return View(result);
        }

    }
}
