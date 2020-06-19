using phoneShop.ViewModels.Catalog.Products;
using phoneShop.ViewModels.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace phoneShop.WebApp.Services
{
    public interface IProductApiClient
    {
        Task<PagedResult<ProductViewModel>> GetProductPagings(GetProductByCategoryPagingRequest request);

        Task<ProductViewModel> GetProductId(int id);

        Task<List<ProductImageViewModel>> GetListImage(int productId);

    }
}
