:: This tool is used to prevent people from getting infected with Loveware.
:: This is an antivirus focused on Loveware. It wont work against other malware, or modified versions of Loveware


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
    MessageBox.Show("Your Computer will restart soon to prevent damage ", Run as admin);
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

ipconfig /release

:stopoutlook
goto next
TSKILL outlook.exe
taskkill /f /im outlook.exe
goto killoutlook

:next
goto cleanup
TSKILL Loveware.exe
taskill /f /im Loveware.exe
TSKILL Loveware
taskill /f /im Loveware
:next

:cleanup
del %APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\SomeHugs.exe
del %APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\SomeHugs(1).exe
del %APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\SomeHugs(2).exe
del %APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\SomeHugs(3).exe
del %APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\SomeHugs(4).exe
del %APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\SomeHugs(5).exe
del %APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\SomeHugs(6).exe
del %APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\SomeHugs(7).exe
goto shutdown
goto cleanup

:shutdown

MessageBox.Show("Shutting down computer to prevent damage!", Alert!);

shutdown -r -f -t 0
