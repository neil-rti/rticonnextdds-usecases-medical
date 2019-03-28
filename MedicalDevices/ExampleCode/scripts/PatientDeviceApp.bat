@echo off
setlocal

set dir=%~dp0
set executable_name=PatientDeviceApp

set libDir=%NDDSHOME%\lib
set i86Win32Libs=i86Win32VS2017 i86Win32VS2015 i86Win32VS2013 i86Win32VS2012 i86Win32VS2010 i86Win32VS2008 i86Win32VS2005 i86Win32VS2003 i86Win32VC70 i86Win32VC60
rem set x64Win64Libs=x64Win64VS2017 x64Win64VS2015 x64Win64VS2013 x64Win64VS2012 x64Win64VS2010 x64Win64VS2008 x64Win64VS2005 %i86Win32Libs%
set x64Win64Libs=%i86Win32Libs%
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
    set "platformsToTry=%x64Win64Libs%"
) else if "%PROCESSOR_ARCHITEW6432%"=="AMD64" (
    set "platformsToTry=%x64Win64Libs%"
) else if "%PROCESSOR_ARCHITECTURE%"=="x86" (
    set "platformsToTry=%i86Win32Libs%"
) else (
    echo Processor "%PROCESSOR_ARCHITECTURE%" not supported. Please contact support@rti.com.
    exit /b 1
)

for %%a in (%platformsToTry%) do (
    if exist "%libDir%\%%a\nddscore.dll" (
                set platformName=%%a
                goto break
    )
)

@REM We need to use goto to be able to break in the for loop.
:break
echo %platformName%

set rtiPath=%NDDSHOME%\lib\%platformName%
echo %path%|find /i "%rtiPath%">nul  || set path=%rtiPath%;%path%
rem set Path=%NDDSHOME%\lib\%platformName%;%PATH%

IF NOT EXIST %dir%..\win32\Release\%platformName%\ GOTO TryDebugPath
cd %dir%..\win32\Release\%platformName%\
GOTO RunTheApp
:TryDebugPath
IF NOT EXIST %dir%..\win32\Debug\%platformName%\ GOTO NoAppPathFound
cd %dir%..\win32\Debug\%platformName%\
GOTO RunTheApp
:NoAppPathFound
echo "Cannot find path to run application"
exit /b 2

:RunTheApp
call %executable_name% %*