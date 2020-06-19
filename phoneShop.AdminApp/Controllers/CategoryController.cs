using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using phoneShop.AdminApp.Services;
using phoneShop.ViewModels.Catalog.Categories;

namespace phoneShop.AdminApp.Controllers
{
    public class CategoryController : BaseController
    {
        private readonly ICategoryApiClient _categoryApiClient;
        private readonly IConfiguration _configuration;


        public CategoryController(
            IConfiguration configuration, ICategoryApiClient categoryApiClient)
        {
            _categoryApiClient = categoryApiClient;
            _configuration = configuration;
        }


        public async Task <IActionResult> Index()
        {
            var data = await _categoryApiClient.GetList();
      
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
        public async Task<IActionResult> Create(CategoryCreateRequest request)
        {
            if (!ModelState.IsValid)
                return View();

            var result = await _categoryApiClient.Create(request);
            if (result == 1)
            {
                TempData["result"] = "Thêm mới danh mục thành công";
                return RedirectToAction("Index");
            }

            ModelState.AddModelError("", "Thêm danh mục thất bại");
            return View(request);
        }

        // Cập nhật sản phẩm
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var result = await _categoryApiClient.GetById(id);

            var Request = new CategoryUpdateRequest()
            {
                Id = id,
                Name = result.Name,
                SortOrder = result.SortOrder,
                ParentId = result.ParentId
            };
            return View(Request);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(CategoryUpdateRequest request)
        {
            if (!ModelState.IsValid)
                return View();

            var result = await _categoryApiClient.Update(request);
            if (result == 1)
            {
                TempData["result"] = "Cập danh mục thành công";
                return RedirectToAction("Index");
            }

            ModelState.AddModelError("", "Cập nhật không thành công");
            return View(request);
        }


        [HttpGet]
        public IActionResult Delete(int id)
        {

            return View(new CategoryDeleteRequest()
            {
                Id = id
            });
        }

        [HttpPost]
        public async Task<IActionResult> Delete(CategoryDeleteRequest request)
        {
            if (!ModelState.IsValid)
                return View();

            var result = await _categoryApiClient.Delete(request.Id);
            if (result == 1)
            {
                TempData["result"] = "Xóa danh mục thành công";
                return RedirectToAction("Index");
            }

            ModelState.AddModelError("", "Xóa sản phẩm không thành công ");
            return View(request);
        }


        [HttpPost]
        public async Task<IActionResult> CreateInCategory(CategoryInProductRequest request)
        {
            if (!ModelState.IsValid)
                return View();

            var result = await _categoryApiClient.CreateInCategory(request);
            if (result == 1)
            {
                TempData["result"] = "Thêm sản phẩm vào danh mục thành công";
                return RedirectToAction("Index","Product");
            }

            ModelState.AddModelError("", "Thêm sản phẩm vào không thành công");
            return View(request);
        }
    }
}
