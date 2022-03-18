--Create a view
USE Demo;
GO

CREATE VIEW VW_CustomerOrders
WITH SCHEMABINDING
AS
SELECT C.CustomerID, Name, DateOfBirth, OrderID, OrderDate
FROM Person.Customer as C
JOIN Sales.[Order] as O
ON C.CustomerID = O.CustomerID;
GO

--Query the view
SELECT Name, DateOfBirth, OrderID
FROM VW_CustomerOrders;
GO

--Query the view with a WHERE caluse
SELECT Name, DateOfBirth, OrderID
FROM VW_CustomerOrders
WHERE OrderID > 102;
GO

--Create an index on the view
CREATE UNIQUE CLUSTERED INDEX IX_VWCustomersOrders
ON VW_CustomerOrders (CustomerID, Name, DateOfBirth, OrderID, OrderDate)  ;
GO
