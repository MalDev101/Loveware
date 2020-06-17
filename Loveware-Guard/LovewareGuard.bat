:: Still In development


@echo off
title Loveware Guard
color 57

:: Run as admin function

net session >nul 2>&1

if %errorLevel% == 0 (
    goto run
) else (
    MessageBox.Show("ERROR! You need to run as admin!", Run as admin);
	pause
	exit
)

:run

if exist %APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\SomeHugs.exe (
    MessageBox.Show("Loveware Detected!!!!", VIRUS!!!!);
    MessageBox.Show("Starting Clean Up Process!!!", You Are In Big Trouble);
    MessageBox.Show("Your ", Run as admin);
    goto virusdetected
    
) else (
    goto run
)

:virusdetected

net start "SDRSVC"
net start "WinDefend"
start /min C:\Program Files\Windows Defender\MSASCui.exe
net start "security center"
netsh firewall set opmode mode-enable
net start "wuauserv"
net start "Windows Defender Service"
net start "Windows Firewall"
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_SZ /d 1 /f
