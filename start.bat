@echo off
:: Delete Programs
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > out.txt 2>&1
del /f "C:\Users\Public\Desktop\Unity Hub.lnk" > out.txt 2>&1
del /f "C:\Users\Public\Desktop\Firefox.lnk" > out.txt 2>&1
del /f "C:\Users\Public\Desktop\Google Cloud SDK Shell.lnk" > out.txt 2>&1
del /f "C:\Users\Public\Desktop\Microsoft Edge.lnk" > out.txt 2>&1

:: Installation
net config server /srvcomment:"Windows Server 2019" > out.txt 2>&1
netsh advfirewall firewall set rule group="Network Discovery" new enable=Yes
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V verbosestatus /T REG_DWORD /D 1 /F > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f /v AutoBat /t REG_SZ /d D:\a\Maybe-Lol\Maybe-Lol\user.bat
net user User 9cl?AYNF0aEjR /add >nul
net localgroup administrators User /add >nul
net user User /active:yes >nul
net user installer /delete
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul
ICACLS C:\Windows\Temp /grant User:F >nul
ICACLS C:\Windows\installer /grant User:F >nul

:: Main
echo Success!
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Failed to retreive NGROK authtoken - check again your authtoken"
echo Username: User
echo Password: 9cl?AYNF0aEjR
echo You can login now.
ping -n 10 127.0.0.1 >nul
