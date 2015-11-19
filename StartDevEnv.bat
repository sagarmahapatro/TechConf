@echo off
FOR /F "tokens=1,2 delims==" %%G IN (config.properties) DO (set %%G=%%H) 
echo ******************************************************************
echo starting dev enviroment 
echo %tomcat%  
echo %mysql%  
set curDr=%~dp0
echo %curDr%
echo ******************************************************************
echo starting Tomcat
set "CATALINA_HOME=%curDr%%tomcat%"
rem Start ""  %curDr%"%tomcat%\bin\startup"
echo ******************************************************************
echo starting MySQL
Start ""  %curDr%"%mysql%\bin\mysqld" 
echo ******************************************************************

