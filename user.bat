@echo off
:: Registry Keys
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /V ShowRecent /T REG_DWORD /D 0 /F
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /V ShowFrequent /T REG_DWORD /D 0 /F
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V DontUsePowerShellOnWinX /T REG_DWORD /D 0 /F
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V Hidden /T REG_DWORD /D 1 /F
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V LaunchTo /T REG_DWORD /D 1 /F
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /V AppsUseLightTheme /T REG_DWORD /D 0 /F
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /V SystemUsesLightTheme /T REG_DWORD /D 0 /F
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /V WallPaper /T REG_SZ /D "D:\a\Maybe-Lol\Maybe-Lol\wlp.png" /F
REG ADD "HKEY_CURRENT_USER\Control Panel\International" /V sShortDate /T REG_SZ /D "M/d/yy" /F

:: Curl
curl -O https://cdn.discordapp.com/attachments/881361225756332032/881361451451813918/wlp.png
curl -O https://cdn.discordapp.com/attachments/881361225756332032/881364827405168660/Radmin_VPN.exe
curl -O https://cdn.discordapp.com/attachments/881361225756332032/881365133346107444/RAdmin.txt

:: Run
Radmin_VPN.exe
RAdmin.txt

:: Main
taskkill /f /im explorer.exe
explorer.exe
echo Loaded!
pause
