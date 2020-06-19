using phoneShop.ViewModels.Common;
using System;
using System.Collections.Generic;
using System.Text;

namespace phoneShop.ViewModels.Catalog.Products
{
    public class GetProductByCategoryPagingRequest : PagingRequestBase
    {
        public int? CategoryId { get; set; }
        public string Keyword { get; set; }
    }
}
