using phoneShop.ViewModels.Catalog.Categories;
using phoneShop.ViewModels.Catalog.Products;
using phoneShop.ViewModels.Common;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace phoneShop.Application.Catalog.Products
{
    public interface IProductService
    {
        Task<int> Create(ProductCreateRequest request);
        Task<int> Update(ProductUpdateRequest request);
        Task<int> Delete(int product_Id);
        Task<ProductViewModel> GetById(int product_Id);
        Task<ProductViewModel> GetProductId(int product_Id);
        Task<PagedResult<ProductViewModel>> GetAllPaging(GetProductPagingRequest request);
        Task<PagedResult<ProductViewModel>> GetAllPagingByCategory(GetProductByCategoryPagingRequest request);
        Task<ProductImageViewModel> GetImageById(int imageId);
        Task<List<ProductImageViewModel>> GetListImage(int productId); 
        Task<int> AddImage(int productId, ProductImageCreateRequest request);
        Task<int> UpdateImage(int imageId, ProductImageUpdateRequest request);
        Task<int> RemoveImage(int productIdint, int imageId);
    }
}
