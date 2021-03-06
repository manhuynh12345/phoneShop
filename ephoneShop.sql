USE [ephoneShop]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/19/2020 2:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppRoleClaims]    Script Date: 6/19/2020 2:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AppRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppRoles]    Script Date: 6/19/2020 2:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[NormalizedName] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AppRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppUserClaims]    Script Date: 6/19/2020 2:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AppUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppUserLogins]    Script Date: 6/19/2020 2:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUserLogins](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[LoginProvider] [nvarchar](max) NULL,
	[ProviderKey] [nvarchar](max) NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
 CONSTRAINT [PK_AppUserLogins] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppUserRoles]    Script Date: 6/19/2020 2:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUserRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_AppUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppUsers]    Script Date: 6/19/2020 2:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[NormalizedUserName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[NormalizedEmail] [nvarchar](max) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AppUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppUserTokens]    Script Date: 6/19/2020 2:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUserTokens](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[LoginProvider] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AppUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/19/2020 2:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[ParentId] [int] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 6/19/2020 2:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/19/2020 2:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[mail] [nvarchar](100) NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 6/19/2020 2:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ImagePath] [nvarchar](200) NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[FileSize] [bigint] NOT NULL,
 CONSTRAINT [PK_ProductImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductInCategories]    Script Date: 6/19/2020 2:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductInCategories](
	[ProductId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_ProductInCategories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/19/2020 2:24:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name_Phone] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[Details] [nvarchar](500) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Promotion_Price] [decimal](18, 2) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200619020818_intial', N'3.1.4')
GO
SET IDENTITY_INSERT [dbo].[AppUsers] ON 

INSERT [dbo].[AppUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (1, N'admin', N'ADMIN', N'manminh@gmail.com', N'MANMINH@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEAzVAalLHOc0HPtIHCA952haJhhXJ3r3nY/XRAxYvuPaE+IBj8AXvhlRj+QYBN5WSA==', N'', N'33409507-3f44-4942-8e96-ccfba10de7d2', N'0909888888', 0, 0, NULL, 0, 0)
INSERT [dbo].[AppUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (2, N'admin1', N'admin1', N'manminh123@gmail.com', N'manminh123@gmail.com', 1, N'AQAAAAEAACcQAAAAEMVSm9ExDi3YARIoaUNQqWMhKjCp8+FN8sKVgMeFAygAz5eD9L7R+i+Da6TIgmgmtw==', N'', N'b822a379-a7bd-4dd8-80d8-6d8b97747591', N'0909777777', 0, 0, NULL, 0, 0)
INSERT [dbo].[AppUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (3, N'khai123', N'KHAI123', N'nguyenduckhai@gmail.com', N'NGUYENDUCKHAI@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEKyRBfH7BLbSmHb8u/FGzmT5Z4T+e2kBJiJ+Pr9ZesvosQdXWYb5ohPqKKIA99p7jA==', N'N7FD2I2NQWNOXX4ROONMCOVXRQVCKSHQ', N'7a00e558-113a-403d-80d1-45a2a54851f7', N'0909885764', 0, 0, NULL, 1, 0)
INSERT [dbo].[AppUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (4, N'man123', N'MAN123', N'manminh333@gmail.com', N'MANMINH333@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEIliPv4pt4cwQSC3x7GpTInbH7jzzqlPWCm7F6vzxeOCvfgDhBChff0J8AK9Ol7LsA==', N'DEEJMOHUETIN6HPXODGXR5QDKQZGIQ2M', N'17131c36-4001-4438-a23f-d7ca6322be89', N'0120774655', 0, 0, NULL, 1, 0)
INSERT [dbo].[AppUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (5, N'nhien123', N'NHIEN123', N'nguyenthaonhien@gmail.com', N'NGUYENTHAONHIEN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEKXdl+BcEFBOORdwZl4IhBo/JEPMPaGNHGrZc0blbyr7SpYTMljejfNltakrHP9wGQ==', N'TGHGLBM6FHHRLLSZ4G4LV5DW6CKEJ3KA', N'6ca4eee6-6f34-4ca6-828c-0af1c1aab062', N'0120774655', 0, 0, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[AppUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [SortOrder], [ParentId]) VALUES (1, N'IPHONE', 1, 1)
INSERT [dbo].[Categories] ([Id], [Name], [SortOrder], [ParentId]) VALUES (2, N'SAMSUNG', 1, 1)
INSERT [dbo].[Categories] ([Id], [Name], [SortOrder], [ParentId]) VALUES (3, N'NOKIA', 1, 1)
INSERT [dbo].[Categories] ([Id], [Name], [SortOrder], [ParentId]) VALUES (4, N'XIAOMI', 2, 1)
INSERT [dbo].[Categories] ([Id], [Name], [SortOrder], [ParentId]) VALUES (5, N'OPPO', 3, 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (1, 7, 2, CAST(350.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (1, 8, 1, CAST(421.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (1, 10, 1, CAST(1500.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (2, 14, 1, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (2, 15, 1, CAST(4302.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (2, 22, 1, CAST(431.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (2, 25, 1, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (3, 12, 1, CAST(2300.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (3, 14, 1, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (3, 15, 2, CAST(4302.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (3, 17, 1, CAST(1300.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (4, 6, 1, CAST(250.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (4, 8, 1, CAST(421.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [name], [Address], [Phone], [mail], [OrderDate], [Status]) VALUES (1, N'HuynhMinhMan', N'492/7 Nguyễn Thị Minh Khai', N'0987654322', N'ducphuc@gmail.com', CAST(N'2020-06-19T13:03:44.9928072' AS DateTime2), 0)
INSERT [dbo].[Orders] ([Id], [name], [Address], [Phone], [mail], [OrderDate], [Status]) VALUES (2, N'Nguyễn Quang Phúc', N'234 Nam Kỳ Nghởi Nghĩa', N'0909877777', N'quangphuc@gmail.com', CAST(N'2020-06-19T13:12:33.0466127' AS DateTime2), 2)
INSERT [dbo].[Orders] ([Id], [name], [Address], [Phone], [mail], [OrderDate], [Status]) VALUES (3, N'Dương Đức Hiếu ', N'85 Hoang Văn Thụ', N'0909999999', N'hieuduong@gmail.com', CAST(N'2020-06-19T14:11:03.0419539' AS DateTime2), 0)
INSERT [dbo].[Orders] ([Id], [name], [Address], [Phone], [mail], [OrderDate], [Status]) VALUES (4, N'Lê Thành Lâm', N'26 lý nam đế', N'0908876543', N'thanhlam@gmail.com', CAST(N'2020-06-19T14:14:15.8465755' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImages] ON 

INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (1, 6, N'e9d62ce2-9e7f-406a-ace2-48ddc25d007e.jpg', 1, CAST(N'2020-06-19T11:53:01.2760026' AS DateTime2), 20070)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (2, 6, N'32f8afcb-9449-4866-a351-d6b9142f19d4.jpg', 0, CAST(N'2020-06-19T11:58:07.9289482' AS DateTime2), 27948)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (3, 6, N'918c806c-061b-43e0-b606-a05678412da0.jpg', 0, CAST(N'2020-06-19T11:58:13.9749107' AS DateTime2), 142101)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (4, 6, N'dca10da6-17e1-444c-b5c5-e9ce07ed7e0a.jpg', 0, CAST(N'2020-06-19T11:58:21.1663113' AS DateTime2), 25729)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (5, 6, N'30cc74dd-1b84-48dd-96fa-fa0c98e3845d.png', 0, CAST(N'2020-06-19T11:58:27.9311322' AS DateTime2), 156716)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (6, 7, N'9df3195f-98c3-45d1-bc2f-06c22ed95457.jpg', 1, CAST(N'2020-06-19T12:02:29.9203449' AS DateTime2), 20055)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (7, 7, N'b2efc28e-404e-4f8b-9bf2-7d49cea77200.jpg', 0, CAST(N'2020-06-19T12:02:49.5244789' AS DateTime2), 29942)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (8, 7, N'ffcd44e6-f70a-449d-bb18-89209c7cd8e0.jpg', 0, CAST(N'2020-06-19T12:02:58.0926160' AS DateTime2), 29942)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (9, 7, N'6aa79321-55ee-42a8-bfe4-f0bd9e02dc96.jpg', 0, CAST(N'2020-06-19T12:03:06.2652741' AS DateTime2), 21176)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (10, 7, N'500e26a0-798e-4644-807c-350f0fa72b78.jpg', 0, CAST(N'2020-06-19T12:03:16.4401912' AS DateTime2), 20427)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (11, 8, N'3a38cf89-36e4-4d9a-b898-8a54d723b6c6.png', 1, CAST(N'2020-06-19T12:05:08.1110873' AS DateTime2), 47154)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (12, 8, N'bec54dd6-8143-41da-8119-4866b5325e74.jpg', 0, CAST(N'2020-06-19T12:05:17.0935063' AS DateTime2), 172249)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (13, 8, N'37541045-5e98-4ef8-8768-df67ee86d576.jpg', 0, CAST(N'2020-06-19T12:05:22.1733343' AS DateTime2), 41212)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (14, 8, N'3f778e5b-f9f6-45ff-b08e-b8d6dd920b4b.jpg', 0, CAST(N'2020-06-19T12:05:28.1836922' AS DateTime2), 11867)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (15, 8, N'34b17a6e-eef4-4f06-8a61-8ae3154eef9e.jfif', 0, CAST(N'2020-06-19T12:05:35.9105859' AS DateTime2), 2536)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (16, 9, N'dac113cc-c85b-47bf-8fc6-14e88f5381ce.png', 1, CAST(N'2020-06-19T12:08:38.9456833' AS DateTime2), 281589)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (17, 9, N'20f4c8ec-b945-440a-83a0-9e6e7eeddb79.jpg', 0, CAST(N'2020-06-19T12:08:50.7413712' AS DateTime2), 34762)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (18, 9, N'802d4b0f-f2b8-435a-873b-9e02812d1d50.jfif', 0, CAST(N'2020-06-19T12:08:57.4866097' AS DateTime2), 55213)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (19, 9, N'15319263-5340-44e3-ba81-b3927af6289b.jfif', 0, CAST(N'2020-06-19T12:09:07.2940839' AS DateTime2), 47959)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (20, 9, N'9d7a0d89-8fd9-4c2a-bda6-5e25d077eb6d.jfif', 0, CAST(N'2020-06-19T12:09:13.6332101' AS DateTime2), 77643)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (21, 10, N'caf5c0ec-a5ad-49a3-b724-083f4ec1863d.png', 1, CAST(N'2020-06-19T12:10:35.6285888' AS DateTime2), 134519)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (22, 10, N'8c7e45bf-2afa-4514-b501-2b5e18c07726.jfif', 0, CAST(N'2020-06-19T12:10:44.6716295' AS DateTime2), 99544)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (23, 10, N'78c8b18b-d034-48b5-99ec-df07cd64af94.jfif', 0, CAST(N'2020-06-19T12:10:49.1987031' AS DateTime2), 34280)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (24, 10, N'119acb65-413c-4ac9-8755-90b4e13d627b.jfif', 0, CAST(N'2020-06-19T12:10:53.8482640' AS DateTime2), 39701)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (25, 10, N'8d206beb-c3d7-40c8-ad64-8e541afa15a7.jpg', 0, CAST(N'2020-06-19T12:10:58.1932156' AS DateTime2), 47031)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (26, 11, N'c19db85e-575f-474c-8de1-4966b3fd1e75.jpg', 1, CAST(N'2020-06-19T12:12:11.0896491' AS DateTime2), 72840)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (27, 11, N'9c9b6464-e071-45d7-88c6-76499c8189a1.jpg', 0, CAST(N'2020-06-19T12:12:24.5839381' AS DateTime2), 187821)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (28, 11, N'cbc1e1ba-13ea-4722-aa59-4738d2a720aa.jpg', 0, CAST(N'2020-06-19T12:12:29.0523394' AS DateTime2), 51300)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (29, 11, N'51f18e3c-8a45-42b9-871d-330344a93b15.jpg', 0, CAST(N'2020-06-19T12:12:36.2074770' AS DateTime2), 38090)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (30, 11, N'19831097-1855-4001-8030-47d4d98cabba.jpg', 0, CAST(N'2020-06-19T12:12:41.9160070' AS DateTime2), 404466)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (31, 11, N'd4573a03-d97f-4f99-b263-e8ebb15b0b07.jpg', 0, CAST(N'2020-06-19T12:12:47.3588590' AS DateTime2), 126288)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (32, 12, N'fa554259-521a-440a-a6d5-2f2af2b701a9.webp', 1, CAST(N'2020-06-19T12:13:45.4922917' AS DateTime2), 65920)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (33, 12, N'e0bfc97d-5ca1-4ffa-86d4-872a018a7ff5.jfif', 0, CAST(N'2020-06-19T12:13:58.0413514' AS DateTime2), 84565)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (34, 12, N'228cca64-e0ad-4173-a125-5e1e36458e7e.jfif', 0, CAST(N'2020-06-19T12:14:02.2213234' AS DateTime2), 77610)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (35, 12, N'1eb7cad5-c3e1-4eec-9ace-7dfc938f93c0.webp', 0, CAST(N'2020-06-19T12:14:07.3713983' AS DateTime2), 73270)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (36, 12, N'a2146c04-9ed9-4582-9f69-6801e8d57ae2.webp', 0, CAST(N'2020-06-19T12:14:12.6836817' AS DateTime2), 76652)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (37, 12, N'504137d5-03ef-466c-b3a9-3c5f5b6609da.webp', 0, CAST(N'2020-06-19T12:14:16.6612065' AS DateTime2), 82528)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (38, 13, N'9fc19e99-ff89-4aa0-ba03-a29d5f925f79.png', 1, CAST(N'2020-06-19T12:15:20.8115823' AS DateTime2), 65325)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (39, 13, N'edf35fc0-1029-48d8-947d-3034e48bd051.jpg', 0, CAST(N'2020-06-19T12:15:31.3275264' AS DateTime2), 1405215)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (40, 13, N'185fcd6a-8c63-4305-b69c-0b20810c4f8c.webp', 0, CAST(N'2020-06-19T12:15:35.7856928' AS DateTime2), 115350)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (41, 13, N'112b97af-6849-4c1d-8db0-0e5c6672868f.webp', 0, CAST(N'2020-06-19T12:15:40.5321211' AS DateTime2), 92014)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (42, 13, N'17c993ac-1d10-4657-96d6-9fdddf614dcf.webp', 0, CAST(N'2020-06-19T12:15:45.7679331' AS DateTime2), 97898)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (43, 13, N'acc717c4-558a-4677-8690-0f9d3c26c37a.jpg', 0, CAST(N'2020-06-19T12:15:51.1023631' AS DateTime2), 88998)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (44, 14, N'd8f8ee78-40da-4eba-83fb-e78a9914f469.jpg', 1, CAST(N'2020-06-19T12:19:48.4241490' AS DateTime2), 288368)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (45, 14, N'cba892f4-2d85-4a67-98a4-d67331c3047f.jpg', 0, CAST(N'2020-06-19T12:20:04.3303682' AS DateTime2), 261997)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (46, 14, N'56bdbb9a-0b4a-49bb-af0a-e1eee646fd04.png', 0, CAST(N'2020-06-19T12:20:08.3429860' AS DateTime2), 116926)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (47, 14, N'd7739ef8-2c3c-4de6-92e2-4709ee3f5118.jpg', 0, CAST(N'2020-06-19T12:20:12.7043107' AS DateTime2), 117600)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (48, 14, N'06494591-9931-49cf-850c-f961c91c8ec0.png', 0, CAST(N'2020-06-19T12:20:18.7259624' AS DateTime2), 144540)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (49, 15, N'ce67c198-2667-4fc9-92be-60b10ad01c0d.webp', 1, CAST(N'2020-06-19T12:22:14.4511059' AS DateTime2), 200480)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (50, 15, N'd113a015-c823-4eed-9fb2-2af38414c74d.jpg', 0, CAST(N'2020-06-19T12:22:37.7447777' AS DateTime2), 52457)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (51, 15, N'48b46223-140b-43ae-b146-6ca4d0840ef8.jpg', 0, CAST(N'2020-06-19T12:22:42.7967529' AS DateTime2), 43154)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (52, 15, N'67948d17-b9a3-4e59-9bd1-e7247dddd5a7.webp', 0, CAST(N'2020-06-19T12:22:48.2586874' AS DateTime2), 11770)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (53, 15, N'5bceda9a-d50f-4c6f-9b29-7a007a1f37ad.jpg', 0, CAST(N'2020-06-19T12:22:54.3456014' AS DateTime2), 31730)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (54, 15, N'62050197-9d6f-470b-8bed-987b466c48d6.webp', 0, CAST(N'2020-06-19T12:23:02.4765698' AS DateTime2), 200480)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (55, 16, N'bda56498-a62a-48f4-9743-a4e6258d0d47.png', 1, CAST(N'2020-06-19T12:24:16.9897774' AS DateTime2), 334644)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (56, 16, N'd6c11b13-7567-4f59-ac77-885ceb9a9152.png', 0, CAST(N'2020-06-19T12:24:28.3489045' AS DateTime2), 61092)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (57, 16, N'b04c0b28-51ef-42fb-9e46-40d44292f8c0.png', 0, CAST(N'2020-06-19T12:24:34.1298624' AS DateTime2), 60481)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (58, 16, N'25d744ef-4856-4808-bec5-b9e5fbca7b22.webp', 0, CAST(N'2020-06-19T12:24:38.8257888' AS DateTime2), 16730)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (59, 16, N'5a7deec0-a204-4272-bb48-e0b9c859686c.jpg', 0, CAST(N'2020-06-19T12:25:45.0176078' AS DateTime2), 35024)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (60, 16, N'448b2398-ee32-4124-a550-1d4f5f87aca5.png', 0, CAST(N'2020-06-19T12:25:53.6685510' AS DateTime2), 249673)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (61, 17, N'6069227e-4f36-4e3a-b3c8-7f8d651cb10e.jpg', 1, CAST(N'2020-06-19T12:27:07.1673920' AS DateTime2), 53172)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (62, 17, N'1b18b255-adf8-421d-909f-ce498ba37855.jpeg', 0, CAST(N'2020-06-19T12:27:27.1733603' AS DateTime2), 17487)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (63, 17, N'1639f2b4-3a05-4d2d-96d7-33aebbd9dfd7.jpg', 0, CAST(N'2020-06-19T12:27:31.7654002' AS DateTime2), 50869)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (64, 17, N'2fa25624-9266-4de8-b715-bb8478091374.jpg', 0, CAST(N'2020-06-19T12:27:36.3969222' AS DateTime2), 58424)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (65, 17, N'45fcfef0-6523-4b65-9099-28512b55a112.webp', 0, CAST(N'2020-06-19T12:27:40.3424438' AS DateTime2), 187658)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (66, 17, N'002af2db-ce99-4ca9-b88c-f8119975de18.jpg', 0, CAST(N'2020-06-19T12:27:45.3765015' AS DateTime2), 146409)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (67, 17, N'a1d478aa-6d6c-4f6e-9400-4f0004c4ba2c.webp', 0, CAST(N'2020-06-19T12:27:49.7372881' AS DateTime2), 44370)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (68, 18, N'1328f410-4d52-40ca-91d9-63c622d3e826.webp', 1, CAST(N'2020-06-19T12:28:59.0618368' AS DateTime2), 30530)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (69, 18, N'66b0f26d-ea54-4a8b-9297-bd2a4d1f9085.webp', 0, CAST(N'2020-06-19T12:29:15.8401380' AS DateTime2), 18956)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (70, 18, N'190f4c67-ac0b-4eb0-8e56-19412b477511.webp', 0, CAST(N'2020-06-19T12:29:20.2516983' AS DateTime2), 22496)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (71, 18, N'd2389c8c-4234-4291-9690-27a8ff5e1655.jpg', 0, CAST(N'2020-06-19T12:29:24.5614314' AS DateTime2), 52830)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (72, 18, N'745ebfa2-817a-4098-b5ba-6c11007352f7.webp', 0, CAST(N'2020-06-19T12:29:28.5339661' AS DateTime2), 22496)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (73, 19, N'e61a1e79-aad6-4cfd-88cb-277767316c07.jpg', 1, CAST(N'2020-06-19T12:30:26.3602106' AS DateTime2), 37744)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (74, 19, N'3751727c-8143-40dc-8cc3-d3e66bd08155.jpg', 0, CAST(N'2020-06-19T12:30:45.2554097' AS DateTime2), 78328)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (75, 19, N'c182d16d-f931-4fa3-be05-40a1301dd291.jpg', 0, CAST(N'2020-06-19T12:30:49.4922931' AS DateTime2), 76662)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (76, 19, N'9aef02ab-b023-4a79-96a1-0079e4cd6037.jpg', 0, CAST(N'2020-06-19T12:30:54.0747355' AS DateTime2), 104688)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (77, 19, N'2fe6cd7f-d280-45cf-8fc2-ba0d499ea964.jpg', 0, CAST(N'2020-06-19T12:30:58.4714612' AS DateTime2), 34388)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (78, 19, N'1e3e4820-91b2-4b56-af45-27eea1091428.webp', 0, CAST(N'2020-06-19T12:31:03.1402476' AS DateTime2), 60124)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (79, 20, N'023b075d-37d8-4cf4-9e84-9949863f5ad3.jpg', 1, CAST(N'2020-06-19T12:32:56.8652215' AS DateTime2), 31142)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (80, 20, N'4f2eb6a3-ee97-481f-9b9e-8cb8a0b474c2.jpg', 0, CAST(N'2020-06-19T12:33:14.1424042' AS DateTime2), 29175)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (81, 20, N'b31749e4-48fa-4046-a291-2c40462cce45.jpg', 0, CAST(N'2020-06-19T12:33:18.7593664' AS DateTime2), 28734)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (82, 20, N'c6667c95-6619-4dbe-a2a8-2548224a04ad.jpg', 0, CAST(N'2020-06-19T12:33:23.2495184' AS DateTime2), 57823)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (83, 20, N'c1919e4f-7eda-46a4-837f-8a69a919300d.jpg', 0, CAST(N'2020-06-19T12:33:27.3650676' AS DateTime2), 52604)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (84, 21, N'79c543db-88c3-4162-92d8-e1a0e21447d1.png', 1, CAST(N'2020-06-19T12:35:11.4979616' AS DateTime2), 43791)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (85, 21, N'8fdab759-ebaf-49e3-a0b3-f519af2847d3.png', 0, CAST(N'2020-06-19T12:35:30.1905241' AS DateTime2), 44166)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (86, 21, N'85051ceb-900b-4a97-bf99-ac49443889a8.png', 0, CAST(N'2020-06-19T12:35:34.4912890' AS DateTime2), 59737)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (87, 21, N'145aa96e-3b1a-4cd2-8b37-97811e203d8e.png', 0, CAST(N'2020-06-19T12:35:38.4410731' AS DateTime2), 83498)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (88, 21, N'5ac1410f-e8f0-4c55-bfe4-7ab41c86257c.jpg', 0, CAST(N'2020-06-19T12:35:43.1989034' AS DateTime2), 18310)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (89, 22, N'aaed41b9-d582-45dc-ba31-210259e4a11c.webp', 1, CAST(N'2020-06-19T12:37:42.7286581' AS DateTime2), 202894)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (90, 22, N'dac88bea-acdf-4260-b46c-deaa319a1d8e.webp', 0, CAST(N'2020-06-19T12:37:58.3538472' AS DateTime2), 239198)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (91, 22, N'fda94717-b882-4f6b-b0c9-625e06a1f9fb.jpg', 0, CAST(N'2020-06-19T12:38:02.9160221' AS DateTime2), 55675)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (92, 22, N'66eba833-d2af-4474-bae3-c47d321d7b7d.png', 0, CAST(N'2020-06-19T12:38:07.1010966' AS DateTime2), 179584)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (93, 22, N'1352b4a8-80db-4929-ad1a-cfe4c296b510.png', 0, CAST(N'2020-06-19T12:38:11.3774644' AS DateTime2), 168702)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (94, 23, N'feeda211-3ebd-4689-b4fe-340e5e1974a8.jpg', 1, CAST(N'2020-06-19T12:42:07.5875991' AS DateTime2), 27612)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (95, 23, N'769d9d84-600c-4d9d-8d52-c8f068a12cd7.jpg', 0, CAST(N'2020-06-19T12:42:23.6003499' AS DateTime2), 147508)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (96, 23, N'eb1f8b62-6fe7-491d-919b-6b2f49698756.jpg', 0, CAST(N'2020-06-19T12:42:27.5831140' AS DateTime2), 24678)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (97, 23, N'ccb00ac1-faeb-4966-a8de-647be1e50497.jpg', 0, CAST(N'2020-06-19T12:42:32.4966574' AS DateTime2), 26527)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (98, 23, N'73e6862c-5489-4ce4-86d7-6d3f9ad1e94f.jpg', 0, CAST(N'2020-06-19T12:42:38.0180010' AS DateTime2), 28678)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (99, 24, N'ce459827-1cd9-455d-b26d-9cbfd37c5fa7.png', 1, CAST(N'2020-06-19T12:43:48.7257019' AS DateTime2), 70898)
GO
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (100, 24, N'8776b4e5-552b-4c0d-aba4-a84a2a66e50b.jpg', 0, CAST(N'2020-06-19T12:44:01.4134990' AS DateTime2), 43235)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (101, 24, N'7bb4a7bb-bfab-432a-8500-989b1f144043.jpg', 0, CAST(N'2020-06-19T12:44:06.9539503' AS DateTime2), 22389)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (102, 24, N'e379b0fa-0fcf-4f88-99ed-3d9487a5af71.jpg', 0, CAST(N'2020-06-19T12:44:11.6850075' AS DateTime2), 24424)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (103, 24, N'b6046470-338a-4b47-b541-25544afaa4e9.jpg', 0, CAST(N'2020-06-19T12:44:15.6116101' AS DateTime2), 11924)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (104, 25, N'1bf65c80-5ee4-4720-8564-470edece3fd0.jpg', 1, CAST(N'2020-06-19T12:45:34.7853457' AS DateTime2), 21642)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (105, 25, N'bb73e97c-fb81-4734-a12e-eb193bfdd620.jpg', 0, CAST(N'2020-06-19T12:45:53.5555517' AS DateTime2), 88158)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (106, 25, N'd4ba461a-ea66-416b-a27b-340671cd750c.jpg', 0, CAST(N'2020-06-19T12:45:58.0112881' AS DateTime2), 308568)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (107, 25, N'16221e52-1ce6-4da4-adaa-96674c386675.jpg', 0, CAST(N'2020-06-19T12:46:03.4293778' AS DateTime2), 43614)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (108, 25, N'd7b36f2c-4b19-4e4c-9ca2-ce0eca7debfa.jpg', 0, CAST(N'2020-06-19T12:46:07.4815474' AS DateTime2), 140105)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (109, 26, N'a3acab40-b17d-4314-8c14-21f134d0e5fc.webp', 1, CAST(N'2020-06-19T12:47:21.1222821' AS DateTime2), 86950)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (110, 26, N'19e28f45-6bbf-48d2-98cf-36ea1faa81bf.jpg', 0, CAST(N'2020-06-19T12:47:30.3806141' AS DateTime2), 469331)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (111, 26, N'319df4c4-50b8-46b1-bafe-2b3cc53ff56f.jpg', 0, CAST(N'2020-06-19T12:47:35.9335524' AS DateTime2), 714574)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (112, 26, N'd054e983-f1a7-4870-85ac-cf706a3821e4.jpg', 0, CAST(N'2020-06-19T12:47:40.3501796' AS DateTime2), 68699)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (113, 26, N'685d9d67-9be2-43bc-8d6c-88633042a66c.jpg', 0, CAST(N'2020-06-19T12:47:44.2803761' AS DateTime2), 102716)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (114, 27, N'be778420-22ac-4e6b-9715-f68679f2e87c.jpg', 1, CAST(N'2020-06-19T12:49:25.1008911' AS DateTime2), 58455)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (115, 27, N'715f08b8-64d9-4764-bac0-39d6feffe9c6.jpg', 0, CAST(N'2020-06-19T12:49:41.9705844' AS DateTime2), 42586)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (116, 27, N'9a967f5c-b36c-4466-80ee-ae48baaa8702.jpg', 0, CAST(N'2020-06-19T12:49:46.3706100' AS DateTime2), 43617)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (117, 27, N'9c4ae2eb-87c4-4156-87bf-bdc41596474d.jpg', 0, CAST(N'2020-06-19T12:49:51.0295155' AS DateTime2), 31003)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (118, 27, N'285e82f7-0ec1-41d6-9d50-3daa29b14091.png', 0, CAST(N'2020-06-19T12:49:55.0256311' AS DateTime2), 557185)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (119, 28, N'e593bf9f-c6fc-40cb-a4b1-f6b94ed93856.webp', 1, CAST(N'2020-06-19T12:52:54.4915349' AS DateTime2), 88730)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (120, 28, N'c321f1a4-ad0b-4551-9d54-a0385bf2ec47.jpg', 0, CAST(N'2020-06-19T12:53:09.4209187' AS DateTime2), 102619)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (121, 28, N'0b38aefd-6bbc-4d69-a66a-bb328b4b3dfc.jpg', 0, CAST(N'2020-06-19T12:53:13.4870551' AS DateTime2), 21929)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (122, 28, N'8559de91-afe2-4459-8772-fc663a5f03e2.webp', 0, CAST(N'2020-06-19T12:53:18.2432245' AS DateTime2), 227382)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (123, 28, N'f4df371d-9806-4c21-b5ee-0ddcfde99b5f.webp', 0, CAST(N'2020-06-19T12:53:24.4382065' AS DateTime2), 88730)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (124, 29, N'e1f61046-7722-4566-b27b-c0cf7657a590.jpg', 1, CAST(N'2020-06-19T12:54:24.4164294' AS DateTime2), 25104)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (125, 29, N'15f69ab4-1337-4484-9a7f-1889a7711b2b.jpg', 0, CAST(N'2020-06-19T12:54:38.3213220' AS DateTime2), 132197)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (126, 29, N'c70e30c4-03ff-4996-bef7-8f676e926e69.jpg', 0, CAST(N'2020-06-19T12:55:08.6306249' AS DateTime2), 49820)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (127, 29, N'fd711725-5f65-4c8e-89b7-f09c6996775c.png', 0, CAST(N'2020-06-19T12:55:13.6693718' AS DateTime2), 196830)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (128, 29, N'7720e269-f676-4085-b6e4-2c711f9b26c5.jfif', 0, CAST(N'2020-06-19T12:55:17.8920844' AS DateTime2), 5754)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (129, 30, N'55cc39ee-6a33-483e-88a0-7940b171ed95.jpg', 1, CAST(N'2020-06-19T12:56:15.2278038' AS DateTime2), 28645)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (130, 30, N'df83351f-75fc-48a0-907c-dab2aba50e78.jfif', 0, CAST(N'2020-06-19T12:56:30.7864305' AS DateTime2), 8227)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (131, 30, N'cc403f89-96a6-41f0-b508-12966a024c12.png', 0, CAST(N'2020-06-19T12:56:34.8239242' AS DateTime2), 373625)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (132, 30, N'ce646deb-f12b-4ec9-966f-c663028a5126.jpg', 0, CAST(N'2020-06-19T12:56:38.8350683' AS DateTime2), 58118)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (133, 30, N'e2d023ef-e755-4697-b95f-e4dc66753c1c.png', 0, CAST(N'2020-06-19T12:56:43.3445063' AS DateTime2), 714195)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (134, 31, N'6809b383-e515-4a13-8502-8a6cf58766e6.jpg', 1, CAST(N'2020-06-19T12:57:46.1650733' AS DateTime2), 33661)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (135, 31, N'da5189c3-c7bc-4a10-9f7a-9902ee61f014.jpg', 0, CAST(N'2020-06-19T12:57:57.3309673' AS DateTime2), 36002)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (136, 31, N'14b11dca-9689-4d9a-a746-6894c11bedd5.jpg', 0, CAST(N'2020-06-19T12:58:03.1065238' AS DateTime2), 37095)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (137, 31, N'610bed51-5bcd-4db8-ad58-1283e33863ca.jpg', 0, CAST(N'2020-06-19T12:58:08.2602522' AS DateTime2), 62087)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (138, 31, N'168183e0-0933-43dd-a63d-166fe20dd831.jpg', 0, CAST(N'2020-06-19T12:58:12.5150890' AS DateTime2), 54977)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [IsDefault], [DateCreated], [FileSize]) VALUES (139, 31, N'49230e44-7e5b-462e-a8c5-38c56a099135.jpg', 0, CAST(N'2020-06-19T12:58:16.6867719' AS DateTime2), 67854)
SET IDENTITY_INSERT [dbo].[ProductImages] OFF
GO
INSERT [dbo].[ProductInCategories] ([ProductId], [CategoryId]) VALUES (6, 1)
INSERT [dbo].[ProductInCategories] ([ProductId], [CategoryId]) VALUES (7, 1)
INSERT [dbo].[ProductInCategories] ([ProductId], [CategoryId]) VALUES (8, 1)
INSERT [dbo].[ProductInCategories] ([ProductId], [CategoryId]) VALUES (10, 1)
INSERT [dbo].[ProductInCategories] ([ProductId], [CategoryId]) VALUES (11, 1)
INSERT [dbo].[ProductInCategories] ([ProductId], [CategoryId]) VALUES (12, 1)
INSERT [dbo].[ProductInCategories] ([ProductId], [CategoryId]) VALUES (13, 1)
INSERT [dbo].[ProductInCategories] ([ProductId], [CategoryId]) VALUES (14, 2)
INSERT [dbo].[ProductInCategories] ([ProductId], [CategoryId]) VALUES (15, 2)
INSERT [dbo].[ProductInCategories] ([ProductId], [CategoryId]) VALUES (17, 2)
INSERT [dbo].[ProductInCategories] ([ProductId], [CategoryId]) VALUES (18, 2)
INSERT [dbo].[ProductInCategories] ([ProductId], [CategoryId]) VALUES (19, 2)
INSERT [dbo].[ProductInCategories] ([ProductId], [CategoryId]) VALUES (20, 5)
INSERT [dbo].[ProductInCategories] ([ProductId], [CategoryId]) VALUES (21, 5)
INSERT [dbo].[ProductInCategories] ([ProductId], [CategoryId]) VALUES (22, 5)
INSERT [dbo].[ProductInCategories] ([ProductId], [CategoryId]) VALUES (23, 4)
INSERT [dbo].[ProductInCategories] ([ProductId], [CategoryId]) VALUES (24, 4)
INSERT [dbo].[ProductInCategories] ([ProductId], [CategoryId]) VALUES (25, 4)
INSERT [dbo].[ProductInCategories] ([ProductId], [CategoryId]) VALUES (26, 4)
INSERT [dbo].[ProductInCategories] ([ProductId], [CategoryId]) VALUES (27, 4)
INSERT [dbo].[ProductInCategories] ([ProductId], [CategoryId]) VALUES (28, 3)
INSERT [dbo].[ProductInCategories] ([ProductId], [CategoryId]) VALUES (29, 3)
INSERT [dbo].[ProductInCategories] ([ProductId], [CategoryId]) VALUES (30, 3)
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name_Phone], [Description], [Details], [Price], [Promotion_Price], [DateCreated]) VALUES (6, N'iphone 5', N'iPhone 5 là điện thoại thông minh màn hình cảm ứng thế hệ thứ sáu của Apple', N'iPhone chính hãng VN/A khách hàng sẽ được yên tâm về chất lượng, do máy nguyên zin. Còn hàng xách tay thường không rõ nguồn gốc nên chất lượng chưa thật yên tâm. Do đó việc mua hàng xách tay thay vì chính hãng VN/A sẽ rủi ro hơn rất nhiều, đặc biệt là với những người ít am hiểu về công nghệ, không biết kiểm tra máy khi mua.', CAST(250.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(N'2020-06-19T11:53:01.2759965' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name_Phone], [Description], [Details], [Price], [Promotion_Price], [DateCreated]) VALUES (7, N'iphone 6s', N'iPhone 6S 16GB Like New là smartphone có thiết kế nhỏ gọn, màn hình 4.7 inch cho khả năng hiển thị sắc nét.', N'iPhone 6S 16GB Like New là phiên bản quốc tế chỉ cần gắn sim là chạy ngay. Máy được bán ra tại Di Động Việt đẹp như mới, bảo hành 6 tháng và hỗ trợ 1 đổi 1 cùng nhiều ưu đãi khác', CAST(350.00 AS Decimal(18, 2)), CAST(363.00 AS Decimal(18, 2)), CAST(N'2020-06-19T12:02:29.9186758' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name_Phone], [Description], [Details], [Price], [Promotion_Price], [DateCreated]) VALUES (8, N'iphone 7', N'iPhone 7 luôn là một dòng điện thoại được ưa chuộng nhất bởi sự ổn định với hệ điều hành iOS', N'iPhone chính hãng VN/A khách hàng sẽ được yên tâm về chất lượng, do máy nguyên zin. Còn hàng xách tay thường không rõ nguồn gốc nên chất lượng chưa thật yên tâm. Do đó việc mua hàng xách tay thay vì chính hãng VN/A sẽ rủi ro hơn rất nhiều, đặc biệt là với những người ít am hiểu về công nghệ, không biết kiểm tra máy khi mua.', CAST(421.00 AS Decimal(18, 2)), CAST(450.00 AS Decimal(18, 2)), CAST(N'2020-06-19T12:05:08.1110803' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name_Phone], [Description], [Details], [Price], [Promotion_Price], [DateCreated]) VALUES (9, N'iphone 8', N'iPhone 8 luôn là một dòng điện thoại được ưa chuộng nhất bởi sự ổn định với hệ điều hành iOS', N'iPhone chính hãng VN/A khách hàng sẽ được yên tâm về chất lượng, do máy nguyên zin. Còn hàng xách tay thường không rõ nguồn gốc nên chất lượng chưa thật yên tâm. Do đó việc mua hàng xách tay thay vì chính hãng VN/A sẽ rủi ro hơn rất nhiều, đặc biệt là với những người ít am hiểu về công nghệ, không biết kiểm tra máy khi mua.', CAST(550.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), CAST(N'2020-06-19T12:08:38.9456780' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name_Phone], [Description], [Details], [Price], [Promotion_Price], [DateCreated]) VALUES (10, N'iphone Xsmax', N'iPhone Xsmax luôn là một dòng điện thoại được ưa chuộng nhất bởi sự ổn định với hệ điều hành iOS', N'iPhone chính hãng VN/A khách hàng sẽ được yên tâm về chất lượng, do máy nguyên zin. Còn hàng xách tay thường không rõ nguồn gốc nên chất lượng chưa thật yên tâm. Do đó việc mua hàng xách tay thay vì chính hãng VN/A sẽ rủi ro hơn rất nhiều, đặc biệt là với những người ít am hiểu về công nghệ, không biết kiểm tra máy khi mua.', CAST(1500.00 AS Decimal(18, 2)), CAST(1450.00 AS Decimal(18, 2)), CAST(N'2020-06-19T12:10:35.6285835' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name_Phone], [Description], [Details], [Price], [Promotion_Price], [DateCreated]) VALUES (11, N'iphone SE', N'iPhone SE luôn là một dòng điện thoại được ưa chuộng nhất bởi sự ổn định với hệ điều hành iOS', N'iPhone chính hãng VN/A khách hàng sẽ được yên tâm về chất lượng, do máy nguyên zin. Còn hàng xách tay thường không rõ nguồn gốc nên chất lượng chưa thật yên tâm. Do đó việc mua hàng xách tay thay vì chính hãng VN/A sẽ rủi ro hơn rất nhiều, đặc biệt là với những người ít am hiểu về công nghệ, không biết kiểm tra máy khi mua.', CAST(980.00 AS Decimal(18, 2)), CAST(990.00 AS Decimal(18, 2)), CAST(N'2020-06-19T12:12:11.0896318' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name_Phone], [Description], [Details], [Price], [Promotion_Price], [DateCreated]) VALUES (12, N'iphone 11', N'iPhone 11 luôn là một dòng điện thoại được ưa chuộng nhất bởi sự ổn định với hệ điều hành iOS', N'iPhone chính hãng VN/A khách hàng sẽ được yên tâm về chất lượng, do máy nguyên zin. Còn hàng xách tay thường không rõ nguồn gốc nên chất lượng chưa thật yên tâm. Do đó việc mua hàng xách tay thay vì chính hãng VN/A sẽ rủi ro hơn rất nhiều, đặc biệt là với những người ít am hiểu về công nghệ, không biết kiểm tra máy khi mua.', CAST(2300.00 AS Decimal(18, 2)), CAST(2333.00 AS Decimal(18, 2)), CAST(N'2020-06-19T12:13:45.4922873' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name_Phone], [Description], [Details], [Price], [Promotion_Price], [DateCreated]) VALUES (13, N'iphone 11 pro', N'iPhone 11 pro luôn là một dòng điện thoại được ưa chuộng nhất bởi sự ổn định với hệ điều hành iOS', N'iPhone chính hãng VN/A khách hàng sẽ được yên tâm về chất lượng, do máy nguyên zin. Còn hàng xách tay thường không rõ nguồn gốc nên chất lượng chưa thật yên tâm. Do đó việc mua hàng xách tay thay vì chính hãng VN/A sẽ rủi ro hơn rất nhiều, đặc biệt là với những người ít am hiểu về công nghệ, không biết kiểm tra máy khi mua.', CAST(3040.00 AS Decimal(18, 2)), CAST(3041.00 AS Decimal(18, 2)), CAST(N'2020-06-19T12:15:20.8115762' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name_Phone], [Description], [Details], [Price], [Promotion_Price], [DateCreated]) VALUES (14, N'Galaxy A70', N'Galaxy A70 Plus được biết là phiên bản có cấu hình mạnh hơn ', N'Galaxy A70 Plus sở hữu thiết kế mặt trước tương tự các sản phẩm Samsung Galaxy S khác. Bạn vẫn có màn hình không viền với hai cạnh bên cong tràn. Tuy nhiên vị trí đặt camera trước đã chuyển ra trung tâm, điều này khá giống Galaxy Note 10.', CAST(200.00 AS Decimal(18, 2)), CAST(210.00 AS Decimal(18, 2)), CAST(N'2020-06-19T12:19:48.4241437' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name_Phone], [Description], [Details], [Price], [Promotion_Price], [DateCreated]) VALUES (15, N'Galaxy S10', N'Galaxy S10 Plus được biết là phiên bản có cấu hình mạnh hơn ', N'Samsung Galaxy S10 Plus sở hữu thiết kế mặt trước tương tự các sản phẩm Samsung Galaxy S khác. Bạn vẫn có màn hình không viền với hai cạnh bên cong tràn. Tuy nhiên vị trí đặt camera trước đã chuyển ra trung tâm, điều này khá giống Galaxy Note 10.', CAST(4302.00 AS Decimal(18, 2)), CAST(4500.00 AS Decimal(18, 2)), CAST(N'2020-06-19T12:22:14.4511012' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name_Phone], [Description], [Details], [Price], [Promotion_Price], [DateCreated]) VALUES (16, N'Galaxy S20', N'Galaxy S20 Plus được biết là phiên bản có cấu hình mạnh hơn', N'Samsung Galaxy S20 Plus sở hữu thiết kế mặt trước tương tự các sản phẩm Samsung Galaxy S khác. Bạn vẫn có màn hình không viền với hai cạnh bên cong tràn. Tuy nhiên vị trí đặt camera trước đã chuyển ra trung tâm, điều này khá giống Galaxy Note 10.', CAST(650.00 AS Decimal(18, 2)), CAST(750.00 AS Decimal(18, 2)), CAST(N'2020-06-19T12:24:16.9897720' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name_Phone], [Description], [Details], [Price], [Promotion_Price], [DateCreated]) VALUES (17, N'Samsung Note 10', N'Samsung Note 10 Plus được biết là phiên bản có cấu hình mạnh hơn ', N'Samsung Note 10 Plus sở hữu thiết kế mặt trước tương tự các sản phẩm Samsung Galaxy S khác. Bạn vẫn có màn hình không viền với hai cạnh bên cong tràn. Tuy nhiên vị trí đặt camera trước đã chuyển ra trung tâm, điều này khá giống Galaxy Note 10.', CAST(1300.00 AS Decimal(18, 2)), CAST(1320.00 AS Decimal(18, 2)), CAST(N'2020-06-19T12:27:07.1673867' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name_Phone], [Description], [Details], [Price], [Promotion_Price], [DateCreated]) VALUES (18, N'Galaxy A01', N'Galaxy A01 được biết là phiên bản có cấu hình mạnh hơn', N'Samsung Galaxy A01 Plus sở hữu thiết kế mặt trước tương tự các sản phẩm Samsung Galaxy S khác. Bạn vẫn có màn hình không viền với hai cạnh bên cong tràn. Tuy nhiên vị trí đặt camera trước đã chuyển ra trung tâm, điều này khá giống Galaxy Note 10.', CAST(101.00 AS Decimal(18, 2)), CAST(160.00 AS Decimal(18, 2)), CAST(N'2020-06-19T12:28:59.0618305' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name_Phone], [Description], [Details], [Price], [Promotion_Price], [DateCreated]) VALUES (19, N'Samsung A51', N'Samsung A51 được biết là phiên bản có cấu hình mạnh hơn ', N'Samsung A51 sở hữu thiết kế mặt trước tương tự các sản phẩm Samsung Galaxy S khác. Bạn vẫn có màn hình không viền với hai cạnh bên cong tràn. Tuy nhiên vị trí đặt camera trước đã chuyển ra trung tâm, điều này khá giống Galaxy Note 10.', CAST(120.00 AS Decimal(18, 2)), CAST(133.00 AS Decimal(18, 2)), CAST(N'2020-06-19T12:30:26.3602042' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name_Phone], [Description], [Details], [Price], [Promotion_Price], [DateCreated]) VALUES (20, N'Oppo Reno 3', N'Oppo Reno 3 là mẫu smartphone tầm trung vừa mới được OPPO cho ra mắt', N'Điện thoại Oppo Reno 3 gây ấn tượng với người dùng bởi thiết kế hai mặt lưng kính bóng bẩy và không kém phần sang trọng. Thiết kế này vốn đã trở nên khá phổ biến trên những chiếc smartphone cao cấp hiện nay. Song bạn không phải lo lắng về độ bền của sản phẩm khi nó được gia cố bởi khung viền kim loại chắc chắn.', CAST(320.00 AS Decimal(18, 2)), CAST(325.00 AS Decimal(18, 2)), CAST(N'2020-06-19T12:32:56.8652178' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name_Phone], [Description], [Details], [Price], [Promotion_Price], [DateCreated]) VALUES (21, N'Oppo Reno 2F', N'Oppo Reno 2F là mẫu smartphone tầm trung vừa mới được OPPO cho ra mắt', N'Điện thoại Oppo Reno 2F gây ấn tượng với người dùng bởi thiết kế hai mặt lưng kính bóng bẩy và không kém phần sang trọng. Thiết kế này vốn đã trở nên khá phổ biến trên những chiếc smartphone cao cấp hiện nay. Song bạn không phải lo lắng về độ bền của sản phẩm khi nó được gia cố bởi khung viền kim loại chắc chắn.', CAST(223.00 AS Decimal(18, 2)), CAST(263.00 AS Decimal(18, 2)), CAST(N'2020-06-19T12:35:11.4979566' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name_Phone], [Description], [Details], [Price], [Promotion_Price], [DateCreated]) VALUES (22, N'Oppo A12', N'Oppo A12 là mẫu smartphone tầm trung vừa mới được OPPO cho ra mắt', N'Điện thoại Oppo A12 gây ấn tượng với người dùng bởi thiết kế hai mặt lưng kính bóng bẩy và không kém phần sang trọng. Thiết kế này vốn đã trở nên khá phổ biến trên những chiếc smartphone cao cấp hiện nay. Song bạn không phải lo lắng về độ bền của sản phẩm khi nó được gia cố bởi khung viền kim loại chắc chắn.', CAST(431.00 AS Decimal(18, 2)), CAST(431.00 AS Decimal(18, 2)), CAST(N'2020-06-19T12:37:42.7286538' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name_Phone], [Description], [Details], [Price], [Promotion_Price], [DateCreated]) VALUES (23, N'Xiaomi F2 Pro', N'Xiaomi F2 Pro là chiếc smartphone tầm trung mới nhất của Xiaomi được nâng cấp của Xiaomi F2 Pro', N'Xiaomi F2 Pro có vẻ ngoài vô cùng nổi bật bởi mặt lưng kính bóng bẩy cùng hiệu ứng gradient. Hiệu ứng này đã và đang trở thành một trào lưu của các smartphone hiện nay. Khi nghiêng bạn có thể nhìn thấy màu sắc thay đổi ở các góc nhìn khác nhau. Do đó, khi cầm Redmi Note 9S trên tay, chẳng khác gì bạn đang cầm món đồ trang sức.', CAST(231.00 AS Decimal(18, 2)), CAST(231.00 AS Decimal(18, 2)), CAST(N'2020-06-19T12:42:07.5875830' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name_Phone], [Description], [Details], [Price], [Promotion_Price], [DateCreated]) VALUES (24, N'Mi Note 10', N'Mi Note 10 là chiếc smartphone tầm trung mới nhất của Xiaomi được nâng cấp của Mi Note 10', N'Mi Note 10 có vẻ ngoài vô cùng nổi bật bởi mặt lưng kính bóng bẩy cùng hiệu ứng gradient. Hiệu ứng này đã và đang trở thành một trào lưu của các smartphone hiện nay. Khi nghiêng bạn có thể nhìn thấy màu sắc thay đổi ở các góc nhìn khác nhau. Do đó, khi cầm Redmi Note 9S trên tay, chẳng khác gì bạn đang cầm món đồ trang sức.', CAST(321.00 AS Decimal(18, 2)), CAST(321.00 AS Decimal(18, 2)), CAST(N'2020-06-19T12:43:48.7256985' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name_Phone], [Description], [Details], [Price], [Promotion_Price], [DateCreated]) VALUES (25, N'Red Mi 9', N'Red Mi 9 là chiếc smartphone tầm trung mới nhất của Xiaomi được nâng cấp của Red Mi 9', N'Red Mi 9 có vẻ ngoài vô cùng nổi bật bởi mặt lưng kính bóng bẩy cùng hiệu ứng gradient. Hiệu ứng này đã và đang trở thành một trào lưu của các smartphone hiện nay. Khi nghiêng bạn có thể nhìn thấy màu sắc thay đổi ở các góc nhìn khác nhau. Do đó, khi cầm Redmi Note 9S trên tay, chẳng khác gì bạn đang cầm món đồ trang sức.', CAST(123.00 AS Decimal(18, 2)), CAST(123.00 AS Decimal(18, 2)), CAST(N'2020-06-19T12:45:34.7853402' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name_Phone], [Description], [Details], [Price], [Promotion_Price], [DateCreated]) VALUES (26, N'Red Mi Note 8', N'Red Mi Note 8 là chiếc smartphone tầm trung mới nhất của Xiaomi được nâng cấp của Red Mi Note 8', N'Red Mi Note 8 có vẻ ngoài vô cùng nổi bật bởi mặt lưng kính bóng bẩy cùng hiệu ứng gradient. Hiệu ứng này đã và đang trở thành một trào lưu của các smartphone hiện nay. Khi nghiêng bạn có thể nhìn thấy màu sắc thay đổi ở các góc nhìn khác nhau. Do đó, khi cầm Redmi Note 9S trên tay, chẳng khác gì bạn đang cầm món đồ trang sức.', CAST(456.00 AS Decimal(18, 2)), CAST(457.00 AS Decimal(18, 2)), CAST(N'2020-06-19T12:47:21.1222788' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name_Phone], [Description], [Details], [Price], [Promotion_Price], [DateCreated]) VALUES (27, N'Red Mi Note 9', N'Red Mi Note 9 là chiếc smartphone tầm trung mới nhất của Xiaomi được nâng cấp của Red Mi Note 9', N'Red Mi Note 9 có vẻ ngoài vô cùng nổi bật bởi mặt lưng kính bóng bẩy cùng hiệu ứng gradient. Hiệu ứng này đã và đang trở thành một trào lưu của các smartphone hiện nay. Khi nghiêng bạn có thể nhìn thấy màu sắc thay đổi ở các góc nhìn khác nhau. Do đó, khi cầm Redmi Note 9S trên tay, chẳng khác gì bạn đang cầm món đồ trang sức.', CAST(356.00 AS Decimal(18, 2)), CAST(378.00 AS Decimal(18, 2)), CAST(N'2020-06-19T12:49:25.1008875' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name_Phone], [Description], [Details], [Price], [Promotion_Price], [DateCreated]) VALUES (28, N'Nokia C2', N'Nokia C2 là smartphone được trải nghiệm phần mềm Android 9 Pie mới nhất và có giá rẻ nhất được chứng nhận Android One.', N'Nokia C2 được thiết kế tại Châu Âu, được chế tạo để đáp ứng các tiêu chuẩn chất lượng cao nhất của bạn. Thân máy được làm bằng polycarbonate cho bạn cảm giác chắc chắn và giúp sản phẩm có độ bóng cao tạo nên vẻ đẹp sang trọng cho người sử dụng.', CAST(111.00 AS Decimal(18, 2)), CAST(120.00 AS Decimal(18, 2)), CAST(N'2020-06-19T12:52:54.4915279' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name_Phone], [Description], [Details], [Price], [Promotion_Price], [DateCreated]) VALUES (29, N'Nokia 7.2', N'Nokia 7.2 là smartphone được trải nghiệm phần mềm Android 9 Pie mới nhất và có giá rẻ nhất được chứng nhận Android One.', N'Nokia 7.2 được thiết kế tại Châu Âu, được chế tạo để đáp ứng các tiêu chuẩn chất lượng cao nhất của bạn. Thân máy được làm bằng polycarbonate cho bạn cảm giác chắc chắn và giúp sản phẩm có độ bóng cao tạo nên vẻ đẹp sang trọng cho người sử dụng.', CAST(134.00 AS Decimal(18, 2)), CAST(135.00 AS Decimal(18, 2)), CAST(N'2020-06-19T12:54:24.4164263' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name_Phone], [Description], [Details], [Price], [Promotion_Price], [DateCreated]) VALUES (30, N'Nokia 8.1', N'Nokia 8.1 là smartphone được trải nghiệm phần mềm Android 9 Pie mới nhất và có giá rẻ nhất được chứng nhận Android One.', N'Nokia 8.1 được thiết kế tại Châu Âu, được chế tạo để đáp ứng các tiêu chuẩn chất lượng cao nhất của bạn. Thân máy được làm bằng polycarbonate cho bạn cảm giác chắc chắn và giúp sản phẩm có độ bóng cao tạo nên vẻ đẹp sang trọng cho người sử dụng.', CAST(236.00 AS Decimal(18, 2)), CAST(237.00 AS Decimal(18, 2)), CAST(N'2020-06-19T12:56:15.2277997' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name_Phone], [Description], [Details], [Price], [Promotion_Price], [DateCreated]) VALUES (31, N'Nokia 2.3', N'Nokia 2.3 là smartphone được trải nghiệm phần mềm Android 9 Pie mới nhất và có giá rẻ nhất được chứng nhận Android One.', N'Nokia 2.3 được thiết kế tại Châu Âu, được chế tạo để đáp ứng các tiêu chuẩn chất lượng cao nhất của bạn. Thân máy được làm bằng polycarbonate cho bạn cảm giác chắc chắn và giúp sản phẩm có độ bóng cao tạo nên vẻ đẹp sang trọng cho người sử dụng.', CAST(211.00 AS Decimal(18, 2)), CAST(212.00 AS Decimal(18, 2)), CAST(N'2020-06-19T12:57:46.1650701' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT ((1)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products_ProductId]
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD  CONSTRAINT [FK_ProductImages_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductImages] CHECK CONSTRAINT [FK_ProductImages_Products_ProductId]
GO
ALTER TABLE [dbo].[ProductInCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductInCategories_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductInCategories] CHECK CONSTRAINT [FK_ProductInCategories_Categories_CategoryId]
GO
ALTER TABLE [dbo].[ProductInCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductInCategories_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductInCategories] CHECK CONSTRAINT [FK_ProductInCategories_Products_ProductId]
GO
