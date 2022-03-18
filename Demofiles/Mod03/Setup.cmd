@Echo Off
ECHO Preparing Demo Environment ...

REM - Get current directory
SET SUBDIR=%~dp0

REM - Restart SQL Server Services to force closure of any open connections
Echo Restarting services ...
NET STOP MSSQLLaunchpad 
NET STOP SQLSERVERAGENT 
NET STOP MSSQLSERVER 
NET START MSSQLSERVER 
NET START SQLSERVERAGENT 
NET START MSSQLLaunchpad 

Echo Preparing databases...
SQLCMD -E -S localhost -i %SUBDIR%Setupfiles\Setup.sql > %SUBDIR%Setupfiles\SetupLog.txt


