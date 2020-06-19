using phoneShop.ViewModels.Catalog.Categories;
using phoneShop.ViewModels.Catalog.Products;
using phoneShop.ViewModels.Common;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace phoneShop.Application.Catalog.Categories
{
    public interface ICategoriesService
    {
        Task<int> Create(CategoryCreateRequest request);
        Task<int> Update(CategoryUpdateRequest request);
        Task<int> Delete(int category_Id);
        Task<CategoryViewModel> GetById(int category_Id);

        Task<int> CreateInCategory(int productId, int categoryId);
        Task<List<CategoryViewModel>> GetListCategories();
    }
}
