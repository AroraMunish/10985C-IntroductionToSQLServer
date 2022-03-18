--Create a database and change database context
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

--Create schemas
CREATE SCHEMA Person;
GO

CREATE SCHEMA Sales;
GO

--Create tables
CREATE TABLE Person.Customer
(CustomerID INT IDENTITY (1,1) NOT NULL
,Name VARCHAR (50) NOT NULL
,DateOfBirth DATETIME NULL
,Address VARCHAR (50) NOT NULL
CONSTRAINT PK_Customer PRIMARY KEY (CustomerID));
GO

CREATE TABLE Sales.[Order]
(OrderID INT IDENTITY (1,1) NOT NULL
,CustomerID INT NOT NULL
,OrderDate DATETIME NOT NULL
CONSTRAINT PK_OrderID PRIMARY KEY (OrderID)
CONSTRAINT FK_Order_Customer FOREIGN KEY (CustomerID)
REFERENCES Person.Customer (CustomerID));
GO

CREATE TABLE Person.CustomerDemographics
(CustomerID int NOT NULL PRIMARY KEY
,Age tinyint NOT NULL 
,NumberOfChildren varchar(8) NOT NULL
CONSTRAINT FK_CustomerDemographics_Customer FOREIGN KEY (CustomerID)
REFERENCES Person.Customer (CustomerID));
GO

CREATE TABLE Person.Employee
(EmployeeID int IDENTITY NOT NULL PRIMARY KEY
,SSN char (12) NOT NULL
,LastName varchar (50) NOT NULL
,Firstname varchar (50) NOT NULL);
GO

--Add CHECK constraint to Sales.Order
ALTER TABLE Sales.[Order] ADD CONSTRAINT DF_OrderDate
    CHECK (OrderDate = GETDATE());
GO

--Test CHECK constraint
INSERT INTO Sales.[Order]
VALUES(4,GETDATE()-1);
GO

--Add DEFAULT constraint to Person.CustomerDemographics
ALTER TABLE Person.CustomerDemographics
ADD CONSTRAINT DF_NumberChildren DEFAULT 'Unknown' FOR NumberOfChildren;
GO

--Test DEFAULT constraint
INSERT INTO Person.Customer
VALUES ('Customer 1', '1 June 1987', '1 High Street');
GO

INSERT INTO Person.CustomerDemographics (CustomerID, Age)
VALUES (1,23)

SELECT * FROM Person.CustomerDemographics;
GO

--Add UNIQUE constraint to Person.Employee
ALTER TABLE Person.Employee
ADD CONSTRAINT AK_SSN UNIQUE (SSN);
GO

--Test UNIQUE constraint. 

INSERT INTO Person.Employee
VALUES (123,'Lastname', 'Firstname');
GO
INSERT INTO Person.Employee
VALUES (123,'Lastname', 'Firstname');
GO


