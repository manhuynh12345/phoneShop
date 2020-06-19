using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;

namespace phoneShop.ViewModels.Admin
{
    public class RegisterRequestValidator : AbstractValidator<RegisterRequest>
    {
        public RegisterRequestValidator()
        {
            RuleFor(x => x.Email).NotEmpty().WithMessage("Email không để trống")
                .Matches(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$")
                .WithMessage("Email không hợp lệ");

            RuleFor(x => x.PhoneNumber).NotEmpty().WithMessage("Phone không để trống")
                .Matches(@"(09|01[2|6|8|9])+([0-9]{8})\b")
                .WithMessage("Số điện thoại không hợp lệ");

            RuleFor(x => x.UserName).NotEmpty().WithMessage("User không để trống");

            RuleFor(x => x.Password).NotEmpty().WithMessage("Password không để trống")
                .MinimumLength(6).WithMessage("Password phải chứa ít nhất 6 ký tự")
                .Matches(@"((?=.*\d)(?=.*[A-Z])(?=.*\W))")
                .WithMessage("Password phải có chữ viết hoa và ký tự số và ký tự đặt biệt");

            RuleFor(x => x).Custom((request, context) =>
            {
                if (request.Password != request.ConfirmPassword)
                {
                    context.AddFailure("Mật khẩu không khớp");
                }
            });

            
        }
             
    }
}
