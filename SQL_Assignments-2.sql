use Order_Stores_Data
--Q1) Create   Database Name as Order_Stores_Data 
CREATE DATABASE Order_Stores_Data

--Q2) Create two Table names as Orders_Table and Stores_Table

USE Order_Stores_Data

CREATE TABLE Orders_Table(OrderDate DATE, 
Region VARCHAR(225),	
Rep VARCHAR(225), 
Order_Item VARCHAR(225), 
Units INT, 
Unit_Cost DECIMAL(10,2), 
Total_Price DECIMAL(10,2),	
Order_Id INT PRIMARY KEY)

SELECT * FROM Orders_Table 

CREATE TABLE Stores_Table(Store_Id INT PRIMARY KEY,	
StoreType VARCHAR(225),
Assortment INT,	
CompetitionDistance INT,	
[Month] INT,
[Year] INT,	
PromoInterval VARCHAR (225))

SELECT * FROM Stores_Table

--Q3) Insert All records present here in the Orders_table and Stores_Table.
INSERT INTO Orders_table VALUES 
('1/6/21', 'East', 'Aruna', 'Pencil', 95, 1.99, 189.05, 1),
('1/23/21', 'Central', 'Kivell', 'Eraser',50, 19.99, 999.50, 2),
('2/9/21',	'Central', 'Ganesh', NULL, 36, 4.99, 179.64, 3),
('2/26/21',	'Central',	'Payal', NULL, 27, 19.99, 539.73, 4),
('3/15/21',	'West',	'Sorvino', NULL, 56, 2.99, 167.44,5),
('4/1/21',	'East',	'Hitesh',	'Pencil', 60, 4.99, 299.40, 6),
('4/18/21',	'Central', 'Akshita', NULL,	75, 1.99, 149.25, 7),
('5/5/21',	'Central', 'Ruchika', 'Books', 90, 4.99, 449.10, 8),
('5/22/21',	'West',	'Surbhi', NULL, 32,	1.99, 63.68, 9),
('6/8/21',	'East',	'Jones', 'Suitcase', 60, 8.99, 539.40, 10)

SELECT * FROM Orders_table

INSERT INTO Stores_Table VALUES
(1,	'c', 35, 1270, 9, 2008,	'Jan'),
(2,	'a', 24, 570, 11, 2007, 'Feb'),
(3,	'a', 22, 14130, 12, 2006, 'Mar'),
(4,	'c', 13, 620, 9, 2009, 'NULL'),	
(5,	'a', 14, 29910,	4, 2015, 'May'),
(6,	'a', 20, 310, 12, 2013, 'June'),
(7,'a',	25,	24000, 4, 2013, NULL),	
(8,	'a', 15, 7520, 10, 2014, 'Aug'),
(9,	'a', 26, 2030,	8, 2000, NULL),
(10, 'a', 45, 3160,	9, 2009, 'Oct')

SELECT * FROM Stores_Table
SELECT * FROM Orders_table

--Q3) Make Order_Id  Column as Primary Key.
ALTER TABLE Orders_table
ADD PRIMARY KEY (Order_Id);

--Q4) Add one Column Name  as Store_Names and insert the records given above in Stores table.
ALTER TABLE Stores_Table
ADD Store_Names VARCHAR(255);

UPDATE Stores_Table
SET Store_Names = CASE Store_Id
WHEN 1 THEN 'Car'
WHEN 2 THEN 'Bikes'
WHEN 3 THEN 'Hardware'
WHEN 4 THEN 'Electrics'
WHEN 5 THEN 'Fibers'
WHEN 6 THEN 'Elastics'
WHEN 7 THEN 'Books'
WHEN 8 THEN 'Shoes'
WHEN 9 THEN 'Clothes'
WHEN 10 THEN 'Scraps'
END;

SELECT * FROM Stores_Table

--Q5) Make Stored_Id as a Foreign Key with reference too Orders_Table 
ALTER TABLE Stores_Table
ADD CONSTRAINT FK_Stores_Orders FOREIGN KEY (Store_Id) REFERENCES Orders_Table(Order_Id);

--Q6) Update the missing  records in the Order_item Column in Order_table missing records are given in this sheet
UPDATE Orders_Table
SET Order_Item = CASE Order_Id
WHEN 3 THEN 'Compass'
WHEN 4 THEN 'Torch'
WHEN 5 THEN 'Phone'
WHEN 7 THEN 'Laptop'
WHEN 9 THEN 'Box'
END
WHERE Order_Id IN (3, 4, 5, 7, 9);

SELECT * FROM Stores_Table
SELECT * FROM Orders_table

--Q7) Update the missing records in the PromoInterval Column in Stores Table.
UPDATE Stores_Table
SET PromoInterval = CASE Store_Id
WHEN 4 THEN 'Apr'
WHEN 7 THEN 'Jul'
WHEN 9 THEN 'Sep'
END
WHERE Store_Id IN (4, 7, 9);

SELECT * FROM Stores_Table
SELECT * FROM Orders_table

--Q8) Rename the column name  of Assortment to Store_Nos in Stores_Table.
EXEC sp_rename 'Stores_Table.Assortment', 'Store_Nos', 'COLUMN';


SELECT * FROM Stores_Table
SELECT * FROM Orders_table
--Q9) Rename the column name  of Order_Item to Item_name  and Rep Column as Customers_name in Orders_Table.
EXEC sp_rename 'Orders_Table.Order_Item', 'Item_name', 'COLUMN';
EXEC sp_rename 'Orders_Table.Rep', 'Customers_name', 'COLUMN';



--Q10) Sort the Unit Cost of Orders_table in Descding order and Total column in Ascending order.
SELECT * FROM Orders_Table
ORDER BY Unit_Cost DESC, Total_Price ASC;

--Q11) Convert Customers_name to Cus_Name  and find how many  Cus_Name in each region.
SELECT Region, 
COUNT(DISTINCT Customers_name) AS Cus_Name_Count
FROM Orders_Table
GROUP BY Region;


--Q12) Find the sum of Total_Price Column and Unit Cost  in Orders_Table 
SELECT 
SUM(Total_Price) AS Total_Price_Sum, 
SUM(Unit_Cost) AS Unit_Cost_Sum
FROM Orders_Table;

--Q13) Show me OrderDate, Unit Cost, StoreType and Year in One table and names that table as Order_Stores_Table.
SELECT OT.OrderDate, OT.Unit_Cost, ST.StoreType, ST.Year
INTO Order_Stores_Table 
FROM Orders_Table OT
join Stores_Table ST
on OT.Order_Id=ST.Store_Id

SELECT * FROM Order_Stores_Table
SELECT * FROM Stores_Table
SELECT * FROM Orders_table


--Q14)  Give me Order_Item  and Region whose Order_Id is 4 , 5, 6 ,9
SELECT Item_name, Region, Order_Id
FROM Orders_table
WHERE Order_Id IN (4, 5, 6, 9);

--Q15) Show me year  whose ComptetitionDistance is 29910  , 310 , 3160
SELECT Year, CD
FROM Stores_Table
WHERE CD IN (29910, 310, 3160);

--Q16)  Give me that Item_name whose  Total_Price is greater than 200 and less than 400
SELECT Order_Item
FROM Orders_Table
WHERE Total_Price > 200 AND Total_Price < 400;


--Q17) Rename the CompetitionDistance as CD and find the total CD in Stores_Table.
-- Rename the CompetitionDistance column to CD
EXEC sp_rename 'Stores_Table.CD', 'CD', 'COLUMN';

-- Find the total CD
SELECT SUM(CD) AS Total_CD
FROM Stores_Table;

--Q18) What is the Total Count of Stores_Type and CD columns
SELECT COUNT(StoreType) AS Total_StoreType,
COUNT(CD) AS Total_CD
FROM Stores_Table;

--Q19) Apply the Cross Join in  Orders_Table and Stores_Table.
SELECT *
FROM Orders_Table
CROSS JOIN Stores_Table;

--Q20) DROP both the databases
DROP TABLE Orders_Table;
DROP TABLE Stores_Table;

DROP DATABASE Order_Stores_Data ;
