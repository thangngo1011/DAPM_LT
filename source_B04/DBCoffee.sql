use master
if exists (select * from sysdatabases where name = 'DBCoffee')
	drop database DBCoffee
go

create database DBCoffee
go
use DBCoffee
go

CREATE TABLE [dbo].[AdminUser] (
    [ID]           INT            NOT NULL,
    [NameUser]     NVARCHAR (50) NULL,
    [RoleUser]     NVARCHAR (50) NULL,
    [PasswordUser] NCHAR (50)     NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

--Bang Category
CREATE TABLE [dbo].[Category] (
    [Id]       INT            IDENTITY (1, 1) NOT NULL,
    [IDCate]   NCHAR (20)     NOT NULL,
    [NameCate] NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([IDCate] ASC)
);
--Bang Customer
CREATE TABLE [dbo].[Customer] (
    [IDCus]    INT            IDENTITY (1, 1) NOT NULL,
    [NameCus]  NVARCHAR (50) NULL,
    [PhoneCus] NVARCHAR (15)  NULL,
    [EmailCus] NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([IDCus] ASC)
);

--Bang Product
CREATE TABLE [dbo].[Product] (
    [ProductID]     INT             IDENTITY (1, 1) NOT NULL,
    [NamePro]       NVARCHAR (50)  NULL,
    [DecriptionPro] NVARCHAR (1000)  NULL,
    [Category]      NCHAR (20)      NULL,
    [Price]         DECIMAL (20, 3) NULL,
    [ImagePro]      NVARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([ProductID] ASC),
    CONSTRAINT [FK_Pro_Category] FOREIGN KEY ([Category]) REFERENCES [dbo].[Category] ([IDCate])
);
--Bang OrderPro
CREATE TABLE [dbo].[OrderPro] (
    [ID]               INT            IDENTITY (1, 1) NOT NULL,
    [DateOrder]        DATE           NULL,
    [IDCus]            INT            NULL,
    [AddressDeliverry] NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([IDCus]) REFERENCES [dbo].[Customer] ([IDCus])
);

--Bang OrderDetail
CREATE TABLE [dbo].[OrderDetail] (
    [ID]        INT        IDENTITY (1, 1) NOT NULL,
    [IDProduct] INT        NULL,
    [IDOrder]   INT        NULL,
    [Quantity]  INT        NULL,
    [UnitPrice] FLOAT (53) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([IDProduct]) REFERENCES [dbo].[Product] ([ProductID]),
    FOREIGN KEY ([IDOrder]) REFERENCES [dbo].[OrderPro] ([ID])
);



------AdminUser
Insert into AdminUser (ID, NameUser, RoleUser, PasswordUser)
	values (1, 'Phung', 'Quanly', '1122334455')
Insert into AdminUser (ID, NameUser, RoleUser, PasswordUser)
	values (2, 'Nhu', 'ThuKy', '5544332211')



------Customer
Insert into Customer (NameCus, PhoneCus, EmailCus)
	values (N'Trần Phi Phụng', '0901729455', 'tranphiphung@gmail.com')
Insert into Customer (NameCus, PhoneCus, EmailCus)
	values (N'Đoàn Quỳnh Như', '0913678345', 'Quynhnhu@gmail.com')


------Category
Insert into Category (IDCate, NameCate)
    Values(N'CTS', N'Cà phê Arabica')
Insert into Category (IDCate, NameCate)
    Values(N'CNTVP', N'Cà phê Bourbon')
Insert into Category (IDCate, NameCate)
    Values(N'CDB', N'Cà phê Typica')
Insert into Category (IDCate, NameCate)
    Values(N'CTG', N'Cà phê Robusta')
Insert into Category (IDCate, NameCate)
    Values(N'CATBM', N'Cà phê Culi')
Insert into Category (IDCate, NameCate)
    Values(N'MCCC', N'Cà phê Cherry')
select * from Category

--------Product
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cà phê Kona', N'Cà phê Kona được sản xuất ở Hawaii, đặc biệt là trên đảo Hawaii (Big Island), và được biết đến với hương vị ngọt ngào và đầy đặn.', N'CDB', 175, '/Content/images/img1.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Bourbon Pink', N'Cà phê Bourbon Pink có hương vị mềm mại và thường có hương thơm của trái cây đỏ và cam', N'CDB', 180, '/Content/images/img2.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Bourbon Amarello', N'Cà phê Bourbon Amarello thường có hương vị mềm mại và hương thơm của cam và cam quýt', N'CDB', 175, '/Content/images/img3.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cà phê Colombian Typica', N'Cà phê này được trồng ở Colombia và thường có hương vị mềm mại, cân bằng, và có độ acid cao', N'CDB', 245, '/Content/images/img4.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cà phê Espresso Robusta', N'Cà phê Robusta thường được sử dụng trong cà phê espresso để tạo ra lớp bọt mousse đặc biệt và hương vị mạnh mẽ', N'CDB', 155, '/Content/images/img5.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cà phê Cameroon Robusta', N'Cà phê Robusta từ Cameroon thường có hương vị mạnh và độ đắng, thường được sử dụng để tạo ra cà phê espresso.', N'CDB', 250, '/Content/images/img6.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cà phê Culi Chồn', N'Cà phê Culi Chồn, hay còn gọi là cà phê chồn, được sản xuất bằng cách cho chồn ăn và sau đó thu thập hạt cà phê từ phân của chúng. Loại này có hương vị đặc biệt và độ đắng nhẹ', N'CDB', 245, '/Content/images/img7.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cà phê Cascara', N'Cascara là một loại đồ uống được làm từ trái cây cà phê Cherry đã được sấy khô. Nó có hương vị ngọt ngào và thường được nấu thành trà.', N'CDB', 180, '/Content/images/img8.jpg')

Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cà phê Cascara', N'Cascara là một loại đồ uống được làm từ trái cây cà phê Cherry đã được sấy khô. Nó có hương vị ngọt ngào và thường được nấu thành trà.', N'CDB', 180, '/Content/images/img9.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cà phê Cascara', N'Cascara là một loại đồ uống được làm từ trái cây cà phê Cherry đã được sấy khô. Nó có hương vị ngọt ngào và thường được nấu thành trà.', N'CDB', 180, '/Content/images/img10.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cà phê Cascara', N'Cascara là một loại đồ uống được làm từ trái cây cà phê Cherry đã được sấy khô. Nó có hương vị ngọt ngào và thường được nấu thành trà.', N'CDB', 180, '/Content/images/img11.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cà phê Cascara', N'Cascara là một loại đồ uống được làm từ trái cây cà phê Cherry đã được sấy khô. Nó có hương vị ngọt ngào và thường được nấu thành trà.', N'CDB', 180, '/Content/images/img12.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cà phê Cascara', N'Cascara là một loại đồ uống được làm từ trái cây cà phê Cherry đã được sấy khô. Nó có hương vị ngọt ngào và thường được nấu thành trà.', N'CDB', 180, '/Content/images/img13.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cà phê Cascara', N'Cascara là một loại đồ uống được làm từ trái cây cà phê Cherry đã được sấy khô. Nó có hương vị ngọt ngào và thường được nấu thành trà.', N'CDB', 180, '/Content/images/img14.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cà phê Cascara', N'Cascara là một loại đồ uống được làm từ trái cây cà phê Cherry đã được sấy khô. Nó có hương vị ngọt ngào và thường được nấu thành trà.', N'CDB', 180, '/Content/images/img15.jpeg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cà phê Cascara', N'Cascara là một loại đồ uống được làm từ trái cây cà phê Cherry đã được sấy khô. Nó có hương vị ngọt ngào và thường được nấu thành trà.', N'CDB', 180, '/Content/images/img16.jpeg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cà phê Cascara', N'Cascara là một loại đồ uống được làm từ trái cây cà phê Cherry đã được sấy khô. Nó có hương vị ngọt ngào và thường được nấu thành trà.', N'CDB', 180, '/Content/images/img17.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cà phê Cascara', N'Cascara là một loại đồ uống được làm từ trái cây cà phê Cherry đã được sấy khô. Nó có hương vị ngọt ngào và thường được nấu thành trà.', N'CDB', 180, '/Content/images/img18.jpg')

--------OrderPro
Insert into OrderPro (DateOrder, IDCus, AddressDeliverry)
	values ('01/01/2022', 1, N'155 Su Vạn Hạnh,q10')

--------OrderDetail
Insert into OrderDetail (IDProduct, IDOrder, Quantity, UnitPrice)
	values (1, 1, 5, 600)

	ALTER TABLE Customer
ADD UserName varchar(50), Password nvarchar(50)
