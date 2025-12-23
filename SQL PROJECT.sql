create database ecommerce;
use ecommerce;

SELECT * FROM Customers;

SELECT * FROM Orders
LIMIT 10;

SELECT Product_Name
FROM Products;

SELECT COUNT(*) AS Total_Customers
FROM Customers;

SELECT *
FROM Orders
WHERE Customer_ID = 'W-131951';

SELECT DISTINCT City
FROM Customers;

SELECT *
FROM Orders
WHERE Product_ID = 'AP-M-4140';

SELECT COUNT(*) AS Total_Products
FROM Products;

SELECT *
FROM Customers
WHERE State = 'California';

SELECT Customer_ID, SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY Customer_ID;

SELECT Shipping_Method, COUNT(*) AS Total_Orders
FROM Orders
GROUP BY Shipping_Method;

SELECT Product_ID, SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY Product_ID;

SELECT p.Product_ID, p.Product_Name, SUM(o.Quantity) AS Total_Quantity
FROM Products p
JOIN Orders o ON p.Product_ID = o.Product_ID
GROUP BY p.Product_ID, p.Product_Name;

SELECT State, COUNT(*) AS Total_Customers
FROM Customers
GROUP BY State;

SELECT *
FROM Orders
WHERE Sales > (SELECT AVG(Sales) FROM Orders);

SELECT c.Customer_ID, c.Customer_Name, COUNT(o.Order_ID) AS Orders_Placed
FROM Customers c
LEFT JOIN Orders o ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name;

SELECT *
FROM Products
ORDER BY Unit_Price DESC
LIMIT 5;

SELECT c.City, AVG(o.Sales) AS Avg_Sales
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
GROUP BY c.City;

SELECT c.Customer_ID, c.Customer_Name, SUM(o.Sales) AS Total_Sales
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name
ORDER BY Total_Sales DESC
LIMIT 5;

SELECT p.Product_ID, p.Product_Name, SUM(o.Profit) AS Total_Profit
FROM Products p
JOIN Orders o ON p.Product_ID = o.Product_ID
GROUP BY p.Product_ID, p.Product_Name
ORDER BY Total_Profit DESC
LIMIT 1;

SELECT 
    YEAR(Order_Date) AS Order_Year,
    MONTH(Order_Date) AS Order_Month,
    SUM(Sales) AS Monthly_Sales
FROM Orders
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY Order_Year DESC, Order_Month DESC;

WITH OrderCount AS (
    SELECT Customer_ID, COUNT(Order_ID) AS Orders_Placed
    FROM Orders
    GROUP BY Customer_ID
),
AvgOrders AS (
    SELECT AVG(Orders_Placed) AS Avg_Order_Count
    FROM OrderCount
)
SELECT oc.Customer_ID, oc.Orders_Placed
FROM OrderCount oc, AvgOrders ao
WHERE oc.Orders_Placed > ao.Avg_Order_Count;

SELECT p.Category,
       SUM(o.Quantity) AS Total_Quantity,
       SUM(o.Sales) AS Total_Sales
FROM Products p
JOIN Orders o ON p.Product_ID = o.Product_ID
GROUP BY p.Category
ORDER BY Total_Sales DESC, Total_Quantity DESC
LIMIT 3;









