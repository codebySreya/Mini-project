CREATE DATABASE school2;
USE school2;

CREATE TABLE students2 ( id INT PRIMARY KEY, name VARCHAR(50),age INT);
ALTER TABLE students2 ADD email VARCHAR(100);
ALTER TABLE students2 MODIFY Age TINYINT;
ALTER TABLE Students2 RENAME COLUMN name TO StudentName;
ALTER TABLE Students2 DROP COLUMN email;
RENAME TABLE students2 TO student_details;
TRUNCATE TABLE student2_details;
DROP TABLE student2_details;


-- Parent table
CREATE TABLE departments2 (
    dept_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL UNIQUE
);

-- Child table with all constraints
CREATE TABLE employees1 (
    emp_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,      -- AUTO_INCREMENT + UNSIGNED
    name VARCHAR(100) NOT NULL,                          -- NOT NULL
    email VARCHAR(100) UNIQUE,                           -- UNIQUE
    age INT CHECK (age >= 18),                           -- CHECK
    dept_id INT UNSIGNED,                                -- UNSIGNED for FK
    status ENUM('Active','Inactive') DEFAULT 'Active',    -- ENUM + DEFAULT
    skills SET('Python','SQL','Java','C'),               -- SET constraint
    salary INT UNSIGNED DEFAULT 0,                       -- UNSIGNED + DEFAULT
    FOREIGN KEY (dept_id) REFERENCES departments2(dept_id)  -- FOREIGN KEY
    );

INSERT INTO departments2 (dept_name)
VALUES
('HR'),
('Finance'),
('IT'),
('Marketing'),
('Operations');

INSERT INTO employees1 (name, email, age, dept_id, status, skills, salary)
VALUES
('Rahul', 'rahul@gmail.com', 25, 1, 'Active', 'Python,SQL', 30000),
('Anjali', 'anjali@gmail.com', 22, 1, 'Active', 'Java,C', 28000),
('Vijay', 'vijay@gmail.com', 29, 2, 'Inactive', 'Python,Java', 35000),
('Meera', 'meera@gmail.com', 21, 3, 'Active', 'SQL', 26000),
('Sanjay', 'sanjay@gmail.com', 30, 2, 'Active', 'Python,SQL,Java', 40000);

SELECT * FROM employees1;
SELECT * FROM departments2;
desc employees;
SELECT name,salary from employees1;
SELECT * FROM employees1 WHERE age > 25;
SELECT * FROM employees1 WHERE age > 25 AND status = 'Active';

UPDATE employees1 SET age = 35 WHERE emp_id = 1;
UPDATE employees1 SET name = 'Rahul Kumar',status = 'Inactive' WHERE emp_id =1;
UPDATE employees1 SET status = 'Inactive' WHERE emp_id IN (1,3);
UPDATE employees1 SET city = 'Unknown' WHERE city IS NULL;

DELETE FROM employees1 WHERE emp_id = 1;
set sql_safe_updates=0;
DELETE FROM employees1 WHERE age < 18;
SET sql_safe_updates = 0;
DELETE FROM employees1 WHERE emp_id IN (3, 5);
DELETE FROM students WHERE city IS NULL;

truncate table employees1;
drop table employees1;

SELECT DISTINCT status FROM employees1;
SELECT name AS employee_name FROM employees1;


SELECT salary + 1000 FROM employees1;
SELECT salary - 500 FROM employees1;
SELECT salary * 2 FROM employees1;
SELECT salary / 2 FROM employees1;
SELECT salary % 2 FROM employees1;  

SELECT * FROM employees1 WHERE salary = 30000;
SELECT * FROM employees1 WHERE salary != 30000;
SELECT * FROM employees1 WHERE salary > 30000;
SELECT * FROM employees1 WHERE salary < 25000;
SELECT * FROM employees1 WHERE salary >= 40000;
SELECT * FROM employees1 WHERE salary <= 28000;

SELECT * FROM employees1 WHERE salary > 28000 AND dept_id = 2;
SELECT * FROM employees1 WHERE dept_id = 1 OR dept_id = 3;
SELECT * FROM employees1 WHERE NOT status = "Inactive" ;
SELECT * FROM employees1;

SELECT * FROM employees1 WHERE email IS NULL;
SELECT * FROM employees1 WHERE email IS NOT NULL;

SELECT * FROM employees1 WHERE status IN ('Active');
SELECT * FROM employees1 WHERE status NOT IN ('Active');

SELECT * FROM employees1 WHERE salary BETWEEN 20000 AND 40000;
SELECT * FROM employees1 WHERE salary NOT BETWEEN 30000 AND 40000;

select * from employees1;
SELECT name,salary FROM employees1 ORDER BY salary DESC LIMIT 2;
SELECT * FROM employees1 ORDER BY name DESC;
SELECT * FROM employees1 ORDER BY salary DESC, name ASC;

SELECT * FROM employees1 LIMIT 3;
SELECT * FROM employees1 LIMIT 2, 3; 

create table workers1 (emp_id int auto_increment primary key,
name varchar(50),salary int);
insert into workers1 (name,salary) values ('Rahul',30000),('Anju',45000),('Deepak',45000),('Meera',38000),
('Arjun',60000);
select * from workers1;
select * from workers1 order by name Asc;
select * from workers1 order by name asc,salary desc;

SELECT COUNT(*) FROM employees1;
SELECT SUM(salary) FROM employees1;
SELECT AVG(salary) FROM employees1;
SELECT MAX(salary) FROM employees1;
SELECT MIN(salary) FROM employees1;

select * from departments2;
SELECT dept_id,COUNT(emp_id) AS total_employees
FROM employees1
GROUP BY dept_id;

SELECT dept_id, AVG(salary) AS avg_salary
FROM employees1
GROUP BY dept_id;

SELECT dept_id, SUM(salary) AS total_salary
FROM employees1
GROUP BY dept_id;

SELECT dept_id, MAX(salary) AS highest_salary
FROM employees1
GROUP BY dept_id;

SELECT status, COUNT(emp_id) AS count_status
FROM employees1
GROUP BY status;


SELECT dept_id, COUNT(emp_id) AS total_employees
FROM employees1
GROUP BY dept_id
HAVING COUNT(emp_id) >= 2;

SELECT dept_id, AVG(salary) AS avg_salary
FROM employees1
GROUP BY dept_id
HAVING AVG(salary) > 30000;

SELECT dept_id, SUM(salary) AS total_salary
FROM employees1
GROUP BY dept_id
HAVING SUM(salary) > 70000;

SELECT dept_id, MAX(salary) AS max_salary
FROM employees1
GROUP BY dept_id
HAVING MAX(salary) > 35000;

SELECT dept_id, MIN(salary) AS min_salary
FROM employees1
GROUP BY dept_id
HAVING MIN(salary) >= 25000;

create table sales1(sales_id int auto_increment primary key,
salesman varchar(50),region varchar(50),amount int);
insert into sales (salesman,region,amount) values 
("Rahul","North",5000),("Rahul","North",7000),("Meera","South",6000),("Meera","South",9000),("Arjun","East",4000),
("Arjun","East",3000),("Anju","West",10000),("Anju","West",8000);
select * from sales1;

-- total sales made by each salesperson?
-- display salesperson details whose totalsales is above 10,000

SELECT salesman, SUM(amount) AS total_sales
FROM sales1
GROUP BY salesman
HAVING SUM(amount) > 10000;

-- total number of transactions done in each region
SELECT region, COUNT(*) AS total_transactions
FROM sales1
GROUP BY region;

-- region where avg sales is above 8000
SELECT region, AVG(amount) AS avg_sales
FROM sales1
GROUP BY region
HAVING AVG(amount) > 8000;

-- each salespersons single highest sales amount
SELECT salesman, MAX(amount) AS highest_sale
FROM sales1
GROUP BY salesman;

drop table employees1;
drop table departments1;

-- JOINS

CREATE TABLE IF NOT EXISTS departments1 (
dept_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
dept_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS teachers (
teacher_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE,
dept_id INT UNSIGNED,                
subjects SET('Math','Physics','Chemistry','Biology','English','CS'),
hire_date DATE,
  FOREIGN KEY (dept_id) REFERENCES departments1(dept_id)
);

INSERT INTO departments1(dept_name) VALUES
('Mathematics'),
('Physics'),
('Computer Science');

INSERT INTO teachers (name, email, dept_id, subjects, hire_date) VALUES
('Anita Sharma', 'anita@example.com', 1, 'Math', '2021-06-15'),
('Ramesh Kumar', 'ramesh@example.com', 2, 'Physics', '2020-09-01'),
('Sneha Menon', 'sneha@example.com', 3, 'CS,Math', '2019-01-10'),
('Ajay Nair', 'ajay@example.com', NULL, 'English', '2022-02-20'),
('Priya Singh', 'priya@example.com', 3, 'CS', '2023-07-05');

use school;
select * from departments;
select * from teachers;

-- INNER JOIN
SELECT
t.teacher_id,
t.name AS teacher_name,
t.email,
d.dept_name AS department1
FROM teachers t
INNER JOIN departments1 d
ON t.dept_id = d.dept_id;

-- LEFT JOIN
SELECT
  t.teacher_id,
  t.name AS teacher_name,
  d.dept_name AS department
FROM teachers t
LEFT JOIN departments1 d
  ON t.dept_id = d.dept_id;

-- RIGHT JOIN

SELECT
  d.dept_id,
  d.dept_name   AS department1,
  t.teacher_id,
  t.name        AS teacher_name
FROM teachers t
RIGHT JOIN departments1 d
  ON t.dept_id = d.dept_id;

-- FULL JOIN

SELECT 
t.teacher_id, t.name AS teacher_name, d.dept_name
FROM teachers t
LEFT JOIN departments1 d
ON t.dept_id = d.dept_id
UNION
SELECT 
t.teacher_id, t.name AS teacher_name, d.dept_name
FROM teachers t
RIGHT JOIN departments d
ON t.dept_id = d.dept_id;

-- UNION AND UNION ALL

CREATE TABLE students1 (
name VARCHAR(50));
INSERT INTO students1 (name) VALUES('Rahul'),('Anita'),('John'),('Meera');

CREATE TABLE participants1 (
 name VARCHAR(50));
INSERT INTO participants1 (name) VALUES('John'),('Anita'),('Suresh'),('Divya');
SELECT * FROM students1;
SELECT * FROM participants1;

SELECT name FROM students1
UNION
SELECT name FROM participants1;

SELECT name FROM students1
UNION ALL
SELECT name FROM participants1;

select name,Lower(name) from teachers;

DELIMITER &&
CREATE FUNCTION add_numbers(a INT, b INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN a + b;
END &&

DELIMITER ;
SELECT add_numbers(10, 20);
SELECT add_numbers(100,589);


DELIMITER $$
CREATE FUNCTION calculate_bonus(sal INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN sal * 0.10;
END $$

DELIMITER ;

SELECT name, salary, calculate_bonus(salary) AS bonus
FROM employees;

DELIMITER $$
CREATE FUNCTION is_adult(age INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    IF age >= 23 THEN
        RETURN 'Adult';
    ELSE
        RETURN 'Minor';
    END IF;
END $$
DELIMITER ;

SELECT name, age, is_adult(age) AS category
FROM employees;

DROP function is_adult;

DELIMITER $$
CREATE FUNCTION annual_salary(monthly INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN monthly * 12;
END $$
DELIMITER ;

SELECT name,salary, annual_salary(salary) AS yearly_salary
FROM employees;


DELIMITER $$
CREATE PROCEDURE get_teachers()
BEGIN
    SELECT * FROM teachers;
END $$
DELIMITER ;

CALL get_teachers();


DELIMITER $$
CREATE PROCEDURE get_teachers_by_dept(IN dep_id INT)
BEGIN
    SELECT * FROM teachers
    WHERE dept_id = dep_id;
END $$
DELIMITER ;

CALL get_teachers_by_dept(3);


DELIMITER $$
CREATE PROCEDURE count_teachers(OUT total INT)
BEGIN
    SELECT COUNT(*) INTO total FROM teachers;
END $$
DELIMITER ;

CALL count_teachers(@result);
SELECT @result;

select * from teachers;
DELIMITER $$
CREATE PROCEDURE add_teacher(
    IN tname VARCHAR(50),
    IN temail VARCHAR(50),
    IN d_id INT
)
BEGIN
    INSERT INTO teachers (name, email, dept_id)
    VALUES (tname, temail, d_id);
END $$
DELIMITER ;

CALL add_teacher('Manoj', 'manoj@example.com', 2);
CALL add_teacher('Arun','arun@gmail.com',3);

SELECT name, salary FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT AVG(salary) FROM employees;

SELECT name FROM employees
WHERE dept_id = (SELECT dept_id FROM departments1 WHERE dept_name = 'HR');


SELECT name FROM teachers
WHERE dept_id IN (
    SELECT dept_id
    FROM departments
    WHERE dept_name LIKE '%Science%' );


SELECT name, salary FROM employees WHERE salary >= ANY ( SELECT 
salary FROM employees WHERE dept_id = 3 );

SELECT 
salary FROM employees WHERE dept_id = 3;

SELECT name, salary FROM employees WHERE salary > ALL ( SELECT 
salary FROM employees WHERE dept_id = 3 );


-- Views
-- simple views
Select * from employees;

CREATE VIEW employee_basic_view AS
SELECT name, salary
FROM employees;

SELECT * FROM employee_basic_view;

CREATE VIEW teacher_subject_view AS
SELECT name, subjects
FROM teachers;

SELECT * FROM teacher_subject_view;

-- complex views

CREATE VIEW teacher_department_view AS
SELECT t.name AS teacher_name, d.dept_name
FROM teachers t
JOIN departments d ON t.dept_id = d.dept_id;

SELECT * FROM teacher_department_view;

CREATE VIEW department_teacher_count AS
SELECT dept_id, COUNT(*) AS total_teachers
FROM teachers
GROUP BY dept_id;

SELECT * FROM department_teacher_count;

CREATE TABLE employee1 (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    dept VARCHAR(50)
);

DELIMITER $$
CREATE TRIGGER before_uppercase_name
BEFORE INSERT ON employee1
FOR EACH ROW
BEGIN
    SET NEW.name = UPPER(NEW.name);
END $$
DELIMITER ;

INSERT INTO employee1 (name, dept)
VALUES ('rahul kumar', 'IT');
INSERT INTO employee1 (name, dept)
VALUES ('diya philp', 'IT');

SELECT * FROM employee1;

drop trigger before_uppercase_name;
drop table employee1;

CREATE TABLE employee_delete_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    name VARCHAR(100),
    deleted_at DATETIME );

DELIMITER $$
CREATE TRIGGER after_delete_employee
AFTER DELETE ON employee1
FOR EACH ROW
BEGIN
    INSERT INTO employee_delete_log (emp_id, name, deleted_at)
    VALUES (OLD.emp_id, OLD.name, NOW());
END $$
DELIMITER ;

DELETE FROM employee1
WHERE emp_id = 1;

SELECT * FROM employee_delete_log;
SELECT * FROM employee1;

-- TCL

SET autocommit = 0;

START TRANSACTION;
UPDATE employees SET salary = salary + 3000 WHERE emp_id = 1;

SAVEPOINT s1;
UPDATE employees SET salary = salary + 2000 WHERE emp_id = 2;

ROLLBACK TO s1;   -- Undoes 2nd update only
COMMIT;          -- Saves first update permanently

SELECT * FROM employees;

SELECT *
FROM employees e
JOIN departments1 d ON e.dept_id = d.dept_id
WHERE d.dept_name = 'IT';

SELECT * FROM employees WHERE salary > 30000;


