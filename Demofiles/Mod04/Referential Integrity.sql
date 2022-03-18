--Create a database and change database context.
USE [master];
GO

IF EXISTS (SELECT * FROM sys.sysdatabases WHERE[Name] = 'Demo')
	BEGIN
		DROP DATABASE Demo
	END;
GO

CREATE DATABASE Demo;
GO

USE Demo;
GO

--Create Customers table with a primary key constraint and four rows
CREATE TABLE Customers
(CustomerID INT NOT NULL
,Name VARCHAR (50) NOT NULL
,DateOfBirth DATETIME NULL
,Address VARCHAR (50) NOT NULL
CONSTRAINT PK_Customers PRIMARY KEY (CustomerID));
GO

INSERT INTO Customers
VALUES (1,'Lynn N Tsoflias',06-02-1980,'1970 Napa Ct')
INSERT INTO Customers
VALUES (2,'Amy E Alberts',09-22-1993,'9833 Mt. Dias Blv')
INSERT INTO Customers
VALUES (3,'Rachel B Valdez',12-14-1967,'7484 Roundtree Drive')
INSERT INTO Customers
VALUES (4,'Jae B Pak',05-23-1956,'9539 Glenside Dr');
GO

--Create a table with a foreign key constraint 
CREATE TABLE Orders
(OrderID INT NOT NULL
,CustomerID INT NOT NULL
,OrderDate DATETIME NOT NULL
CONSTRAINT PK_OrderID PRIMARY KEY (OrderID)
CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID)
REFERENCES Customers (CustomerID));
GO

--Test foreign key constraint by adding an order with a valid CustomerID value
INSERT INTO Orders
VALUES(101,4,GETDATE());
GO
SELECT * FROM Orders;
GO

--Add an order with an invalid CustomerID value
INSERT INTO Orders
VALUES(102,5,GETDATE());
GO

--Update a CustomerID value in Customers that has no matching value in Orders
UPDATE Customers
SET CustomerID = 11
WHERE CustomerID = 1;
GO

--Update a CustomerID value in Customers that has a matching value in Orders
UPDATE Customers
SET CustomerID = 14
WHERE CustomerID = 4;
GO

--Drop foreign key and add new foreign key that specifies cascading referential integrity
ALTER TABLE Orders
DROP CONSTRAINT FK_Orders_Customers;
GO
ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID)
REFERENCES Customers (CustomerID) ON UPDATE CASCADE;
GO

--Test cascading referential integrity
UPDATE Customers
SET CustomerID = 14
WHERE CustomerID = 4;
GO

SELECT * FROM Customers;
GO
SELECT * FROM Orders;
GO