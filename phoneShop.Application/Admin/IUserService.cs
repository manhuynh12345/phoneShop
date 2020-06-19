using phoneShop.ViewModels.Admin;
using phoneShop.ViewModels.Common;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace phoneShop.Application.Admin
{
    public interface IUserService
    {
        Task<ApiResult<string>> Login(LoginRequest request);
        Task<ApiResult<bool>> Register(RegisterRequest request);
        Task<ApiResult<PagedResult<UserViewModel>>> GetUsersPaging(GetUserPagingRequest request);
        Task<ApiResult<UserViewModel>> GetById(int id);
        Task<ApiResult<bool>> Update(int id, UserUpdateRequest request);
        Task<ApiResult<bool>> Delete(int id);
    }
}
