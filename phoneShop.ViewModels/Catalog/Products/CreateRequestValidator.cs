using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace phoneShop.ViewModels.Catalog.Products
{
    public class CreateRequestValidator : AbstractValidator<ProductCreateRequest>
    {
        public CreateRequestValidator()
        {
            RuleFor(x => x.Name_Phone).NotEmpty().WithMessage("Tên không để trống");
                
            RuleFor(x => x.Description).NotEmpty().WithMessage("Mô tả không để trống");

            RuleFor(x => x.Details).NotEmpty().WithMessage("Chi tiết không để trống");

            RuleFor(x => x.Price).NotEmpty().WithMessage("Giá không để trống");

            RuleFor(x => x.Promotion_Price).NotEmpty().WithMessage("Giá khuyến mãi không để trống");

            RuleFor(x => x.Image).NotEmpty().WithMessage("Hình ảnh không để trống");

        }

    }
}
