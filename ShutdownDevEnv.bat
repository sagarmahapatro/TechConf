@echo off
echo start shoutdowning dev enviroment
set curDr=%~dp0
echo %curDr%
echo start shoutdowning mysql database
%curDr%"dependencies\my-sql\5.6.25-win-64\bin\mysqladmin" -u root shutdown
echo start shoutdowning Tomcat
set "CATALINA_HOME=%curDr%..\dependencies\tomcat\8.0.23-win-64"
%curDr%"dependencies\tomcat\8.0.23-win-64\bin\shutdown"