using phoneShop.ViewModels.Admin;
using phoneShop.ViewModels.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace phoneShop.AdminApp.Services
{
    public interface IUserApiClient
    {
        Task<ApiResult<string>> Login(LoginRequest request);

        Task<ApiResult<PagedResult<UserViewModel>>> GetUsersPagings(GetUserPagingRequest request);

        Task<ApiResult<bool>> RegisterUser(RegisterRequest registerRequest);

        Task<ApiResult<bool>> UpdateUser(int id, UserUpdateRequest request);

        Task<ApiResult<UserViewModel>> GetById(int id);

        Task<ApiResult<bool>> DeleteUser(int id);
    }
}
