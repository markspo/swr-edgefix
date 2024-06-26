taskkill /im msedge.exe /F
mkdir "%LocalAppData%\Microsoft\Edge\User Data\Default-Backup\"
xcopy "%LocalAppData%\Microsoft\Edge\User Data\Default\" "%LocalAppData%\Microsoft\Edge\User Data\Default-Backup\" /E/H
move "%LocalAppData%\Microsoft\Edge\User Data\Default\Preferences" "%LocalAppData%\Microsoft\Edge\User Data\Default\Preferences.bak"
