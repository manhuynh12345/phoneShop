using phoneShop.ViewModels.Common;
using System;
using System.Collections.Generic;
using System.Text;

namespace phoneShop.ViewModels.Admin
{
    public class GetUserPagingRequest : PagingRequestBase
    {
        public string Keyword { get; set; }
    }
}
