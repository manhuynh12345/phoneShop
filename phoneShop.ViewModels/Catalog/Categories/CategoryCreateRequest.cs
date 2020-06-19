using System;
using System.Collections.Generic;
using System.Text;

namespace phoneShop.ViewModels.Catalog.Categories
{
    public class CategoryCreateRequest
    {
        public string Name { set; get; }
        public int SortOrder { set; get; }
        public int? ParentId { set; get; }
    }
}
