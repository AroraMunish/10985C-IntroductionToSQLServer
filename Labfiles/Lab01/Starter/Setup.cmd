@Echo Off
ECHO Preparing Lab Environment ...

REM - Get current directory
SET SUBDIR=%~dp0

REM - Restart SQL Server Services to force closure of any open connections
Echo Restarting services ...
NET STOP MSSQLLaunchPad >NUL
NET STOP SQLSERVERAGENT >NUL
NET STOP MSSQLSERVER >NUL
NET START MSSQLSERVER >NUL
NET START SQLSERVERAGENT >NUL
NET START MSSQLLaunchPad >NUL

Echo Preparing databases...
SQLCMD -E -S localhost -i %SUBDIR%Setupfiles\Setup.sql > %SUBDIR%Setupfiles\SetupLog.txt


