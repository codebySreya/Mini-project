CREATE DATABASE school1;
USE school1;
CREATE TABLE students2(student_ID INT,student_name varchar(50),Subject varchar(50),marks float);
INSERT INTO students2(student_ID,student_name,Subject,marks)
values(1,"mini","Maths",45),
(2,"Ram","Malayalam",30),
(3,"Sree","Hindi",40),
(4,"Rahman","Science",35);
select*from students2;
select student_id from students2;
alter table students2 rename to students_x;
show  tables;
alter table students_x rename column marks to makrs_new;
select*from students_x;
alter table students_x add teacher_name varchar(50);
select*from students_x;
set sql_safe_updates=0;
update students_x
set teacher_name='Simi'
where student_id= 1;
set sql_safe_updates= 1;
set sql_safe_updates=1;
select*from students_x;
drop table students_x;
show tables;
show databases;
drop database school1;
show databases;




