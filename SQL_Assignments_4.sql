 
 create database Assignment_4
--Create a Student table and ADD 20 records in them

create table Students_Table(StudentID int primary key,Name varchar(max),Surname varchar(max),Birthdate date,
Gender varchar(max),Class varchar(max),Point varchar(max))

select * from Students_Table

insert into Students_Table values
(1, 'Alice', 'Johnson', '2000-03-15', 'Female', '10th Bio', 85),
(2, 'Bob', 'Smith', '2001-06-22', 'Male', '11th Sci', 78),
(3, 'Charlie', 'Davis', '1999-12-10', 'Male', '12th Phy', 92),
(4, 'Diana', 'Miller', '2002-05-18', 'Female', '9th His', 76),
(5, 'Eva', 'Brown', '1989-08-30', 'Female', '11th Che', 88),
(6, 'Frank', 'Wilson', '1998-04-05', 'Male', '12th Eng', 95),
(7, 'Grace', 'Taylor', '2003-01-25', 'Female', '9th Math', 82),
(8, 'Henry', 'Jones', '1999-09-14', 'Male', '11th Env', 79),
(9, 'Ivy', 'Moore', '2001-11-07', 'Female', '12th Sci', 90),
(10, 'Jack', 'Robinson', '1989-07-12', 'Male', '10th Bio', 87),
(11, 'Katie', 'White', '2000-02-28', 'Female', '11th Che', 93),
(12, 'Liam', 'Johnson', '1998-06-17', 'Male', '12th His', 84),
(13, 'Mia', 'Davis', '2003-09-03', 'Female', '10th Math', 76),
(14, 'Noah', 'Smith', '1999-04-20', 'Male', '11th Phy', 89),
(15, 'Olivia', 'Wilson', '2001-12-15', 'Female', '12th Eng', 94),
(16, 'Peter', 'Moore', '2002-08-08', 'Male', '10th Math', 81),
(17, 'Quinn', 'Miller', '2000-01-11', 'Female', '11th Env', 88),
(18, 'Ryan', 'Brown', '1998-07-27', 'Male', '12th Phy', 91),
(19, 'Sophia', 'Taylor', '2003-03-19', 'Female', '10th Bio', 77),
(20, 'Thomas', 'Jones', '1999-10-02', 'Male', '11th Sci', 85)

 
--Example 1:  List all the records in the student chart
select * from Students_Table

--Example 2: List the name surname and class of the student in the student table
select name,surname,class from Students_Table

--Example 3: List the gender Female (F) records in the student table
select * from Students_Table where Gender='female'

--Example 4 : List the names of each class in the way of being seen once in the student table
select Class from Students_Table group by Class

--Example 5: List the students with Female gender and the class 10Math in the student table
select * from Students_Table where Gender='female' and Class='10th Math'

--Example 6: List the names, surnames and classes of the students in the class 10Math or 10Sci in the student table

select name,surname,class from Students_Table where Class='10th math' or Class='10th sci'

--Example 7: List the students name surname and school number in the student table

select studentid,name,surname from Students_Table

--Example 8: List the students name and surname by combining them as name surname in the student table

select *,CONCAT(name , '--' , surname) 'Name_Surname' from Students_Table

--Example 9: List the students with the names starting with “A” letter in the student table

select * from Students_Table where Name like 'a%'

--Example 10: List the book names and pages count with number of pages between 50 and 200 in the book table
--Skip because Q. was ask to be Wrong


--Example 11: List the students with names Emma Sophia and Robert in the student table

select * from Students_Table where name in ('sophia','robert')

--Example 12: List the students with names starting with A D and K in the student table

select * from Students_Table where Name like 'a%' or Name like 'd%' or Name like 'k%'

--Example 13: List the names surnames classes and genders of males in 9Math or females in 9His in the student table

select name, surname,class,gender from Students_Table where (Gender='male' and Class='9th math') or 
(Gender='female' and Class='9th his')

--Example 14: List the males whose classes are 10Math or 10Bio

select * from Students_Table where Gender='male' and Class in ('10th math','10th bio')

--Example 15: List the students with birth year 1989 in the student table

select * from Students_Table where year (Birthdate)=1989