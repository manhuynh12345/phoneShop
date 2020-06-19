using Microsoft.EntityFrameworkCore;
using phoneShop.Data.EF;
using phoneShop.Data.Entities;
using phoneShop.ViewModels.Catalog.Categories;
using phoneShop.ViewModels.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace phoneShop.Application.Catalog.Categories
{
    public class CategoriesService : ICategoriesService
    {
        private readonly EphoneShopDbContext _context;
        public CategoriesService(EphoneShopDbContext context)
        {
            _context = context;
        }

        public async Task<int> Create(CategoryCreateRequest request)
        {
            var category = new Category()
            {
                Name = request.Name,
                SortOrder = request.SortOrder,
                ParentId = request.ParentId

            };
          
            _context.Categories.Add(category);
            await _context.SaveChangesAsync();
            return category.Id;
        }

        public async Task<int> Delete(int category_Id)
        {
            var category = await _context.Categories.FindAsync(category_Id);
            if (category == null) throw new ShopException($"không tìm thấy danh mục với : {category_Id}");

            _context.Categories.Remove(category);            
            return await _context.SaveChangesAsync();
        }

        public async Task<CategoryViewModel> GetById(int category_Id)
        {
            var category = await _context.Categories.FindAsync(category_Id);
            if (category == null) 
                throw new ShopException($"không tìm thấy danh mục với : {category_Id}");

            var categoryViewModel = new CategoryViewModel()
            {
                Id = category.Id,
                Name = category.Name,
                SortOrder = category.SortOrder,
                ParentId = category.ParentId
            };
            return categoryViewModel;
        }

        public async Task<int> Update(CategoryUpdateRequest request)
        {
            var category = await _context.Categories.FindAsync(request.Id);
            if (category == null) 
                throw new ShopException($"không tìm thấy danh mục với : {request.Id}");

            category.Name = request.Name;
            category.SortOrder = request.SortOrder;
            category.ParentId = request.ParentId;

            var result = await _context.SaveChangesAsync();
            return result;
        }

        //Tạo danh mục chưa sản phẩm
        public async Task<int> CreateInCategory(int productId, int categoriesId)
        {           
            var categoriesInproduct = new ProductInCategory
            {
                ProductId = productId,
                CategoryId = categoriesId
            };
            _context.ProductInCategories.Add(categoriesInproduct);

            return await _context.SaveChangesAsync();
        }

        //Lấy danh sách danh mục sản phẩm
        public async Task<List<CategoryViewModel>> GetListCategories()
        {
            return await _context.Categories
                .Select(i => new CategoryViewModel()
                {
                    Id = i.Id,
                    Name = i.Name,
                    SortOrder = i.SortOrder,
                    ParentId = i.ParentId
                }).ToListAsync();
        }
    }
}
