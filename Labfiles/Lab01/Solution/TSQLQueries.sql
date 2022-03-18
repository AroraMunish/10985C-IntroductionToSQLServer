/* Select all columns and rows from the Sales.SalesOrderHeader table */
SELECT * FROM Sales.SalesOrderHeader;
GO

/* Select specific columns and all rows from the Sales.SalesOrderHeader table */
SELECT SalesOrderID, OrderDate, SalesPersonID
FROM Sales.SalesOrderHeader;
GO

/* Select specific columns and rows from the Sales.SalesOrderHeader table 
where SalespersonID = 279 */
SELECT SalesOrderID, OrderDate, SalesPersonID
FROM Sales.SalesOrderHeader
WHERE SalesPersonID = 279;
GO

/* Select specific columns and rows from the Sales.SalesOrderHeader table 
where SalespersonID = 279 or SalespersonID = 282 */
SELECT SalesOrderID, OrderDate, SalesPersonID
FROM Sales.SalesOrderHeader
WHERE SalesPersonID = 279 OR SalesPersonID = 282;
GO

/* Select specific columns and rows from the Sales.SalesOrderHeader table 
where SalespersonID = 279 or SalespersonID = 282 */
SELECT SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader
WHERE SalesOrderID BETWEEN 57000 AND 58000;
GO

/* Select specific columns and rows from the Sales.SalesOrderHeader table 
where SalespersonID = 279 and the OrderDate year = 2014 */
SELECT SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader
WHERE SalesPersonID = 279 AND Year(OrderDate) = 2014;
GO