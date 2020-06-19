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

namespace phoneShop.AdminApp.Services
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



        //Sản phẩm ////////////////////////////////////////////////////////
        public async Task<int> Create(ProductCreateRequest request)
        {
            var client = _httpClientFactory.CreateClient();
            client.BaseAddress = new Uri(_configuration["BaseAddress"]);
            var sessions = _httpContextAccessor.HttpContext.Session.GetString("Token");
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", sessions);

            byte[] data;
            using (var br = new BinaryReader(request.Image.OpenReadStream()))
                data = br.ReadBytes((int)request.Image.OpenReadStream().Length);
            ByteArrayContent bytes = new ByteArrayContent(data);

            HttpContent stringContent1 = new StringContent(request.Name_Phone);
            HttpContent stringContent2 = new StringContent(request.Description);
            HttpContent stringContent3 = new StringContent(request.Details);
            HttpContent stringContent4 = new StringContent(request.Price.ToString());
            HttpContent stringContent5 = new StringContent(request.Promotion_Price.ToString());


            MultipartFormDataContent multiContent = new MultipartFormDataContent();
            multiContent.Add(bytes, "Image", request.Image.FileName);
            multiContent.Add(stringContent1, "Name_Phone");
            multiContent.Add(stringContent2, "Description");
            multiContent.Add(stringContent3, "Details");
            multiContent.Add(stringContent4, "Price");
            multiContent.Add(stringContent5, "Promotion_Price");
            var response = await client.PostAsync($"/api/products", multiContent);
            if (response.IsSuccessStatusCode)
                return 1;

            return 0;
        }

        public async Task<int> Delete(int Id)
        {
            var sessions = _httpContextAccessor.HttpContext.Session.GetString("Token");
            var client = _httpClientFactory.CreateClient();
            client.BaseAddress = new Uri(_configuration["BaseAddress"]);
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", sessions);
            var response = await client.DeleteAsync($"/api/products/{Id}");
            if (response.IsSuccessStatusCode)
                return 1;
            return 0;
        }

        public async Task<ProductViewModel> GetById(int id)
        {
            var sessions = _httpContextAccessor.HttpContext.Session.GetString("Token");
            var client = _httpClientFactory.CreateClient();
            client.BaseAddress = new Uri(_configuration["BaseAddress"]);
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", sessions);
            var response = await client.GetAsync($"/api/products/{id}");
            var body = await response.Content.ReadAsStringAsync();

            return JsonConvert.DeserializeObject<ProductViewModel>(body);
        }

        public async Task<PagedResult<ProductViewModel>> GetProductPagings(GetProductPagingRequest request)
        {
            var client = _httpClientFactory.CreateClient();
            var sessions = _httpContextAccessor.HttpContext.Session.GetString("Token");

            client.BaseAddress = new Uri(_configuration["BaseAddress"]);
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", sessions);
            var response = await client.GetAsync($"/api/products?pageIndex=" +
                $"{request.PageIndex}&pageSize={request.PageSize}&keyword={request.Keyword}");
            var body = await response.Content.ReadAsStringAsync();
            var product = JsonConvert.DeserializeObject<PagedResult<ProductViewModel>>(body);
            return product;
        }

        public async Task<int> Update(ProductUpdateRequest request)
        {
            var client = _httpClientFactory.CreateClient();
            var sessions = _httpContextAccessor.HttpContext.Session.GetString("Token");

            client.BaseAddress = new Uri(_configuration["BaseAddress"]);
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", sessions);

            byte[] data;
            using (var br = new BinaryReader(request.Image.OpenReadStream()))
                data = br.ReadBytes((int)request.Image.OpenReadStream().Length);

            ByteArrayContent bytes = new ByteArrayContent(data);
            HttpContent stringContent1 = new StringContent(request.Id.ToString());
            HttpContent stringContent2 = new StringContent(request.Name_Phone);
            HttpContent stringContent3 = new StringContent(request.Description);
            HttpContent stringContent4 = new StringContent(request.Details);
            HttpContent stringContent5 = new StringContent(request.Price.ToString());
            HttpContent stringContent6 = new StringContent(request.Promotion_Price.ToString());


            MultipartFormDataContent multiContent = new MultipartFormDataContent();
            multiContent.Add(bytes, "Image", request.Image.FileName);
            multiContent.Add(stringContent1, "Id");
            multiContent.Add(stringContent2, "Name_Phone");
            multiContent.Add(stringContent3, "Description");
            multiContent.Add(stringContent4, "Details");
            multiContent.Add(stringContent5, "Price");
            multiContent.Add(stringContent6, "Promotion_Price");

            var response = await client.PutAsync($"/api/products", multiContent);
            if (response.IsSuccessStatusCode)
                return 1;
            return 0;
        }

        ///// Hình ảnh//////////////////////////////////////////////////

        public async Task<int> CreateImage(int productId, ProductImageCreateRequest request)
        {
            var client = _httpClientFactory.CreateClient();
            var sessions = _httpContextAccessor.HttpContext.Session.GetString("Token");

            client.BaseAddress = new Uri(_configuration["BaseAddress"]);
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", sessions);

            byte[] data;
            using (var br = new BinaryReader(request.ImageFile.OpenReadStream()))
                data = br.ReadBytes((int)request.ImageFile.OpenReadStream().Length);

            ByteArrayContent bytes = new ByteArrayContent(data);
            HttpContent stringContent1 = new StringContent(request.IsDefault.ToString());


            MultipartFormDataContent multiContent = new MultipartFormDataContent();
            multiContent.Add(bytes, "ImageFile", request.ImageFile.FileName);
            multiContent.Add(stringContent1, "IsDefault");

            var response = await client.PostAsync($"api/products/{productId}/images", multiContent);
            if (response.IsSuccessStatusCode)
                return 1;
            return 0;
        }

        public async Task<ProductImageViewModel> GetByIdImage(int id , int productId)
        {
            var sessions = _httpContextAccessor.HttpContext.Session.GetString("Token");
            var client = _httpClientFactory.CreateClient();
            client.BaseAddress = new Uri(_configuration["BaseAddress"]);
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", sessions);
            var response = await client.GetAsync($"/api/products/{productId}/images/{id}");
            var body = await response.Content.ReadAsStringAsync();

            return JsonConvert.DeserializeObject<ProductImageViewModel>(body);
        }
        public async Task<List<ProductImageViewModel>> GetListImage(int productId)
        {
            var sessions = _httpContextAccessor.HttpContext.Session.GetString("Token");
            var client = _httpClientFactory.CreateClient();
            client.BaseAddress = new Uri(_configuration["BaseAddress"]);
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", sessions);
            var response = await client.GetAsync($"/api/products/images/{productId}");
            var body = await response.Content.ReadAsStringAsync();

            return JsonConvert.DeserializeObject<List<ProductImageViewModel>>(body);
        }

        public async Task<int> UpdateImage(ProductImageUpdateRequest request)
        {
            var client = _httpClientFactory.CreateClient();
            var sessions = _httpContextAccessor.HttpContext.Session.GetString("Token");

            client.BaseAddress = new Uri(_configuration["BaseAddress"]);
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", sessions);

            byte[] data;
            using (var br = new BinaryReader(request.ImageFile.OpenReadStream()))
                data = br.ReadBytes((int) request.ImageFile.OpenReadStream().Length);

            ByteArrayContent bytes = new ByteArrayContent(data);
            HttpContent stringContent1 = new StringContent(request.IsDefault.ToString());


            MultipartFormDataContent multiContent = new MultipartFormDataContent();
            multiContent.Add(bytes, "ImageFile", request.ImageFile.FileName);
            multiContent.Add(stringContent1, "IsDefault");

            var response = await client.PutAsync($"api/products/{request.productId}/images/{request.Id}", multiContent);
            if (response.IsSuccessStatusCode)
                return 1;
            return 0;
        }

        public async Task <int> DeleteImage(int imageId, int productId)
        {
            var sessions = _httpContextAccessor.HttpContext.Session.GetString("Token");
            var client = _httpClientFactory.CreateClient();
            client.BaseAddress = new Uri(_configuration["BaseAddress"]);
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", sessions);
            var response = await client.DeleteAsync($"/api/products/{productId}/images/{imageId}");
            if (response.IsSuccessStatusCode)
                return 1;
            return 0;
        }

    }
}
