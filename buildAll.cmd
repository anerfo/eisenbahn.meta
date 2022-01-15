@echo off

set BRANCH=main

call "%ProgramFiles(x86)%\Microsoft Visual Studio\2019\Community\Common7\Tools\VsDevCmd.bat"

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
	popd
	exit /b 0