using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Configuration;
using phoneShop.AdminApp.Services;
using phoneShop.ViewModels.Admin;
using phoneShop.ViewModels.Catalog.Categories;
using phoneShop.ViewModels.Catalog.Products;

namespace phoneShop.AdminApp.Controllers
{
    public class ProductController : BaseController
    {
        private readonly ICategoryApiClient _categoryApiClient;
        private readonly IProductApiClient _productApiClient;
        private readonly IConfiguration _configuration;


        public ProductController(IProductApiClient productApiClient,
            IConfiguration configuration, ICategoryApiClient categoryApiClient)
        {
            _categoryApiClient = categoryApiClient;
            _productApiClient = productApiClient;
            _configuration = configuration;
        }
        public async Task<IActionResult> Index(string keyword, int pageIndex = 1, int pageSize = 10)
        {
            var request = new GetProductPagingRequest()
            {
                Keyword = keyword,
                PageIndex = pageIndex,
                PageSize = pageSize
            };
            var data = await _productApiClient.GetProductPagings(request);

            List<CategoryViewModel> categoryList = await _categoryApiClient.GetList();

            //SelectList cateList = new SelectList(categoryList, "Id", "Name");

            ViewBag.CategoryList = categoryList;

            ViewBag.Url = _configuration["BaseAddress"];
            ViewBag.Keyword = keyword;
            if (TempData["result"] != null)
            {
                ViewBag.SuccessMsg = TempData["result"];
            }
            return View(data);
        }
        // Thêm mới sản phẩm///////////////////////////////////////////////
        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Create(ProductCreateRequest request)
        {
            if (!ModelState.IsValid)
                return View();

            var result = await _productApiClient.Create(request);
            if (result == 1)
            {
                TempData["result"] = "Thêm mới sản phẩm thành công";
                return RedirectToAction("Index");
            }

            ModelState.AddModelError("", "Thêm sản phẩm thất bại");
            return View(request);
        }

        // Cập nhật sản phẩm
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var result = await _productApiClient.GetById(id);
           
                var ProductRequest = new ProductUpdateRequest()
                {
                    Id = id,
                    Name_Phone = result.Name_Phone,
                    Description = result.Description,
                    Details = result.Details,
                    Price = result.Price,
                    Promotion_Price = result.Promotion_Price                    
                };
                return View(ProductRequest);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(ProductUpdateRequest request)
        {
            if (!ModelState.IsValid)
                return View();

            var result = await _productApiClient.Update( request);
            if (result == 1)
            {
                TempData["result"] = "Cập sản phẩm thành công";
                return RedirectToAction("Index");
            }

            ModelState.AddModelError("", "Cập nhật không thành công");
            return View(request);
        }


        [HttpGet]
        public IActionResult Delete(int id)
        {
            
            return View(new ProductDeleteRequest()
            {
                Id = id             
            });
        }

        [HttpPost]
        public async Task<IActionResult> Delete(ProductDeleteRequest request)
        {
            if (!ModelState.IsValid)
                return View();

            var result = await _productApiClient.Delete(request.Id);
            if (result == 1)
            {
                TempData["result"] = "Xóa sản phẩm thành công";
                return RedirectToAction("Index");
            }

            ModelState.AddModelError("", "Xóa sản phẩm không thành công ");
            return View(request);
        }

        [HttpGet]
        public async Task<IActionResult> Details(int id)
        {
            var result = await _productApiClient.GetById(id);
            return View(result);
        }

        ////// Hình ảnh///////////////////////////////////////////////

    

        [HttpGet]
        public IActionResult CreateImage(int id)
        {
            ViewBag.Id = id;
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> CreateImage(int id , ProductImageCreateRequest request)
        {
            if (!ModelState.IsValid)
                return View();            
            var result = await _productApiClient.CreateImage(id,request);
            if (result == 1)
            {
                TempData["result"] = "Thêm hình ảnh thành công";
                return RedirectToAction("ListImage", new { Id = id});
            }

            ModelState.AddModelError("", "Thêm hình ảnh thất bại");
            return View(request);
        }

        [HttpGet]
        public async Task<IActionResult> ListImage(int id)
        {
            var data = await _productApiClient.GetListImage(id);

            ViewBag.Url = _configuration["BaseAddress"]  ;
            ViewBag.Id = id;
            if (TempData["result"] != null)
            {
                ViewBag.SuccessMsg = TempData["result"];
            }
            return View(data);
        }


        [HttpGet]
        public async Task<IActionResult> UpdateImage(int id, int productId)
        {
            var result = await _productApiClient.GetByIdImage(id, productId);

            ViewBag.Id = productId;
            var ProductRequest = new ProductImageUpdateRequest()
            {
                productId = result.ProductId,
                Id = result.Id,
                
            };
            return View(ProductRequest);
        }
        [HttpPost]
        public async Task<IActionResult> UpdateImage( ProductImageUpdateRequest request)
        {
            if (!ModelState.IsValid)
                return View();

            var result = await _productApiClient.UpdateImage( request);
            if (result == 1)
            {
                TempData["result"] = "Cập nhật hình ảnh thành công";
                return RedirectToAction("ListImage", new { Id = request.productId });
            }

            ModelState.AddModelError("", "Cập nhật hình ảnh thất bại");
            return View(request);
        }

        [HttpGet]
        public IActionResult DeleteImage(int id, int productId)
        {
            ViewBag.Id = productId;
            return View(new ProductImageDeleteRequest()
            {
                Id = id,
                productId = productId
            }) ;
           
        }

        [HttpPost]
        public async Task<IActionResult> DeleteImage(ProductImageDeleteRequest request)
        {
            if (!ModelState.IsValid)
                return View();

            var result = await _productApiClient.DeleteImage(request.Id, request.productId);
            if (result == 1)
            {
                TempData["result"] = "Xóa hình ảnh thành công";
                return RedirectToAction("ListImage", new { Id = request.productId });
            }

            ModelState.AddModelError("", "Xóa hình ảnh không thành công ");
            return View(request);
        }
    }
}