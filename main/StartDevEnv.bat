@echo off
echo starting dev enviroment
set curDr=%~dp0
echo %curDr%
echo starting Tomcat
set "CATALINA_HOME=%curDr%..\dependencies\tomcat\8.0.23-win-64"
rem %curDr%"..\dependencies\tomcat\8.0.23-win-64\bin\startup"
echo starting MySQL
%curDr%"..\dependencies\my-sql\5.6.25-win-64\bin\mysqld" 

