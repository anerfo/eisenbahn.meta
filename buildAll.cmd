@echo off

set BRANCH=main

call "%ProgramFiles%\Microsoft Visual Studio\2022\Community\Common7\Tools\VsDevCmd.bat"

call :BUILD "%~dp0eisenbahn"
call :BUILD "%~dp0communication"
call :BUILD "%~dp0infrastructure"
call :BUILD "%~dp0controls"

exit /b 0

:BUILD
	pushd "%~1"
	echo "%~1" 
	git checkout %BRANCH%
	git pull
	msbuild "%~1" -t:restore -p:RestorePackagesConfig=true
	msbuild "%~1" -p:Configuration=Release -p:Platform=x64
	popd
	exit /b 0