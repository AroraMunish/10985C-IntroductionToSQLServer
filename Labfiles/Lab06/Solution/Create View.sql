--Write the query to retrive customer and order data
USE OrdersDatabase;
GO

SELECT (FirstName + ' ' + LastName) AS [Customer Name] 
,O.OrderID, OrderDate
,SUM(UnitPrice*Quantity) AS [Order Total] 
FROM Person.Customers as C
JOIN Sales.Orders as O 
ON C.CustomerID = O.CustomerID
JOIN Sales.LineItems as L
ON O.OrderID = L.OrderID
GROUP BY O.OrderID, Firstname, Lastname, OrderDate;
GO


--Create the VW_CustomerOrders view
USE OrdersDatabase;
GO

CREATE VIEW VW_CustomerOrders
AS
SELECT (FirstName + ' ' + LastName) AS [Customer Name] 
,O.OrderID, OrderDate
,SUM(UnitPrice*Quantity) AS [Order Total] 
FROM Person.Customers as C
JOIN Sales.Orders as O 
ON C.CustomerID = O.CustomerID
JOIN Sales.LineItems as L
ON O.OrderID = L.OrderID
GROUP BY O.OrderID, Firstname, Lastname, OrderDate;
GO

--Test the view
SELECT * FROM VW_CustomerOrders;
GO