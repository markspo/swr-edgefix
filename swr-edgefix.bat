@echo off
setlocal enabledelayedexpansion

:: Get the current date and time
for /f "tokens=2 delims==" %%i in ('"wmic os get localdatetime /value"') do set datetime=%%i

:: Extract the date in YYYYMMDD format
set timestamp=%datetime:~0,4%%datetime:~4,2%%datetime:~6,2%

:: Terminate MS Edge
taskkill /im msedge.exe /F

:: Make backup directory
mkdir "%LocalAppData%\Microsoft\Edge\User Data\Default-Backup-%timestamp%\"

:: Copy Default user data to Backup directory
xcopy "%LocalAppData%\Microsoft\Edge\User Data\Default\" "%LocalAppData%\Microsoft\Edge\User Data\Default-Backup-%timestamp%\" /E/H

:: Rename the Preferences file
move "%LocalAppData%\Microsoft\Edge\User Data\Default\Preferences" "%LocalAppData%\Microsoft\Edge\User Data\Default\Preferences.bak-%timestamp%"

:: Open MS Edge
"C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"

endlocal
