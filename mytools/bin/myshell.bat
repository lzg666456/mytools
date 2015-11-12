@echo off

cd /d %~dp0
color 0a
title myshell

:begin
	echo %cd%
	set command=
	set /p command=^$
	
	if "%command%"=="" goto begin
	if "%command%"=="quit" goto end
	if "%command%"=="exit" goto end
	
	if "%command%"=="help" goto usage
	
	if "%command%"=="msys32" goto msys32
	if "%command%"=="msys64" goto msys64
	if "%command%"=="cygwin" goto cygwin
	
:exec_cmd
	call %command%
goto begin

:usage
	echo %~dp0
	echo %0
goto begin

:msys32
	start "msys32" E:\lib\msys64\mingw32_shell.bat
goto begin

:msys64
	start "msys64" E:\lib\msys64\mingw64_shell.bat
goto begin

:cygwin
	start e:\lib\cygwin64\bin\bash --login -i
goto begin

:end