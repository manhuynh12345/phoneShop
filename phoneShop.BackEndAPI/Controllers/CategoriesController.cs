using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using phoneShop.Application.Catalog.Categories;
using phoneShop.ViewModels.Catalog.Categories;

namespace phoneShop.BackEndAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class CategoriesController : ControllerBase
    {
        private readonly ICategoriesService _categoriesService;

        public CategoriesController(
            ICategoriesService categoriesService)
        {
            _categoriesService = categoriesService;
        }

        [AllowAnonymous]
        [HttpGet()]
        public async Task<IActionResult> GetListCategories()
        {
            var categories = await _categoriesService.GetListCategories();
            if (categories == null)
                return BadRequest("Không tìm thấy danh mục");
            return Ok(categories);
        }

        [HttpPatch()]
        public async Task<IActionResult> ProductInCreate(CategoryInProductRequest request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var incategories = await _categoriesService.CreateInCategory(request.productId, request.categoryId);
            if (incategories == 0)
                return BadRequest();

            return Ok();
        }

        //api/products/productId
        [HttpGet("{categoryId}")]
        public async Task<IActionResult> GetById(int categoryId)
        {
            var category = await _categoriesService.GetById(categoryId);
            if (category == null)
                return BadRequest("Không tìm thấy sản phẩm");
            return Ok(category);
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] CategoryCreateRequest request)
        {

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var categoryId = await _categoriesService.Create(request);
            if (categoryId == 0)
                return BadRequest();

            var product = await _categoriesService.GetById(categoryId);

            return Created(nameof(GetById), product);

        }

        [HttpPut]
        public async Task<IActionResult> Update([FromBody] CategoryUpdateRequest request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var Result = await _categoriesService.Update(request);
            if (Result == 0)
                return BadRequest();

            return Ok(Result);
        }

        [HttpDelete("{categoryId}")]
        public async Task<IActionResult> Delete(int categoryId)
        {
            var Result = await _categoriesService.Delete(categoryId);
            if (Result == 0)
                return BadRequest();
            return Ok(Result);
        }

    }
}
