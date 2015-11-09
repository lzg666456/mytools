@echo off

:begin
	REM echo %*
	REM if "%1" == "" goto usage
	if "%1" == "tomcat" goto tomcat
	if "%1" == "mysql" goto mysql
	
:usage
	echo usage: %~dp0%0
	echo %0 [tomcat^|mysql] [start^|stop]
goto end
	
:tomcat
	set /p CATALINA_HOME=^>E:\service\apache-tomcat-7.0.57-windows-x86\apache-tomcat-7.0.57:
	REM set /p JDK_HOME=^>
	if not exist "%CATALINA_HOME%\bin\catalina.bat" goto end
	if "%2" == "start" call %CATALINA_HOME%\bin\startup.bat
	if "%2" == "stop" call %CATALINA_HOME%\bin\shutdown.bat
goto end
	
:mysql
	REM if "%2" == "start" call E:\service\mysql-6.0.11-alpha-winx64\mysqld --console
	if "%2" == "start" start "mysqld" E:\service\mysql-6.0.11-alpha-winx64\bin\mysqld --defaults-file=E:\service\mysql-6.0.11-alpha-winx64\my-small.ini
	if "%2" == "stop" start E:\service\mysql-6.0.11-alpha-winx64\bin\mysqladmin -u root shutdown

goto end

:end