
--Basics Questions:-
--1) Create two Databases Name :- Brands , and  Products
CREATE DATABASE Brands
CREATE DATABASE Products

--2) Create two tables in SQL Server  name  as ITEMS_Table in Brands database and PRODUCT_Table in Products database.
USE Brands
CREATE TABLE ITEMS_Table(Item_Id INT PRIMARY KEY, 
item_description VARCHAR(MAX), 
vendor_nos INT, 
vendor_name VARCHAR(MAX), 
bottle_size INT,	
bottle_price DECIMAL(10, 2))

SELECT * FROM ITEMS_Table

USE Products 
CREATE TABLE PRODUCT_Table (Product_Id INT PRIMARY KEY,	
Country VARCHAR(MAX),
Product VARCHAR(MAX),	
Units_Sold DECIMAL(10, 2),	 
Manufacturing_Price DECIMAL(10, 2), 	 
Sale_Price DECIMAL(10, 2),	 
Gross_Sales DECIMAL(10, 2), 
Sales DECIMAL(10, 2),	 
COGS DECIMAL(10, 2), 	 
Profit DECIMAL(10, 2), 	
[Date] Date,	
Month_Number INT,	 
Month_Name VARCHAR(MAX), 	
[Year] INT);

SELECT * FROM PRODUCT_Table



--3)  After Creating both the tables Add records in that tables (records are available above)
USE Brands
INSERT INTO ITEMS_Table VALUES(1, 'Travis Hasse Apple Pie',	305, 'Mhw Ltd.', 750, $9.77) 
INSERT INTO ITEMS_Table VALUES(2, 'D''X aristi Xtabentun', 391, 'Anchor Distilling (preiss Imports)', 750, $142.02)
INSERT INTO ITEMS_Table VALUES(3, 'Hiram Walker Peach Brandy', 370, 'Pernod Ricard Usa/austin Nichols', 1000, $6.50 )
INSERT INTO ITEMS_Table VALUES(4, 'Oak Cross Whisky', 305, 'Mhw Ltd', 750, $25.33)
INSERT INTO ITEMS_Table VALUES(5, 'Uv Red(cherry) Vodka', 380, 'Phillips Beverage Company',	200, $1.97)
INSERT INTO ITEMS_Table VALUES(6, 'Heaven Hill Old Style White Label', 259,	'Heaven Hill Distilleries Inc.', 750, $6.37)
INSERT INTO ITEMS_Table VALUES(7, 'Hyde Herbal Liqueur', 194, 'Fire Tail Brands Llc', 750, $5.06)
INSERT INTO ITEMS_Table VALUES(8, 'Dupont Calvados Fine Reserve', 403, 'Robert Kacher Selections', 750, $23.61)

SELECT * FROM ITEMS_Table

USE Products
INSERT INTO PRODUCT_Table VALUES (1, 'Canada', 'Carretera', 1618.5, 3.00, 20.00, 32370.00, 32370.00, 16185.00, 16185.00, '2014-01-01', 1, 'January', 2014);
INSERT INTO PRODUCT_Table VALUES (2, 'Germany', 'Carretera', 1321, 3.00, 20.00, 26420.00, 26420.00, 13210.00, 13210.00, '2014-01-01', 1, 'January', 2015);
INSERT INTO PRODUCT_Table VALUES (3, 'France', 'Carretera', 2178, 3.00, 15.00, 32670.00, 32670.00, 21780.00, 10890.00, '2014-06-01', 6, 'June', 2016);
INSERT INTO PRODUCT_Table VALUES (4, 'Germany', 'Carretera', 888, 3.00, 15.00, 13320.00, 13320.00, 8880.00, 4440.00, '2014-06-01', 6, 'June', 2017);
INSERT INTO PRODUCT_Table VALUES (5, 'Mexico', 'Carretera', 2470, 3.00, 15.00, 37050.00, 37050.00, 24700.00, 12350.00, '2014-06-01', 6, 'June', 2018);
INSERT INTO PRODUCT_Table VALUES (6, 'Germany', 'Carretera', 1513, 3.00, 350.00, 529550.00, 529550.00, 393380.00, 136170.00, '2014-12-01', 12, 'December', 2019);
INSERT INTO PRODUCT_Table VALUES (7, 'Germany', 'Montana', 921, 5.00, 15.00, 13815.00, 13815.00, 9210.00, 4605.00, '2014-03-01', 3, 'March', 2020);
INSERT INTO PRODUCT_Table VALUES (8, 'Canada', 'Montana', 2518, 5.00, 12.00, 30216.00, 30216.00, 7554.00, 22662.00, '2014-06-01', 6, 'June', 2021);

SELECT * FROM PRODUCT_Table


--4) Delete those product having the Units Sold 1618.5 , 888 and 2470.
DELETE FROM PRODUCT_Table 
WHERE Units_Sold IN (1618.5, 888, 2470)

SELECT * FROM PRODUCT_Table


--5) DROP the table and Create it again.
DROP TABLE PRODUCT_Table
SELECT * FROM PRODUCT_Table
 
USE Products
CREATE TABLE PRODUCT_Table (Product_Id INT PRIMARY KEY,	
Country VARCHAR(MAX),
Product VARCHAR(MAX),	
Units_Sold DECIMAL(10, 2),	 
Manufacturing_Price DECIMAL(10, 2), 	 
Sale_Price DECIMAL(10, 2),	 
Gross_Sales DECIMAL(10, 2), 
Sales DECIMAL(10, 2),	 
COGS DECIMAL(10, 2), 	 
Profit DECIMAL(10, 2), 	
[Date] Date,	
Month_Number INT,	 
Month_Name VARCHAR(MAX), 	
[Year] INT);

INSERT INTO PRODUCT_Table VALUES (1, 'Canada', 'Carretera', 1618.5, 3.00, 20.00, 32370.00, 32370.00, 16185.00, 16185.00, '2014-01-01', 1, 'January', 2014);
INSERT INTO PRODUCT_Table VALUES (2, 'Germany', 'Carretera', 1321, 3.00, 20.00, 26420.00, 26420.00, 13210.00, 13210.00, '2014-01-01', 1, 'January', 2015);
INSERT INTO PRODUCT_Table VALUES (3, 'France', 'Carretera', 2178, 3.00, 15.00, 32670.00, 32670.00, 21780.00, 10890.00, '2014-06-01', 6, 'June', 2016);
INSERT INTO PRODUCT_Table VALUES (4, 'Germany', 'Carretera', 888, 3.00, 15.00, 13320.00, 13320.00, 8880.00, 4440.00, '2014-06-01', 6, 'June', 2017);
INSERT INTO PRODUCT_Table VALUES (5, 'Mexico', 'Carretera', 2470, 3.00, 15.00, 37050.00, 37050.00, 24700.00, 12350.00, '2014-06-01', 6, 'June', 2018);
INSERT INTO PRODUCT_Table VALUES (6, 'Germany', 'Carretera', 1513, 3.00, 350.00, 529550.00, 529550.00, 393380.00, 136170.00, '2014-12-01', 12, 'December', 2019);
INSERT INTO PRODUCT_Table VALUES (7, 'Germany', 'Montana', 921, 5.00, 15.00, 13815.00, 13815.00, 9210.00, 4605.00, '2014-03-01', 3, 'March', 2020);
INSERT INTO PRODUCT_Table VALUES (8, 'Canada', 'Montana', 2518, 5.00, 12.00, 30216.00, 30216.00, 7554.00, 22662.00, '2014-06-01', 6, 'June', 2021);


SELECT * FROM PRODUCT_Table

--Intermediate Questions
--Big Table :--
--1) Find the Total Sale Price  and  Gross Sales
SELECT SUM(Sale_Price) AS TOTAL_SALE_PRICE, SUM(Gross_Sales) AS TOTAL_GROSS_SALES FROM PRODUCT_Table;

--2) In which year we have got the highest sales
SELECT TOP 1 Year, SUM(Sales) AS TotalSales
FROM PRODUCT_Table
GROUP BY Year
ORDER BY TotalSales DESC;

--3)  Which Product having the sales of $ 37,050.00
SELECT Product
FROM PRODUCT_Table
WHERE Sales = 37050.00;

--4) Which Countries lies between profit of $ 4,605 to $  22 , 662.00
SELECT DISTINCT Country
FROM PRODUCT_Table
WHERE Profit BETWEEN  4605 AND 22662.00;

--5) Which Product Id having the sales of $ 24 , 700.00
SELECT Product_Id
FROM PRODUCT_Table
WHERE Sales = 24700.00;

SELECT * FROM PRODUCT_Table

--Small Table :--
--1) Find the item_description having the bottle size of 750
USE Brands

SELECT item_description
FROM ITEMS_Table
WHERE bottle_size = 750;

--2) Find the vendor Name having the vendor_nos 305 , 380 , 391
SELECT vendor_name
FROM ITEMS_Table
WHERE vendor_nos IN (305, 380, 391)

--3) What is total Bottle_price 
SELECT SUM(Bottle_price) AS TotalBottlePrice
FROM ITEMS_Table;

--4) Make Primary Key to Item_id
ALTER TABLE ITEMS_Table
ADD PRIMARY KEY (Item_id);

--5) Which item id having the bottle_price of $ 5.06
SELECT Item_id
FROM ITEMS_Table
WHERE bottle_price = 5.06;


--Advance Questions:--
--1) Apply INNER, FULL OUTER, LEFT JOIN types on both the table 
-- INNER JOIN
use Brands
use Products

SELECT * FROM [Brands].dbo.ITEMS_Table
SELECT * from Products.dbo.PRODUCT_Table 

SELECT ITEMS_Table.*, PRODUCT_Table.*
FROM Brands.dbo.ITEMS_Table
INNER JOIN Products.dbo.PRODUCT_Table 
ON ITEMS_Table.Item_Id = PRODUCT_Table.Product_Id;

--FULL OUTER, 
SELECT ITEMS_Table.*, PRODUCT_Table.*
FROM Brands.dbo.ITEMS_Table
FULL OUTER JOIN Products.dbo.PRODUCT_Table 
ON ITEMS_Table.Item_Id = PRODUCT_Table.Product_Id;

--LEFT JOIN
SELECT ITEMS_Table.*, PRODUCT_Table.*
FROM Brands.dbo.ITEMS_Table
LEFT JOIN Products.dbo.PRODUCT_Table 
ON ITEMS_Table.Item_Id = PRODUCT_Table.Product_Id;


--2) Apply  OUTER  ,  RIGHT JOIN , CROSS JOIN types  on both the table 
--OUTER JOIN
SELECT ITEMS_Table.*, PRODUCT_Table.*
FROM Brands.dbo.ITEMS_Table
FULL OUTER JOIN Products.dbo.PRODUCT_Table 
ON ITEMS_Table.Item_Id = PRODUCT_Table.Product_Id;


--RIGHT JOIN 
SELECT ITEMS_Table.*, PRODUCT_Table.*
FROM Brands.dbo.ITEMS_Table
RIGHT JOIN Products.dbo.PRODUCT_Table 
ON ITEMS_Table.Item_Id = PRODUCT_Table.Product_Id;

--CROSS JOIN
SELECT ITEMS_Table.*, PRODUCT_Table.*
FROM Brands.dbo.ITEMS_Table
CROSS JOIN Products.dbo.PRODUCT_Table;

--3) Find the item_description and Product having the gross sales of 13,320.00
SELECT ITEMS_Table.item_description, PRODUCT_Table.Product
FROM Brands.dbo.ITEMS_Table
JOIN Products.dbo.PRODUCT_Table 
ON ITEMS_Table.Item_Id = PRODUCT_Table.Product_Id
WHERE PRODUCT_Table.gross_sales = 13320.00;


--4)Split the Item_description Column into Columns Item_desc1 and Item_desc2
SELECT 
    LEFT(item_description, CHARINDEX(' ', item_description) - 1) AS Item_desc1,
    RIGHT(item_description, LEN(item_description) - CHARINDEX(' ', item_description)) AS Item_desc2,
    *
FROM Brands.dbo.ITEMS_Table;

