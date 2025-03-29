@echo off
del .\dist\launcher.exe
del .\dist\CPUFixAnomalyLauncher.exe
..\venv\Scripts\pyinstaller.exe --onefile --icon=Anomaly.ico launcher.py
ren .\dist\launcher.exe CPUFixAnomalyLauncher.exe
pause
