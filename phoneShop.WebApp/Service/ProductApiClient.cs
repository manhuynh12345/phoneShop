using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using phoneShop.ViewModels.Catalog.Products;
using phoneShop.ViewModels.Common;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace phoneShop.WebApp.Services
{
    public class ProductApiClient : IProductApiClient
    {
        private readonly IHttpClientFactory _httpClientFactory;
        private readonly IConfiguration _configuration;
        private readonly IHttpContextAccessor _httpContextAccessor;


        public ProductApiClient(IHttpClientFactory httpClientFactory,
                   IHttpContextAccessor httpContextAccessor,
                    IConfiguration configuration)
        {
            _configuration = configuration;
            _httpContextAccessor = httpContextAccessor;
            _httpClientFactory = httpClientFactory;
        }

        public async Task<PagedResult<ProductViewModel>> GetProductPagings(GetProductByCategoryPagingRequest request)
        {
            var client = _httpClientFactory.CreateClient();          
            client.BaseAddress = new Uri(_configuration["BaseAddress"]);
            var response = await client.GetAsync($"/api/products/category?pageIndex=" +
                $"{request.PageIndex}&pageSize={request.PageSize}&CategoryId={request.CategoryId}&keyword={request.Keyword}");
            var body = await response.Content.ReadAsStringAsync();
            var product = JsonConvert.DeserializeObject<PagedResult<ProductViewModel>>(body);
            return product;
        }

        public async Task<ProductViewModel> GetProductId(int id)
        {
            var client = _httpClientFactory.CreateClient();
            client.BaseAddress = new Uri(_configuration["BaseAddress"]);           
            var response = await client.GetAsync($"/api/products/get/{id}");
            var body = await response.Content.ReadAsStringAsync();

            return JsonConvert.DeserializeObject<ProductViewModel>(body);
        }

        public async Task<List<ProductImageViewModel>> GetListImage(int productId)
        {           
            var client = _httpClientFactory.CreateClient();
            client.BaseAddress = new Uri(_configuration["BaseAddress"]);
            var response = await client.GetAsync($"/api/products/images/{productId}");
            var body = await response.Content.ReadAsStringAsync();

            return JsonConvert.DeserializeObject<List<ProductImageViewModel>>(body);
        }

    }
}
