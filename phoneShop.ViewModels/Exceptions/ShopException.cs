using System;
using System.Collections.Generic;
using System.Text;

namespace phoneShop.ViewModels.Exceptions
{
    public class ShopException : Exception
    {
        public ShopException()
        {
        }

        public ShopException(string message)
            : base(message)
        {
        }

        public ShopException(string message, ShopException inner)
            : base(message, inner)
        {
        }
    }
}
