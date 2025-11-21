CREATE  DATABASE Employee;
USE Employee;
CREATE TABLE Department(id INT,name VARCHAR(50));
CREATE TABLE Location(id INT,Location VARCHAR(30));
CREATE TABLE Employees(employee_id INT,employee_name VARCHAR(50),gender enum('M','F'),age INT,hire_Data DATE,designation VARCHAR(100),Department_id INT,Location_id INT,salary Decimal(10,2));
ALTER TABLE Employees ADD column email VARCHAR(100);
ALTER TABLE Employees MODIFY COLUMN designation VARCHAR(255);
ALTER TABLE Employees DROP COLUMN Age;
ALTER TABLE employees RENAME COLUMN hire_data to date_of_joining;
RENAME TABLE Department TO Departments_Info;
RENAME TABLE Location to Locations;
truncate table employees;
drop table employees;
drop database employee;
create database employee;
use employee;
create table department(id int primary key,name varchar(50) not null unique);
create table location(id int primary key,location varchar(30)not null unique);
CREATE TABLE Employees (
    ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Gender ENUM('M','F'),
    Age INT CHECK (Age >= 18),
    Hire_Date DATE DEFAULT (CURRENT_DATE),
    Designation VARCHAR(100),
    Department_ID INT,
    Location_ID INT,
    Salary DECIMAL(10,2),
    FOREIGN KEY (Department_ID) REFERENCES Department(id),
    FOREIGN KEY (Location_ID) REFERENCES Location(id)
);