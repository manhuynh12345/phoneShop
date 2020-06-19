using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace phoneShop.ViewModels.Catalog.Products
{
    public class ProductImageUpdateRequestValidator : AbstractValidator<ProductImageUpdateRequest>
    {
        public ProductImageUpdateRequestValidator()
        {          
            RuleFor(x => x.ImageFile).NotEmpty().WithMessage("Hình ảnh không để trống");

        }
    }
}
