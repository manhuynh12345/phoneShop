using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace phoneShop.ViewModels.Admin
{
    public class LoginRequestValidator : AbstractValidator<LoginRequest>
    {
        public LoginRequestValidator()
        {
            RuleFor(x => x.UserName).NotEmpty().WithMessage("Không được để trống tên đăng nhập");
            RuleFor(x => x.Password).NotEmpty().WithMessage("Không được để trống mật khẩu");
        }
    }
}
