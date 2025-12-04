-- 1. Create Database

CREATE DATABASE classes;
USE classes;

-- 2. Students Table

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT CHECK(age >= 18),
    city VARCHAR(50) DEFAULT 'Unknown',
    course VARCHAR(100)
);
SELECT*FROM students;

INSERT INTO students (name, age, city,course) VALUES
('Riya', 18, 'mumbai','Psycology'),
('Amal Raj', 22, 'Kochi','Python'),
('Sreya', 23, 'banglore','Data Analitics'),
('Hima', 20, 'Trivandrum','Cyber Security'),
('Dhanush', 26, 'Goa','FULL STACK'),
('Arjun Kumar', 19,'Chennai', 'B.Sc Computer Science'),
('Meera Nair', 20,' Kochi','BBA'),
('Rahul Singh', 22,'Bengaluru', 'B.Tech IT'),
('Priya Suresh', 21, 'Coimbatore','BA English'),
('Deepak R', 23, 'Hyderabad', 'B.Com'),
('Sneha Thomas', 19,'Mumbai','BCA'),
('Karthik M', 24,'Pune','MBA'),
('Divya Rani', 20,'Delhi','B.Sc Data Science'),
('Vishal Raj', 25,'Chennai','M.Sc Mathematics'),
('Ananya Iyer', 22,'Trivandrum','B.Tech Electronics');
select*FROM students;

-- 3. Courses Table

CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) UNIQUE
);

INSERT INTO courses (course_name) VALUES 
('Psycology'), ('Python'), ('Data Analitics'),('Cyber Security'),('FULL STACK'),('B.Sc Computer Science'),('BBA'),('B.Tech IT'),
('BA English'),('B.Com'),('BCA'),('MBA'),('B.Sc Data Science'),('M.Sc Mathematics'),('B.Tech Electronics');

-- 4. Enrollments Table (FK)

CREATE TABLE enrollments (
    enroll_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    FOREIGN KEY(student_id) REFERENCES students(student_id),
    FOREIGN KEY(course_id) REFERENCES courses(course_id)
);

INSERT INTO enrollments (student_id, course_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 1),
(5, 2),
(5, 4),
(2, 3),
(3, 5),
(3, 2),
(2, 1),
(3, 4),
(4, 4),
(5, 5),
(2, 2),
(1, 4);


-- 5. Orders Table (for JOIN practice)

CREATE TABLE order1 (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,student_name varchar(50),course varchar(50),
    amount INT,
    FOREIGN KEY(student_id) REFERENCES students(student_id)
);

INSERT INTO order1 (student_id,student_name,course, amount) VALUES
(1, 'Riya', 'Psycology',5000),
(1, 'Amal Raj','Python', 7000),
(2, 'Sreya','Data Analitics',8000),
(4, 'Hima','Cyber Security',1200),
(3, 'Dhanush','FULL STACK', 4000),
(2, 'Arjun Kumar','B.Sc Computer Science',12000),
(4, 'Meera Nair','BBA',9000),
(4, 'Rahul Singh','B.Tech IT',13000),
(5, 'Priya Suresh','BA English',8000),
(2, 'Deepak R','B.Com',6000),
(1, 'Sneha Thomas','BCA',9000),
(3, 'Karthik M','MBA',25000),
(3, 'Divya Rani','B.Sc Data Science',13000),
(4, 'Vishal Raj','M.Sc Mathematics',9000),
(5, 'Ananya Iyer','B.Tech',20000);
select*from order1;

-- 6. Accounts Table (for Transactions)

CREATE TABLE accounts (
    acc_id INT PRIMARY KEY,
    name VARCHAR(50),
    balance INT
);

INSERT INTO accounts VALUES
(1, 'Account A', 5000),
(2, 'Account B', 6000),
(3, 'Account C', 4000),
(4, 'Account A', 5000),
(5, 'Account H', 6000),
(6, 'Account B', 8000),
(7, 'Account E', 7000),
(8, 'Account A', 5000),
(9, 'Account D', 6000),
(10,'Account C', 1000),
(11,'Account A', 2000),
(12,'Account D', 5000),
(13,'Account C', 4000),
(14,'Account B', 3000),
(15,'Account A', 2000);



-- SECTION 1 — Basic SQL, WHERE, ORDER BY, LIMIT

-- Display all details from the students table.

-- Show students older than 20 years.

-- Display only student names and cities.

-- Show students whose name starts with 'A'.

-- Get students whose age is between 20 and 23.

-- Display students from the city 'Kochi'.

-- Sort students by age in descending order.

-- Display top 3 youngest students.

-- SECTION 2 — DISTINCT, IN, BETWEEN, NULL

-- Show unique cities from the students table.

-- Show students whose age is 19 or 23.

-- Get students NOT from Kochi.

-- Select students whose email is NULL (first add column).

-- SECTION 3 — Aggregate Functions & GROUP BY

-- Count total number of students.

-- Find the average age of students.

-- Count number of students in each city.

-- Show cities having more than 1 student.

-- SECTION 4 — JOIN Operations

-- Show student names along with their enrolled course names.

-- List students even if they are not enrolled in any course (LEFT JOIN).

-- Show course name with number of students enrolled in each.

-- Display students and their order amounts (INNER JOIN).

-- Show all students and their orders (LEFT JOIN).

-- Show all orders, even if student does not exist (RIGHT JOIN).

-- SECTION 5 — SUBQUERIES

-- Show the student with the highest order amount.

-- List students who placed at least one order.

-- List students who have NOT placed any orders.

-- Show students whose age is greater than the average age.

-- SECTION 6 — STRING, MATH & DATE FUNCTIONS

-- Convert all student names to uppercase.

-- Extract the first 3 letters from each student name.

-- Show order amount plus 18% tax.

-- Display current date and time.

-- Format order_date as “DD-MM-YYYY”.

-- SECTION 7 — DDL Commands

-- Add a new column email to students table.

-- Modify age to BIGINT.

-- Drop the column city.

-- Rename students table to learners.

-- Truncate the enrollments table.

-- SECTION 8 — Views

-- Create a view showing student name, course name, and enroll_id.

-- Display all data from the created view.

-- SECTION 9 — Stored Procedures

-- Create a stored procedure to get orders for a given student id.

-- Call the stored procedure with student_id = 1.

-- SECTION 10 — User-Defined Functions

-- Create a function that returns 10% discount on an amount.

-- Display order_id and discounted amount using the function.


-- SECTION 11 — Triggers

-- Add a column updated_at to students table.

-- Create a trigger to update updated_at whenever a student's data is modified.


-- SECTION 12 — Transactions (TCL)

-- Begin a transaction and transfer 500 from Account A to Account B.

-- Use SAVEPOINT inside the transaction.

-- Rollback to a savepoint.

-- Commit the final transaction

                        



