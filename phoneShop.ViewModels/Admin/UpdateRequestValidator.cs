using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace phoneShop.ViewModels.Admin
{
    public class UpdateRequestValidator : AbstractValidator<UserUpdateRequest>
    {
        public UpdateRequestValidator()
        {
            RuleFor(x => x.Email).NotEmpty().WithMessage("Email không để trống")
                .Matches(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$")
                .WithMessage("Email không hợp lệ");

            RuleFor(x => x.PhoneNumber).NotEmpty().WithMessage("Phone không để trống");
        }
    }
}
