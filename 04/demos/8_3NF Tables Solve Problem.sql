USE BobsShoes;
GO

-- Remove any existing tables

DROP TABLE IF EXISTS Orders.OrderItems, Orders.Orders, Orders.Stock, Orders.Customers, Orders.CityStateCountry, Orders.Salutations;

CREATE TABLE Orders.Salutations (
    SalutationID int IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_Salutations_SalutationID PRIMARY KEY,
    Salutation varchar(5) NOT NULL
)

-- CREATE TABLE Orders.Customers (
--     CustID int IDENTITY(1,1) NOT NULL
--         CONSTRAINT PK_Customers_CustID PRIMARY KEY,
--     CustName nvarchar(200) NOT NULL,
--     CustStreet nvarchar(100) NOT NULL,
--     CustCity nvarchar(100) NOT NULL,
--     CustStateProv nvarchar(100) NOT NULL,
--     CustCountry nvarchar(100) NOT NULL,
--     CustPostalCode nvarchar(20) NOT NULL,
--     SalutationID int NOT NULL
--         CONSTRAINT FK_Customers_SaluationID_Salutations_SalutationID
--             REFERENCES Orders.Salutations (SalutationID)
-- );

CREATE TABLE Orders.CityStateCountry (
    AddressID int IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_CityStateCountry_AddressID PRIMARY KEY,
    CustCity nvarchar(100) NOT NULL,
    CustStreet nvarchar(100) NOT NULL,
    CustStateProv nvarchar(100) NOT NULL,
    CustCountry nvarchar(100) NOT NULL,
    CustPostalCode nvarchar(20) NOT NULL,
);

CREATE TABLE Orders.Customers (
    CustID int IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_Customers_CustID PRIMARY KEY,
    CustName nvarchar(200) NOT NULL,
    CustAddress int NOT NULL
        CONSTRAINT FK_Customers_CustAddress_CityStateCountry_AddressID
            REFERENCES Orders.CityStateCountry (AddressID),
    SalutationID int NOT NULL
        CONSTRAINT FK_Customers_SaluationID_Salutations_SalutationID
            REFERENCES Orders.Salutations (SalutationID)
);

CREATE TABLE Orders.Stock (
    StockID int IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_Stock_StockID PRIMARY KEY,
    StockSKU char(8) NOT NULL,
    StockSize varchar(10) NOT NULL,
    StockName varchar(100) NOT NULL,
    StockPrice numeric(7, 2) NOT NULL,
);

CREATE TABLE Orders.Orders (
    OrderID int IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_Orders_OrderID PRIMARY KEY,
    OrderDate date NOT NULL,
    OrderRequestedDate date NOT NULL,
    OrderDeliveryDate datetime2(0) NULL,
    CustID int NOT NULL --,
        CONSTRAINT FK_Orders_CustID_Customers_CustID
            FOREIGN KEY REFERENCES Orders.Customers (CustID),
    OrderIsExpedited bit NOT NULL
);

CREATE TABLE Orders.OrderItems (
    OrderItemID int IDENTITY(1,1) NOT NULL
        CONSTRAINT PK_OrderItems_OrderItemID PRIMARY KEY,
    OrderID int NOT NULL --,
        CONSTRAINT FK_OrderItems_OrderID_Orders_OrderID
            FOREIGN KEY REFERENCES Orders.Orders (OrderID),
    StockID int NOT NULL --,
        CONSTRAINT FK_OrderItems_StockID_Stock_StockID
            FOREIGN KEY REFERENCES Orders.Stock (StockID),
    Quantity smallint NOT NULL,
    Discount numeric(4, 2) NOT NULL
);

RETURN;

-- Populate the tables

INSERT INTO Orders.Salutations (Salutation)
VALUES ('Mr.'), ('Miss'), ('Mrs.')

INSERT INTO Orders.CityStateCountry (
    CustStreet,
    CustCity,
    CustStateProv,
    CustCountry,
    CustPostalCode)
VALUES
    ('1 Main St', 'Golgafrincham', 'GuideShire', 'UK', '1MSGGS'),
    ('42 Cricket St.', 'Islington', 'Greater London', 'UK', '42CSIGL')

INSERT INTO Orders.Customers (
    CustName,
    CustAddress,
    SalutationID)
VALUES
    ('Arthur Dent',1, 1),
    ('Trillian Astra',2, 2)

INSERT INTO Orders.Stock (
    StockSKU,
    StockName,
    StockSize,
    StockPrice)

VALUES
    ('OXFORD01', 'Oxford', '10_D', 50.),
    ('BABYSHO1', 'BabySneakers', '3', 20.),
    ('HEELS001', 'Killer Heels', '7', 75.)

INSERT INTO Orders.Orders(
    OrderDate,
    OrderRequestedDate,
    CustID,
    OrderIsExpedited)

VALUES
    ('20190301', '20190401', 1, 0),
    ('20190301', '20190401', 2, 0)

INSERT INTO Orders.OrderItems(
    OrderID,
    StockID,
    Quantity,
    Discount)

VALUES
    (1, 1, 1, 20.),
    (2, 3, 1, 20.)

SELECT * FROM Orders.Salutations;
SELECT * FROM Orders.Customers;
SELECT * FROM Orders.Stock;
SELECT * FROM Orders.Orders;
SELECT * FROM Orders.OrderItems;
SELECT * FROM Orders.CityStateCountry;

-- Can't insert an order item with a non-existent orderid

INSERT INTO Orders.OrderItems(
    OrderID,
    StockID,
    Quantity,
    Discount)
VALUES (42,42,42,42.)

