-- Create database
CREATE DATABASE Shopplus;
USE Shopplus;

-- Table: Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100),
    Email VARCHAR(100),
    City VARCHAR(100),
   Phone_no bigint 
);

-- Table: Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Brand varchar(50)
);

-- Table: Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Table: OrderItems
CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert sample data
INSERT INTO Customers (CustomerName, Email, City,Phone_no) VALUES
('Meera.S', 'meera@gmail.com', 'Kerala','9293939341'),
('Sam Jone', 'samjohn@gmail.com', 'Goa','8088899231'),
('Abhijith.S', 'abhi@gmail.com', 'Chennai','9994443331'),
('Angelina.S.Praveen','Angelin@gmail.com','Mumbai',9902334567),
('Aaiden Jonathan','jonathan@gmail.com','Puna',8899966643);

INSERT INTO Products (ProductName, Category, Price,Brand) VALUES
('MicroOwaves', 'Electronics', 25000,'LG'),
('Smart Phone', 'Electronics', 20000,'Redmi'),
('Laptop', 'Electronics', 62000,'HP'),
('Bed', 'Furniture', 15000,'Maoori'),
('Home Theater','Electronics',26000,'Philips');

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2025-02-10', 65000),
(2, '2025-02-11', 30000),
(3, '2025-02-12', 75000),
(4, '2025-02-13', 25000),
(5, '2025-02-14',32000);

INSERT INTO OrderItems (OrderID, ProductID, Quantity) VALUES
(1, 1, 2),  --  Meera.S bought 1 MicroOwaves
(2, 2, 1),  -- Sam Jone bought 1 Smartphone
(3, 3, 1), -- Abhijith,S bought 1 Laptop
(4, 4, 1), -- Angelina.S.Praveen bought 1 bed
(5, 5, 1); -- Aaiden Jonathan bought 1 Home Theater
