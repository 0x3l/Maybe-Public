@echo off
:: Registry Keys

REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /V ShowRecent /T REG_DWORD /D 0 /F
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /V ShowFrequent /T REG_DWORD /D 0 /F
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V DontUsePowerShellOnWinX /T REG_DWORD /D 0 /F
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V Hidden /T REG_DWORD /D 1 /F
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V LaunchTo /T REG_DWORD /D 1 /F
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /V AppsUseLightTheme /T REG_DWORD /D 0 /F
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /V SystemUsesLightTheme /T REG_DWORD /D 0 /F
REG ADD "HKEY_CURRENT_USER\Control Panel\International" /V sShortDate /T REG_SZ /D "M/d/yy" /F

:: Delete

del /f "C:\Users\Public\Desktop\Microsoft Edge.lnk" > out.txt 2>&1

:: Curl

cd /d C:\
mkdir TEMP_Downloads
cd TEMP_Downloads
curl -O https://discord.com/api/downloads/distributions/app/installers/latest?channel=stable&platform=win&arch=x86
curl -O https://cdn.discordapp.com/attachments/881361225756332032/881584551917412423/RobloxPlayerLauncher.exe
curl -O https://cdn.discordapp.com/attachments/881361225756332032/881589194953203782/Parsec.exe
curl -O https://cdn.discordapp.com/attachments/881361225756332032/881584881925230632/7z.exe
curl -O https://cdn.discordapp.com/attachments/881361225756332032/881584916322721832/ProcessHacker.exe
curl -O https://cdn.discordapp.com/attachments/881361225756332032/881361451451813918/wlp.png
curl -O https://cdn.discordapp.com/attachments/881361225756332032/881364827405168660/Radmin_VPN.exe
curl -O https://cdn.discordapp.com/attachments/881361225756332032/881365133346107444/RAdmin.txt

:: Custom

REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /V WallPaper /T REG_SZ /D "C:\TEMP_Downloads\wlp.png" /F

:: Auto-Run

Radmin_VPN.exe
RAdmin.txt
7z.exe
RobloxPlayerLauncher.exe
ProcessHacker.exe
Parsec.exe

:: Main

set /p FINALIZE_EX=Finalize explorer? (Yes/No): 
if "%FINALIZE_EX%" == "Yes" (
  taskkill /f /im explorer.exe 
  explorer.exe
)
echo Loaded config!
pause
