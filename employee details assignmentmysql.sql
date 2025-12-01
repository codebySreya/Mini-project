CREATE  DATABASE Employee;
USE Employee;
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    name VARCHAR(100)
);
CREATE TABLE locations (
    location_id INT PRIMARY KEY,
    location_name VARCHAR(100)
);
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
select distinct salary
from employees;
select name,age as employee_age,salary as employee_salary from employees;
select*from employees
where salary >50000 and hire_date <'2016-01-01';
set sql_safe_updates=0;
update employees
set designation='data scientist'
where designation is null;
select*from employees
order by department_id asc,salary desc;
select*from employees
where year(hire_date)=2018
order by hire_date
limit 5;
select sum(salary)as total_salary
from employees
where department_id=(
select department_id
from departments
where name ='finance');
select min(age) as minimum_age from employees;
INSERT INTO locations (location_id, location_name)
VALUES (1, 'New York'), (2, 'London'), (3, 'Mumbai');
select l.location_name ,max(e.salary) as max_salary from
employees e join locations l on e.location_id=l.location_id
group by l.location_name;

SELECT 
    Designation,
    AVG(Salary) AS Average_Salary
FROM Employees
WHERE Designation LIKE '%Analyst%'
GROUP BY Designation;


SELECT
    Department_ID,
    COUNT(*) AS Total_Employees
FROM Employees
GROUP BY Department_ID
HAVING COUNT(*) < 3;
    SELECT 
    Location_ID,
    AVG(Age) AS Avg_Age
FROM Employees
WHERE Gender = 'F'
GROUP BY Location_ID
HAVING AVG(Age) < 30;
SELECT 
e.name as employee_name,
e.designation,
d.name as department_name,
e.location_id
FROM Employees e
INNER JOIN Department D
ON e.Department_ID= d.ID;
select
e.name as employee_name,
d.name as department_name
from employees e
right join department d
on e.department_id=d.id;



select * from employees;






