using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace phoneShop.ViewModels.Catalog.Order
{
    public class CreateOrderRequestValidator : AbstractValidator<OrderCreateRequest>
    {
        public CreateOrderRequestValidator()
        {
            RuleFor(x => x.name).NotEmpty().WithMessage("Tên không để trống");

            RuleFor(x => x.Address).NotEmpty().WithMessage("Địa chỉ không để trống");

            RuleFor(x => x.Phone).NotEmpty().WithMessage("Số điện thoại không để trống")
                .Matches(@"(09|01[2|6|8|9])+([0-9]{8})\b")
                .WithMessage("Số điện thoại không hợp lệ");

            RuleFor(x => x.mail).NotEmpty().WithMessage("Email không để trống")
                .Matches(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$")
                .WithMessage("Email không hợp lệ");
            

        }

    }
    
}
