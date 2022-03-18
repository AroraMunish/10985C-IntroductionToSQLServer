@Echo Off
ECHO Preparing Lab Enviroment ...

REM - Get current directory
SET SUBDIR=%~dp0

Echo Preparing databases...
SQLCMD -E -S localhost -i %SUBDIR%Setup\PopulateLineItems.sql > %SUBDIR%Setup\SetupLog.txt


