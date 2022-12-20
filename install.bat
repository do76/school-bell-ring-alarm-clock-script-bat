@echo off
schtasks /create /tn "SchoolClockBellRingbat" /sc onlogon /tr "%cd%\schoolClock.bat"
rem schtasks /Delete /tn "SchoolClockBellRingbat"
echo %cd%
REM /sc onlogon /tr -- onstart doesn't work
taskschd.msc
pause
