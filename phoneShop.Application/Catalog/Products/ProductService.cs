using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using phoneShop.Application.Common;
using phoneShop.Data.EF;
using phoneShop.Data.Entities;
using phoneShop.ViewModels.Catalog.Categories;
using phoneShop.ViewModels.Catalog.Products;
using phoneShop.ViewModels.Common;
using phoneShop.ViewModels.Exceptions;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http.Headers;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace phoneShop.Application.Catalog.Products
{
    public class ProductService : IProductService
    {
        private readonly EphoneShopDbContext _context;
        private readonly IStorageService _storageService;

        public ProductService(EphoneShopDbContext context, IStorageService storageService)
        {
            _context = context;
            _storageService = storageService;
        }

        //Thêm ảnh mới vào sản phẩm
        public async Task<int> AddImage(int productId, ProductImageCreateRequest request)
        {
            var productImage = new ProductImage()
            {                
                DateCreated = DateTime.Now,
                IsDefault = request.IsDefault,
                ProductId = productId
            };

            if (request.ImageFile != null)
            {
                productImage.ImagePath = await this.SaveFile(request.ImageFile);
                productImage.FileSize = request.ImageFile.Length;
                productImage.IsDefault = request.IsDefault;
            }
            _context.ProductImages.Add(productImage);
            await _context.SaveChangesAsync();
            return productImage.Id;
        }

        //Thêm sản phẩm mới
        public async Task<int> Create(ProductCreateRequest request)
        {
            var product = new Product()
            {
                Name_Phone = request.Name_Phone,
                Description = request.Description,
                Details = request.Details,
                Price = request.Price,
                Promotion_Price = request.Promotion_Price,
                DateCreated = DateTime.Now,
                
            };
            //Luu anh
            if (request.Image != null)
            {
                product.ProductImages = new List<ProductImage>()
                {
                    new ProductImage()
                    {
                        DateCreated = DateTime.Now,
                        FileSize = request.Image.Length,
                        ImagePath = await this.SaveFile(request.Image),
                        IsDefault = true,
                    }
                };
            }
           
            _context.Products.Add(product);
            await _context.SaveChangesAsync();
            return product.Id;
        }

        //Xóa sản phẩm
        public async Task<int> Delete(int product_Id)
        {
            var product = await _context.Products.FindAsync(product_Id);
            if (product == null) throw new ShopException($"khong tim thay san pham voi : {product_Id}");

            var images = _context.ProductImages.Where(i => i.ProductId == product_Id);
            foreach (var image in images)
            {
                await _storageService.DeleteFileAsync(image.ImagePath);
            }

            _context.Products.Remove(product);

            var result = await _context.SaveChangesAsync();
            return result;
        }

        //Xóa ảnh
        public async Task<int> RemoveImage(int productId, int imageId)
        {
            var productImage = await _context.ProductImages.FindAsync(imageId);
            if (productImage == null)
                throw new Exception($"Không tìm thấy ảnh với Id  {imageId}");

            //Xóa ảnh trong thư mục image-content
            var images = _context.ProductImages.Where(i => i.ProductId == productId && i.Id == imageId);
            foreach (var image in images)
            {
                await _storageService.DeleteFileAsync(image.ImagePath);
            }

            _context.ProductImages.Remove(productImage);
            return await _context.SaveChangesAsync();
        }

        //Lấy danh sách các sản phẩm có ảnh bằng mặc định bằng true
        public async Task<PagedResult<ProductViewModel>> GetAllPaging(GetProductPagingRequest request)
        {
            //1. Lấy ra các bảng trong cơ sở dữ liệu
            var query = from p in _context.Products                       
                        join im in _context.ProductImages on p.Id equals im.ProductId where im.IsDefault == true                        
                        select new { p , im } ;
            //2. Tim kiem san pham
            if (!string.IsNullOrEmpty(request.Keyword))
                query = query.Where(x => x.p.Name_Phone.Contains(request.Keyword));
          

            //3. Phan trang san pham
            int totalRow = await query.CountAsync();

            var data = await query.Skip((request.PageIndex - 1) * request.PageSize)
                .Take(request.PageSize)
                .Select(x => new ProductViewModel()
                {
                    Id = x.p.Id,
                    Name_Phone = x.p.Name_Phone,
                    DateCreated = x.p.DateCreated,
                    Description = x.p.Description,
                    Details = x.p.Details,
                    Price = x.p.Price,
                    Promotion_Price = x.p.Promotion_Price,
                    ImagePath = _storageService.GetFileUrl(x.im.ImagePath)
                }).ToListAsync();

            var pagedResult = new PagedResult<ProductViewModel>()
            {
                TotalRecords = totalRow,
                PageSize = request.PageSize,
                PageIndex = request.PageIndex,
                Items = data
            };
            return pagedResult;
        }

        //Lấy danh sách các sản phẩm có danh mục
        public async Task<PagedResult<ProductViewModel>> GetAllPagingByCategory(GetProductByCategoryPagingRequest request)
        {
            //1. Lấy ra các bảng trong cơ sở dữ liệu
            var query = from p in _context.Products
                        join im in _context.ProductImages on p.Id equals im.ProductId
                        join pic in _context.ProductInCategories on p.Id equals pic.ProductId
                        join c in _context.Categories on pic.CategoryId equals c.Id
                        where im.IsDefault == true
                        select new { p, im, pic};
            //2. Tim kiem san pham
            if (request.CategoryId.HasValue && request.CategoryId.Value > 0)
                query = query.Where(p => p.pic.CategoryId == request.CategoryId);

            if (!string.IsNullOrEmpty(request.Keyword))
                query = query.Where(x => x.p.Name_Phone.Contains(request.Keyword));



            //3. Phan trang san pham
            int totalRow = await query.CountAsync();

            var data = await query.Skip((request.PageIndex - 1) * request.PageSize)
                .Take(request.PageSize)
                .Select(x => new ProductViewModel()
                {
                    Id = x.p.Id,
                    Name_Phone = x.p.Name_Phone,
                    DateCreated = x.p.DateCreated,
                    Description = x.p.Description,
                    Details = x.p.Details,
                    Price = x.p.Price,
                    Promotion_Price = x.p.Promotion_Price,
                    ImagePath = _storageService.GetFileUrl(x.im.ImagePath),
                    categoryId = x.pic.CategoryId
                }).ToListAsync();

            var pagedResult = new PagedResult<ProductViewModel>()
            {
                TotalRecords = totalRow,
                PageSize = request.PageSize,
                PageIndex = request.PageIndex,
                Items = data
            };
            return pagedResult;
        }

        //Lấy id sản phẩm
        public async Task<ProductViewModel> GetById(int product_Id)
        {
            var product = await _context.Products.FindAsync(product_Id);
            if (product == null)
                throw new ShopException($"Không tìm thấy sản phẩm Id:  {product_Id}");
          
            var productViewModel = new ProductViewModel()
            {
                Id = product.Id,
                Name_Phone = product.Name_Phone,
                Description = product.Description,
                Details = product.Details,
                Price = product.Price,
                Promotion_Price = product.Promotion_Price,
                DateCreated = product.DateCreated,               
            };

            return productViewModel;

        }


        public async Task<ProductViewModel> GetProductId(int product_Id)
        {
            var product = await _context.Products.FindAsync(product_Id);
            if (product == null)
                throw new ShopException($"Không tìm thấy sản phẩm Id:  {product_Id}");

            var item = (from p in _context.Products
                        join im in _context.ProductImages on product_Id equals im.ProductId
                        join pic in _context.ProductInCategories on product_Id equals pic.ProductId
                        join c in _context.Categories on pic.CategoryId equals c.Id
                        where im.IsDefault == true
                        select new { p, im, pic }).First();

            var productViewModel = new ProductViewModel()
            {
                Id = product.Id,
                Name_Phone = product.Name_Phone,
                Description = product.Description,
                Details = product.Details,
                Price = product.Price,
                Promotion_Price = product.Promotion_Price,
                DateCreated = product.DateCreated,
                ImagePath = _storageService.GetFileUrl(item.im.ImagePath),
                categoryId = item.pic.CategoryId

            };

            return productViewModel;

        }

        //Lấy id hình ảnh
        public async Task<ProductImageViewModel> GetImageById(int imageId)
        {
            var image = await _context.ProductImages.FindAsync(imageId);
            if (image == null)
                throw new ShopException($"Không tìm thấy hình ảnh Id:  {imageId}");

            var viewModel = new ProductImageViewModel()
            {                              
                Id = image.Id,
                ImagePath = image.ImagePath,
                IsDefault = image.IsDefault,
                ProductId = image.ProductId,
                DateCreated = image.DateCreated,
                FileSize = image.FileSize,
            };
            return viewModel;
        }
        
        //Lấy danh sách hình ảnh với id sản phẩm
        public async Task<List<ProductImageViewModel>> GetListImage(int productid)
        {
            return await _context.ProductImages.Where(x => x.ProductId == productid)
                .Select(i => new ProductImageViewModel()
                {                                      
                    Id = i.Id,
                    ImagePath = _storageService.GetFileUrl(i.ImagePath),
                    IsDefault = i.IsDefault,
                    ProductId = i.ProductId,
                    DateCreated = i.DateCreated,
                    FileSize = i.FileSize,
                }).ToListAsync();
        }

        //Cập nhật sản phẩm
        public async Task<int> Update(ProductUpdateRequest request)
        {
            var product = await _context.Products.FindAsync(request.Id);
            if (product == null)
                throw new ShopException($" Khong tim thay san pham co Id: {request.Id}");

            product.Name_Phone = request.Name_Phone;
            product.Description = request.Description;
            product.Details = request.Details;
            product.Price = request.Price;
            product.Promotion_Price = request.Promotion_Price;

            //Xoa anh cu trong thu muc image_content
            var images = _context.ProductImages.Where(i => i.ProductId == request.Id && i.IsDefault == true);
            foreach (var image in images)
            {
                await _storageService.DeleteFileAsync(image.ImagePath);
            }

            //Luu anh moi vao database
            if(request.Image != null)
            {
                var image = await _context.ProductImages.FirstOrDefaultAsync(i => i.ProductId == request.Id);
                if(image != null)
                {
                    image.FileSize = request.Image.Length;
                    image.ImagePath = await this.SaveFile(request.Image);
                    _context.ProductImages.Update(image);   
                }
            }
            var result = await _context.SaveChangesAsync();
            return result;

        }

        //Cập nhật hình ảnh
        public async Task<int> UpdateImage(int imageId, ProductImageUpdateRequest request)
        {
            var productImage = await _context.ProductImages.FindAsync(imageId);
            if (productImage == null)
                throw new Exception($"Không tìm thấy ảnh với Id {imageId}");

            if (request.ImageFile != null)
            {
                productImage.ImagePath = await this.SaveFile(request.ImageFile);
                productImage.FileSize = request.ImageFile.Length;
                productImage.IsDefault = request.IsDefault;
            }
            _context.ProductImages.Update(productImage);
            return await _context.SaveChangesAsync();
        }

        //Lưu hình vào file image-content
        private async Task<string> SaveFile(IFormFile file)
        {
            var originalFileName = ContentDispositionHeaderValue.Parse(file.ContentDisposition).FileName.Trim('"');
            var fileName = $"{Guid.NewGuid()}{Path.GetExtension(originalFileName)}";
            await _storageService.SaveFileAsync(file.OpenReadStream(), fileName);
            return fileName;
        }
    }
}
