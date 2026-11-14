@echo off
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0mojow.ps1" %*
exit /b %ERRORLEVEL%
