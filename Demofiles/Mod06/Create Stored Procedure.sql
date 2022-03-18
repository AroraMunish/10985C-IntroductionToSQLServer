--Create the stored procedure

USE Demo;
GO

CREATE PROCEDURE USP_InsertCustomer 
@CustomerID int
,@name varchar (50)
,@DateofBirth datetime
,@Address varchar (50)
AS
INSERT INTO Person.Customer
VALUES
(@CustomerID
,@name
,@DateOfBirth
,@Address);
GO

--Execute the stored procedure

EXEC USP_InsertCustomer @CustomerID = 8
,@name = 'Ken Sanchez'
,@DateOfBirth = '1967-08-07'
,@Address = '1399 Firestone Drive';
GO

--View the results

SELECT * FROM Person.Customer;
GO