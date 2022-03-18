--View the columns in the Production.Product table and identify the total number of rows

USE AdventureWorks;
GO
SELECT *
FROM Production.Product;
GO

--Assess ProductID as a candidate key

Use AdventureWorks;
GO
SELECT DISTINCT ProductID
FROM Production.Product;
GO

--Assess Name as a candidate key

Use AdventureWorks;
GO
SELECT DISTINCT Name
FROM Production.Product;
GO

--Assess ProductNumber as a candidate key

Use AdventureWorks;
GO
SELECT DISTINCT ProductNumber
FROM Production.Product;
GO

--Assess Color as a candidate key

Use AdventureWorks;
GO
SELECT DISTINCT Color
FROM Production.Product;
GO