@echo off
title Zip Cracker
color 3
if not exist "C:\Program Files\7-Zip" (
	echo "7zip not installed"
	pause
	exit
)

echo.
set /p archive="Enter Archive : "
if not exist "%archive%" (
		echo "Archive not found! "
		pause
	exit
)

set /p Wordlist="Enter Wordlist : "
if not exist "%wordlist%" (
		echo "Wordlist not found! "
		pause
		exit
)

echo cracking....
for /f %%a in (%wordlist%) do (
		set pass=%%a
		call :attempt
)

echo dumb wordlist
pause
exit

:attempt
"C:\Program Files\7-Zip\7z.exe" x -p%pass% "%archive%" -o"cracked" -y >nul 2>&1
echo ATTEMPT : %pass%
if /I %errorlevel% equ 0 (
		echo Success , password found! : %pass%
		pause
		exist
)