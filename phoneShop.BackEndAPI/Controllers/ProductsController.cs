using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using phoneShop.Application.Catalog.Products;
using phoneShop.ViewModels.Catalog.Products;

namespace phoneShop.BackEndAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class ProductsController : ControllerBase
    {
        private readonly IProductService _productService;

        public ProductsController(
            IProductService productService)
        {
            _productService = productService;
        }

        //api/products?pageIndex=1&pageSize=10&keyword=
        [HttpGet]
        public async Task<IActionResult> GetAllPaging([FromQuery] GetProductPagingRequest request)
        {
            var products = await _productService.GetAllPaging(request);
            return Ok(products);
        }

        //api/products/category?pageIndex=1&pageSize=10&CategoryId=&keyword=
        [AllowAnonymous]
        [HttpGet("category")]
        public async Task<IActionResult> GetAllPagingByCategory( [FromQuery] GetProductByCategoryPagingRequest request)
        {
            var products = await _productService.GetAllPagingByCategory( request);
            return Ok(products);
        }

        //api/products/productId/images/imageId
        [AllowAnonymous]
        [HttpGet("{productId}/images/{imageId}")]
        public async Task<IActionResult> GetImageById(int productId, int imageId)
        {
            var image = await _productService.GetImageById(imageId);
            if (image == null)
                return BadRequest("Không tìm thấy id");
            return Ok(image);
        }

        //api/products/productId/images
        [HttpPost("{productId}/images")]
        public async Task<IActionResult> CreateImage(int productId, [FromForm]ProductImageCreateRequest request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var imageId = await _productService.AddImage(productId, request);
            if (imageId == 0)
                return BadRequest();

            var image = await _productService.GetImageById(imageId);

            return Created(nameof(GetImageById), image);
        }

        //api/products/productId/images/imageId
        [HttpPut("{productId}/images/{imageId}")]
        public async Task<IActionResult> UpdateImage(int imageId, [FromForm]ProductImageUpdateRequest request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var result = await _productService.UpdateImage(imageId, request);
            if (result == 0)
                return BadRequest();

            return Ok();
        }

        //api/products/productId/images/imageId
        [HttpDelete("{productId}/images/{imageId}")]
        public async Task<IActionResult> RemoveImage(int productId, int imageId)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var result = await _productService.RemoveImage(productId, imageId);
            if (result == 0)
                return BadRequest();

            return Ok();
        }

        //api/products/images/imageId
        [AllowAnonymous]
        [HttpGet("images/{id}")]
        public async Task<IActionResult> GetListImage(int id)
        {
            var image = await _productService.GetListImage(id);
            if (image == null)
                return BadRequest("Không tìm thấy hình ảnh");
            return Ok(image);
        }

        //api/products/productId       
        [HttpGet("{productId}")]
        public async Task<IActionResult> GetById(int productId)
        {
            var product = await _productService.GetById(productId);
            if (product == null)
                return BadRequest("Không tìm thấy sản phẩm");
            return Ok(product);
        }
        [AllowAnonymous]
        [HttpGet("get/{productId}")]
        public async Task<IActionResult> GetProductId(int productId)
        {
            var product = await _productService.GetProductId(productId);
            if (product == null)
                return BadRequest("Không tìm thấy sản phẩm");
            return Ok(product);
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromForm]ProductCreateRequest request)
        {

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var productId = await _productService.Create(request);
            if (productId == 0)
                return BadRequest();

            var product = await _productService.GetById(productId);

            return Created(nameof(GetById), product);

        }

        [HttpPut]
        public async Task<IActionResult> Update([FromForm]ProductUpdateRequest request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var Result = await _productService.Update(request);
            if (Result == 0)
                return BadRequest();

            return Ok(Result);
        }

        [HttpDelete("{productId}")]
        public async Task<IActionResult> Delete(int productId)
        {
            var Result = await _productService.Delete(productId);
            if (Result == 0)
                return BadRequest();
            return Ok(Result);
        }

    }
}