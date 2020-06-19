using phoneShop.ViewModels.Catalog.Categories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace phoneShop.AdminApp.Services
{
    public interface ICategoryApiClient
    {
        Task<CategoryViewModel> GetById(int id);
        Task<int> Create(CategoryCreateRequest request);
        Task<int> Update(CategoryUpdateRequest request);
        Task<int> Delete(int Id);
        Task<List<CategoryViewModel>> GetList();

        Task<int> CreateInCategory(CategoryInProductRequest request);
    }
}
