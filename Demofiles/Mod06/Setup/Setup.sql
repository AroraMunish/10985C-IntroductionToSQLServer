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

CREATE SCHEMA Sales;
GO
CREATE SCHEMA Person;
GO

--Create and populate Customer table.
CREATE TABLE Person.Customer
(CustomerID INT NOT NULL
,Name VARCHAR (50) NOT NULL
,DateOfBirth DATETIME NULL
,Address VARCHAR (50) NOT NULL
CONSTRAINT PK_Customer PRIMARY KEY (CustomerID));
GO

INSERT INTO Person.Customer
VALUES (1,'Lynn N Tsoflias','1980-02-12','1970 Napa Ct')
INSERT INTO Person.Customer
VALUES (2,'Amy E Alberts','1993-10-22','9833 Mt. Dias Blv')
INSERT INTO Person.Customer
VALUES (3,'Rachel B Valdez','1967-03-14','7484 Roundtree Drive')
INSERT INTO Person.Customer
VALUES (4,'Jae B Pak','1956-05-23','9539 Glenside Dr');
GO


--Create and populate Order table
CREATE TABLE Sales.[Order]
(OrderID INT NOT NULL
,CustomerID INT NOT NULL
,OrderDate DATETIME NOT NULL
CONSTRAINT PK_OrderID PRIMARY KEY (OrderID)
CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID)
REFERENCES Person.Customer (CustomerID));
GO

INSERT INTO Sales.[Order]
VALUES(101,4,GETDATE())
INSERT INTO Sales.[Order]
VALUES(102,3,GETDATE())
INSERT INTO Sales.[Order]
VALUES(103,1,GETDATE())
INSERT INTO Sales.[Order]
VALUES(104,2,GETDATE());
GO
