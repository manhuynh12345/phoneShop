using phoneShop.ViewModels.Catalog.Categories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace phoneShop.WebApp.Services
{
    public interface ICategoryApiClient
    {

        Task<List<CategoryViewModel>> GetList();
 
    }
}
