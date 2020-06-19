using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace phoneShop.ViewModels.Catalog.Products
{
    public class ProductImageCreateRequestValidator : AbstractValidator<ProductImageCreateRequest>
    {
        public ProductImageCreateRequestValidator()
        {
            RuleFor(x => x.ImageFile).NotEmpty().WithMessage("Hình ảnh không để trống");

        }
    }
}
