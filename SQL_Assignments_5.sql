 
 --(University DataBase Management System)

--Task 1:-
--1.Create University Database give any University name you want
CREATE DATABASE PUNE_Univercity

--2. Under this University Create four tables and each table should have following three Column named as:-
--	A. College_Table
--		College_ID(PK)
--		College_Name
--  	College_Area

CREATE TABLE College_Table(College_ID INT PRIMARY KEY, College_Name VARCHAR(MAX), College_Area VARCHAR(MAX))
SELECT * FROM College_Table

--	B. Department_Table
--		Dept_ID(PK)
--		Dept_Name
--		Dept_Facility
CREATE TABLE Department_Table(Dept_ID INT PRIMARY KEY, Dept_Name VARCHAR(MAX), Dept_Facility VARCHAR(MAX))
SELECT * FROM Department_Table
	
--	C. Professor_Table
--		Professor_ID(PK)
--		Professor_Name
--		Professor_Subject
CREATE TABLE Professor_Table(Professor_ID INT PRIMARY KEY, Professor_Name VARCHAR(MAX), Professor_Subject VARCHAR(MAX))
SELECT * FROM Professor_Table

--	D. Student_Table
--		Student_ID(PK)
--		Student_Name
--		Student_Stream
CREATE TABLE Student_Table(Student_ID INT PRIMARY KEY, Student_Name VARCHAR(MAX), Student_Stream VARCHAR(MAX))
SELECT * FROM Student_Table

--3. Apply foreign key on Department key from College_table
ALTER TABLE Department_Table
ADD CONSTRAINT fk_Department_Table
FOREIGN KEY (Dept_ID)
REFERENCES College_Table(College_ID)

--4. Apply foreign Key on Student_Table from Professor_Table
ALTER TABLE Student_Table
ADD CONSTRAINT fk_Student_Table
FOREIGN KEY (Student_ID)
REFERENCES Professor_Table(Professor_ID)

--5. Insert atleast 10 Records in each table
insert into College_Table values
(101,'SINHAGAD','PUNE'),
(102,'YCC','NAGPUR'),
(103,'RAISONI','NAGPUR'),
(104,'ZULELAL','NAGPUR'),
(105,'VYWS','BADNERA'),
(106,'PCOE','NAGPUR'),
(107,'GOVT.ENGG','NAGPUR'),
(108,'MKSSS','Karve Nagar'),
(109,'IIT','BANGLOR'),
(110,'MET','NASHIK')
select * from College_Table

insert into Department_Table values
(101,'Computer Science', 'Lab A'),
(102,'Electrical Engineering', 'Lab B'),
(103,'Mechanical Engineering', 'Lab C'),
(104,'Mathematics', 'Library'),
(105,'Physics', 'Observatory'),
(106,'Chemistry', 'Lab D'),
(107,'Biology', 'Greenhouse'),
(108,'Business Administration', 'Conference Room'),
(109,'English Literature', 'Library'),
(110,'History', 'Archive Room')
select * from Department_Table

insert into Professor_Table values
(101,'Dr. Smith', 'Computer Science'),
(102,'Prof. Johnson', 'Electrical Engineering'),
(103,'Dr. Williams', 'Mechanical Engineering'),
(104,'Prof. Davis', 'Mathematics'),
(105,'Dr. Miller', 'Physics'),
(106,'Prof. Brown', 'Chemistry'),
(107,'Dr. Wilson', 'Biology'),
(108,'Prof. Taylor', 'Business Administration'),
(109,'Dr. Jones', 'English Literature'),
(110,'Prof. Moore', 'History')
select * from Professor_Table

insert into Student_Table values
(101,'Alice Johnson', 'Computer Science'),
(102,'Bob Smith', 'Electrical Engineering'),
(103,'Charlie Davis', 'Mechanical Engineering'),
(104,'Diana Miller', 'Mathematics'),
(105,'Eva Brown', 'Physics'),
(106,'Frank Wilson', 'Chemistry'),
(107,'Grace Taylor', 'Biology'),
(108,'Henry Jones', 'Business Administration'),
(109,'Ivy Moore', 'English Literature'),
(110,'Jack Robinson', 'History')
select * from Student_Table


--Task 2:-
--1.	Give the information of College_ID and College_name from College_Table
SELECT College_ID, College_name from College_Table

--2.	Show  Top 5 rows from Student table.
SELECT TOP (5) [Student_ID]
      ,[Student_Name]
      ,[Student_Stream]
  FROM [PUNE_Univercity].[dbo].[Student_Table]

--3.	What is the name of  professor  whose ID  is 5
select * from Professor_Table
select professor_name from Professor_Table where Professor_ID=105

--4.	Convert the name of the Professor into Upper case
select UPPER(professor_name)'Upper_Case_professor_name' from Professor_Table

--5.	Show me the names of those students whose name is start with a
SELECT Student_Name FROM Student_table WHERE Student_Name LIKE 'A%'

--6.	Give the name of those colleges whose end with a
SELECT college_Name FROM college_table WHERE college_Name LIKE '%A'

--7.	 Add one Salary Column in Professor_Table
ALTER TABLE professor_table ADD salary INT
SELECT * FROM Professor_Table

--8.	Add one Contact Column in Student_table
ALTER TABLE Student_table ADD Contact INT
SELECT * FROM Student_Table

--9.	Find the total Salary of Professor 
update Professor_Table set salary=45000 where Professor_ID=101
update Professor_Table set salary=50000 where Professor_ID=102
update Professor_Table set salary=55000 where Professor_ID=103
update Professor_Table set salary=60000 where Professor_ID=104
update Professor_Table set salary=65000 where Professor_ID=105
update Professor_Table set salary=70000 where Professor_ID=106
update Professor_Table set salary=80000 where Professor_ID=107
update Professor_Table set salary=90000 where Professor_ID=108
update Professor_Table set salary=95000 where Professor_ID=109
update Professor_Table set salary=200000 where Professor_ID=110
select * from Professor_Table

select sum(salary)'Total Salary' from Professor_Table

--10.	Change datatype of any one column of any one Table
alter table Professor_Table alter column salary bigint



--Task 3:-
--1.	Show first 5 records from Students table and Professor table Combine
select *from Student_Table
select * from Professor_Table

select top(5) * from Student_Table
union 
select top(5) * from Professor_Table

--2.	Apply Inner join on all 4 tables together
select * from College_Table ct 
inner join department_table dt on ct.College_ID=dt.Dept_ID 
inner join Professor_Table pt on dt.Dept_ID=pt.Professor_ID 
inner join Student_Table st on pt.Professor_ID=st.Student_ID

--3.	Show Some null values from Department table and Professor table.
select * from Department_Table where Dept_id is null
select * from Professor_Table where Professor_ID is null

--4.	Create a View from College Table  and give those records whose college name starts with C
select * from College_Table

create view college_name_start_with_C as
select college_name from College_Table where College_Name like 'C%'

select * from college_name_start_with_C

--5.	Create Stored Procedure  of Professor table whatever customer ID will be given by user it should show whole records of it.
create procedure proc_professor_table
@profe_id int
as
begin
select * from Professor_Table where Professor_ID= @profe_id
end

execute proc_professor_table 108

--6.	Rename the College_Table to College_Tables_Data.
EXEC sp_rename 'College_Table', 'College_Tables_Data'


