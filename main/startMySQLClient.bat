@echo off  
FOR /F "tokens=1,2 delims==" %%G IN (test.properties) DO (set %%G=%%H)  
echo starting MySQL Client
Start ""  %curDr%"%mysql%\bin\mysql" -u sagar -p