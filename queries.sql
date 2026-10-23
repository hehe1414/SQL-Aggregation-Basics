-- Task 23: SQL Aggregation Basics
-- Database: Northwind sample database (run on Microsoft SQL Server)
-- Functions practiced: COUNT, SUM, AVG, MIN, MAX, GROUP BY, NULL behavior
-- Author: Rabia


-- Query 1: How many customers are there?
SELECT COUNT(*) AS TotalCustomers
FROM Customers;


-- Query 2: How many products are there, and what is the average price?
SELECT COUNT(*) AS TotalProducts,
       AVG(Price) AS AveragePrice
FROM Products;


-- Query 3: What are the cheapest and the most expensive product prices?
SELECT MIN(Price) AS CheapestPrice,
       MAX(Price) AS HighestPrice
FROM Products;


-- Query 4: How many units were ordered in total?
SELECT SUM(Quantity) AS TotalUnitsOrdered
FROM OrderDetails;


-- Query 5: How many orders are there?
SELECT COUNT(*) AS TotalOrders
FROM Orders;


-- Query 6: How many customers are there in each country?
SELECT Country,
       COUNT(*) AS NumCustomers
FROM Customers
GROUP BY Country
ORDER BY NumCustomers DESC;


-- Query 7: Number of products and average price in each category
SELECT CategoryID,
       COUNT(*) AS NumProducts,
       AVG(Price) AS AveragePrice
FROM Products
GROUP BY CategoryID
ORDER BY CategoryID;


-- Query 8: How many orders did each employee handle?
SELECT EmployeeID,
       COUNT(*) AS OrdersHandled
FROM Orders
GROUP BY EmployeeID
ORDER BY OrdersHandled DESC;


-- Query 9: Total units ordered for each product, highest first
SELECT ProductID,
       SUM(Quantity) AS TotalUnits
FROM OrderDetails
GROUP BY ProductID
ORDER BY TotalUnits DESC;


-- Query 10: NULL behavior. A small test table with one missing (NULL) score.
-- COUNT(*) counts every row, but COUNT(Score), SUM and AVG ignore the NULL.
SELECT COUNT(*) AS AllRows,
       COUNT(Score) AS NonNullScores,
       SUM(Score) AS TotalScore,
       AVG(Score) AS AvgIgnoringNulls,
       AVG(COALESCE(Score, 0)) AS AvgNullAsZero
FROM (SELECT 10 AS Score
      UNION ALL SELECT 20
      UNION ALL SELECT NULL
      UNION ALL SELECT 30) AS TestScores;
