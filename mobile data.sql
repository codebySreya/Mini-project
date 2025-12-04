CREATE DATABASE mobiles;
USE mobiles;
CREATE TABLE products(product_id INT,product_name VARCHAR(50),price FLOAT,brand_name VARCHAR(50));
INSERT into products values
(1, 'Pixel 7a', 42000, 'Google'),
(2, 'Galaxy M34', 20500, 'Samsung'),
(3, 'Galaxy M14', 13000, 'Samsung'),
(4, 'Pixel 3', 22000, 'Google'),
(5, 'Pixel 8 Pro', 110000, 'Google'),
(6, 'Galaxy S23 Ultra', 135000, 'Samsung'),
(7, 'Galaxy S23', 75000, 'Samsung'),
(8, 'iPhone 14 Pro', 125000, 'Apple'),
(9, 'Galaxy Z Flip4', 55000, 'Samsung'),
(10, 'Galaxy A34', 30000, 'Samsung'),
(11, 'iPhone 13', 55000, 'Apple'),
(12, 'OnePlus 10 Pro', 59000, 'OnePlus'),
(13, 'Redmi Note 12', 19000, 'Redmi'),
(14, 'Galaxy S22 Ultra', 85000, 'Samsung'),
(15, 'iPhone 12', 45000, 'Apple'),
(16, 'Redmi Note 8 Pro', 16000, 'Redmi'),
(17, 'iPhone 8', 40000, 'Apple'),
(18, 'Galaxy Z Flip5', 102000, 'Samsung'),
(19, 'iPhone 15', 85000, 'Apple'),
(20, 'OnePlus 6T', 25000, 'OnePlus'),
(21, 'OnePlus Open', 140000, 'OnePlus'),
(22, 'Redmi Note 12 Pro', 30000, 'Redmi'),
(23, 'OnePlus 8T', 36000, 'OnePlus'),
(24, 'vivo V21', 31000, 'vivo'),
(25, 'Galaxy Z Fold5', 165000, 'Samsung'),
(26, 'vivo X80 Pro', 80000, 'vivo'),
(27, 'Galaxy M34', 20500, 'Samsung'),
(28, 'Galaxy Z Fold4', 140000, 'Samsung'),
(29, 'OnePlus 11', 60000, 'OnePlus'),
(30, 'vivo X90 Pro', 90000, 'vivo'),
(31, 'iPhone 15 Pro', 140000, 'Apple'),
(32, 'Redmi Note 10S', 17000, 'Redmi'),
(33, 'Galaxy A14', 18000, 'Samsung'),
(34, 'Redmi K50i', 22500, 'Redmi'),
(35, 'iPhone 14', 62000, 'Apple'),
(36, 'Galaxy S23 Plus', 95000, 'Samsung'),
(37, 'Galaxy S21', 28000, 'Samsung'),
(38, 'OnePlus N20', 15000, 'OnePlus'),
(39, 'OnePlus 11R', 40000, 'OnePlus'),
(40, 'Redmi Note 10 Pro Max', 19000, 'Redmi'),
(41, 'Galaxy S20 Ultra', 65000, 'Samsung'),
(42, 'iPhone 6', 25000, 'Apple'),
(43, 'iPhone 14 Plus', 80000, 'Apple'),
(44, 'vivo T2', 17000, 'vivo'),
(45, 'iPhone 14 Pro Max', 130000, 'Apple'),
(46, 'Redmi Note 11', 15500, 'Redmi'),
(47, 'Pixel 8', 81000, 'Google'),
(48, 'iPhone 13 Pro', 120000, 'Apple'),
(49, 'iPhone 12 Pro', 110000, 'Apple'),
(50, 'iPhone 15 Pro Max', 155000, 'Apple'),
(51, 'OnePlus 9', 38000, 'OnePlus'),
(52, 'iPhone 7 Plus', 43000, 'Apple'),
(53, 'Redmi Note 11T', 18500, 'Redmi'),
(54, 'vivo V29 Pro', 43000, 'vivo'),
(55, 'OnePlus 10R', 28000, 'OnePlus'),
(56, 'iPhone 15 Plus', 98000, 'Apple'),
(57, 'Redmi A2', 7300, 'Redmi'),
(58, 'Pixel 7', 59000, 'Google'),
(59, 'Galaxy Z Flip3', 50000, 'Samsung'),
(60, 'OnePlus Nord', 22000, 'OnePlus'),
(61, 'ROG Phone3', 55000, 'ASUS'),
(62, 'Zenfone Max Pro M1', 15000, 'ASUS'),
(63, 'Zenfone 2', 23000, 'ASUS'),
(64, 'Zenfone 4', 6500, 'ASUS'),
(65, 'ROG 5s', 64000, 'ASUS'),
(66, 'Xperia XA1 Plus', 21000, 'Sony'),
(67, 'Xperia Z2', 35000, 'Sony'),
(68, 'Xperia E4', 9500, 'Sony'),
(69, 'Xperia Z3 Plus', 55000, 'Sony'),
(70, 'Xperia XZ2', 75000, 'Sony');
SELECT*FROM products;
select product_name,brand_name from products;
select *from products where price >50000;
select product_name from products where brand_name='apple';
select product_name,price from products  where price between 150000 and 200000;
select brand_name from products where brand_name LIKE "A%";
select brand_name from products where brand_name like "%e";
select price from products where price like "1%";
select brand_name from products where brand_name like "%p%";
select* from products where price like"1%";
select*from products where brand_name in("Redmi","Asus","Vivo");
select brand_name from products;
select distinct(brand_name)from products;
select*from products where price>100000 and product_id<10;
select*from products where price>100000 or product_id<10;
select*from products where product_id<10;
select* from products where not  product_id<10;







