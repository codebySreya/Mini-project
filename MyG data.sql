CREATE DATABASE MyG;
USE MyG;

-- Customers Table
CREATE TABLE Customer1 (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Email VARCHAR(150),
    Phone_no bigint,
    City VARCHAR(50),
    Country VARCHAR(50),
    SignupDate DATE
);
INSERT INTO Customer1 (CustomerID, FullName, Email,Phone_no, City, Country, SignupDate) VALUES
(1, 'Beena Kumar', 'beena@gmail.com','9895555555', 'Kerala', 'India', '2025-01-12'),
(2, 'Sheena', 'sheena@gmail.com', '8889994445','Puna','India', '2025-02-15'),
(3, 'Aby john', 'john@gmail.com','9999966666','Mumbi', 'India', '2025-11-10'),
(4, 'Pooja', 'pooja@gmail.com', '8866775544','Kerala', 'India', '2025-12-22'),
(5, 'freddy', 'fredy.m@gmail.com','9898989898','Delhi','India', '2025-12-18');

-- Products Table
CREATE TABLE Products2(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(150),
    Category VARCHAR(50),
    Brand VARCHAR(50),
    Price DECIMAL(10,2)
);
INSERT INTO Products2(ProductID, ProductName, Category,Brand, Price) VALUES
(101, 'Smartphone X', 'Electronics','Vivo', 45000),
(102, 'Office Chair', 'Furniture','Maoori', 8500),
(103, 'Bluetooth Speaker', 'Electronics','Redmi', 3500),
(104, 'Running Shoes', 'Footwear','Bata', 2200),
(105, 'LED Monitor 24"', 'Electronics','Havells', 12000);



-- Orders Table
CREATE TABLE Orders1(
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    OrderStatus VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customer1(CustomerID)
);
INSERT INTO Orders1 (OrderID, CustomerID, OrderDate, OrderStatus) VALUES
(10001, 1, '2022-01-10', 'Delivered'),
(10002, 2, '2022-01-12', 'Shipped'),
(10003, 3, '2022-01-13', 'Delivered'),
(10004, 1, '2022-01-14', 'Pending'),
(10005, 5, '2022-01-16', 'Delivered');

-- Order Items Table
CREATE TABLE OrderItems(
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
 Quantity INT,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders1(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products2(ProductID)
);
INSERT INTO OrderItems (OrderItemID, OrderID, ProductID, Quantity, TotalAmount) VALUES
(1, 10001, 101, 1, 45000),
(2, 10001, 103, 2, 7000),
(3, 10002, 104, 1, 2200),
(4, 10003, 102, 1, 8500),
(5, 10004, 105, 1, 12000);
select*from Customer1;
