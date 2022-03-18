USE [master];
GO

IF EXISTS (SELECT * FROM sys.sysdatabases WHERE[Name] = 'AdventureWorks2016')
	BEGIN
		DROP DATABASE AdventureWorks2016
	END;
GO

IF EXISTS (SELECT * FROM sys.sysdatabases WHERE[Name] = 'AdventureWorksDW2016')
	BEGIN
		DROP DATABASE AdventureWorksDW2016
	END;
GO

RESTORE DATABASE [AdventureWorks2016] FROM  DISK = N'D:\Setupfiles\AdventureWorks2016.bak' WITH  FILE = 1, REPLACE,
MOVE N'AdventureWorks2016_Data' TO N'$(SUBDIR)Setupfiles\AdventureWorks2016_Data.mdf', 
MOVE N'AdventureWorks2016_mod' TO N'$(SUBDIR)Setupfiles\AdventureWorks2016_mod.mdf',
MOVE N'AdventureWorks2016_Log' TO N'$(SUBDIR)Setupfiles\AdventureWorks2016_log.ldf'
GO
ALTER AUTHORIZATION ON DATABASE::AdventureWorks2016 TO [ADVENTUREWORKS\Student];
GO


RESTORE DATABASE [AdventureWorksDW2016] FROM  DISK = N'D:\Setupfiles\AdventureWorksDW2016.bak' WITH  FILE = 1, REPLACE,
MOVE N'AdventureWorksDW2016_Data' TO N'$(SUBDIR)Setupfiles\AdventureWorksDW2016_Data.mdf', 
MOVE N'AdventureWorksDW2016_Log' TO N'$(SUBDIR)Setupfiles\AdventureWorksDW2016_log.ldf'
GO
ALTER AUTHORIZATION ON DATABASE::AdventureWorksDW2016 TO [ADVENTUREWORKS\Student];
GO
