-- Step 1
-- DO NOT RUN THE WHOLE SCRIPT, RUN EACH STEP INDIVIDUALLY
-- Run blocking query.

USE AdventureWorks
GO

WHILE 1=1
BEGIN
UPDATE Person.Person
SET BusinessEntityID=BusinessEntityID+1
END

------------------ END OF STEP 1 ------------------

