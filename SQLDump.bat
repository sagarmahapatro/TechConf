@echo off  
FOR /F "tokens=1,2 delims==" %%G IN (config.properties) DO (set %%G=%%H)  

%curDr%%mysql%\bin\mysqldump -u sagar -p galleryrep > galleryrep.sql