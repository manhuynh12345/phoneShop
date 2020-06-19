using phoneShop.ViewModels.Catalog.Products;
using phoneShop.ViewModels.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace phoneShop.AdminApp.Services
{
    public interface IProductApiClient
    {
        Task<PagedResult<ProductViewModel>> GetProductPagings(GetProductPagingRequest request);
        Task<ProductViewModel> GetById(int id);
        Task<int> Create(ProductCreateRequest request);
        Task<int> Update(ProductUpdateRequest request);
        Task<int> Delete(int Id);


        Task<ProductImageViewModel> GetByIdImage(int id, int productId);
        Task<List<ProductImageViewModel>> GetListImage(int Id);
        Task<int> CreateImage(int productId ,ProductImageCreateRequest request);
        Task<int> UpdateImage(ProductImageUpdateRequest request);
        Task<int> DeleteImage(int productId, int imageId);
    }
}
