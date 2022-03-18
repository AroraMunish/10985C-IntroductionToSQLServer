-- Step 1
-- DO NOT RUN THE WHOLE SCRIPT, RUN EACH STEP INDIVIDUALLY
-- Turn Statistics IO on and Statistics Time on.

USE Adventureworks
GO
SET STATISTICS IO ON
GO
SET STATISTICS TIME ON
GO

------------------ END OF STEP 1 ------------------


-- Step 2
-- DO NOT RUN THE WHOLE SCRIPT, RUN EACH STEP INDIVIDUALLY
-- Run a query with no indexes and note down the Logical Reads 
-- and Elapsed Time from the Messages tab.

SELECT * FROM Person.Person WHERE FirstName <> 'Michael'
GO

------------------ END OF STEP 2 ------------------


-- Step 3
-- DO NOT RUN THE WHOLE SCRIPT, RUN EACH STEP INDIVIDUALLY
-- Create two non-clustered indexes

CREATE INDEX CI_Salesperson_BusinessEntityID ON Person.Person(BusinessEntityID)
GO
CREATE INDEX NCI_SalesPerson_FirstName ON Person.Person(FirstName)
GO

------------------ END OF STEP 3 ------------------

-- Step 4
-- DO NOT RUN THE WHOLE SCRIPT, RUN EACH STEP INDIVIDUALLY
-- Run a query with indexes and note down the Logical Reads 
-- and Elapsed Time from the Messages tab.
-- Note that the Logical Reads and Elapsed time are typically similar.

SELECT * FROM Person.Person WHERE FirstName <> 'Michael'
GO

------------------ END OF STEP 4 ------------------

-- Step 5
-- DO NOT RUN THE WHOLE SCRIPT, RUN EACH STEP INDIVIDUALLY
-- Drop the indexes
DROP INDEX Person.Person.NCI_SalesPerson_FirstName
GO
DROP INDEX Person.Person.CI_Salesperson_BusinessEntityID
GO

------------------ END OF STEP 5 ------------------