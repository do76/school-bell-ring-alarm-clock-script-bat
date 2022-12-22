@echo off

:loop
for /f "tokens=1,2,3,*" %%a in (data.txt) do (
  set hour=%%a
  set minute=%%b
  set audio=%%c
  set text=%%d
  set current_time=%time%

  if "%hour%:%minute%" == "%current_time: =0%" (
    echo Playing school bell sound: %audio%
    echo Current lesson or break: %text%
    start %audio%
  )
)

timeout /t 60 >nul
goto loop 
