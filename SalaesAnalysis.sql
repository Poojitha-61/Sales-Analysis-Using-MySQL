CREATE DATABASE COMPANY;
USE COMPANY;
SELECT * FROM sales;

-- Q1. Find all orders shipped via 'Economy' mode with a total amount greater than 25,000. --
SELECT * from sales where Ship_Mode='Economy' and Total_Amount>25000;

-- Q2. Retrieve all sales data for 'Technology' category in 'Ireland' made after 2020-01-01. --
SELECT * FROM sales where Category='Technology' and Country='Ireland' and Order_Date > '2020-01-01';

-- Q3. List the top 10 most profitable sales transactions in descending order. --
SELECT * FROM sales order by Unit_Profit desc limit 10;     -- gives top 10 transactions --

SELECT * FROM sales order by Unit_Profit desc limit 10,20;  -- skips 10 records,showing next 20 records --

-- Q4. Find all customers whose name starts with'J' and ends with 'n'. --
Select Order_Id, Customer_Name from sales where Customer_Name like 'J%n';

-- Q5. Retrieve all product names that contain 'Acco' anywhere in the name. --
Select * from sales where Product_Name like '%Acco%';

-- Q6. Get the top 5 cities with the highest total sales amount. --
Select City, SUM(Total_Amount) AS Total_Sales from sales group by City order by Total_Sales desc limit 5; -- need to use alise name when we use aggregate functions --

-- Q7. Display the second set of 10 records for Customers_Name and Total_Amount in decresing order. --
Select Customer_Name, Total_Amount from sales order by Total_Amount desc limit 10, 10; -- skips first 10 records and then gives next 10 records --

-- Q8. Find the total revenue, average unit cost, and total number of orders. --
Select sum(Total_Amount) as `Total Revenue`, avg(Unit_Cost) as `average unit cost`, count(Order_ID) as `total number of orders` from sales;

-- Q9. Count unique number of regions. --
Select count(distinct(Region)) as uniq_reg from sales;

-- Q10. Find the number of orders placed by each customer. --
select Customer_Name, count(Order_ID) as Order_Count from sales group by Customer_Name order by Order_Count desc;

-- Q11. Rank 5 products based on total sales using RANK(). --
-- 4 types of RANK() are there.--
Select  Product_Name, sum(Total_Amount) as Total_Sales, RANK() over (order by sum(Total_Amount) desc) as Sales_Rank from sales group by Product_Name limit 5;



