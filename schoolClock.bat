@echo off
rem school clock v1
set curlesson=freshstart
cls
rem bonus code, not working well
REM for %%i in (Mon,Tue,Wed,Thu,Fri) do (
REM echo %%i  -- "%date:~0,3%"
REM    if "%date:~0,3%"=="%%i" goto clockloop
REM )


REM dp0 must have because schtasks doesnt do "start in" directory, thus this is like PWD command (otherwise it would be C:\Windows\system32 which is problematic )
cd %~dp0
goto clockloop

REM do not run on weekend (fallback)
echo not work day
echo (weekend)
pause
cls
:clockloop

for /f "tokens=1-4 delims=:.," %%A in ("%time%") do (
  set fhour=%%A
  set fmin=%%B
  set /A fsec=%%C
  set fcsec=%%D
)
echo Right Now: %curlesson% %fhour% + %fmin% --- %time%

REM § for seperation. procent procent I is not changable (batch sucks, use bash)
FOR /F "tokens=1-4 delims==§" %%I in (data.txt) DO (
    ECHO %%I : %%J - %%K -- %%L 
)

REM hour : MIN - soundfile -- type
FOR /F "tokens=1-4 delims==§" %%I in (data.txt) DO (
	if %fhour%==%%I (
	    if %fmin%==%%J (
		IF %fsec% LSS 15 (
		   set curlesson=%%L
	       echo "**RINGING** %%L -- %%I : %%J -+- %%K"
		   echo "**RINGING** %%L -- %%I : %%J -+- %%K == %time%-%date%">>CLOCKDEBUG.log
		   mpv.exe %%K
		   REM its possible to remove this extra IF, and simply use timeout command
		   ) ELSE ( 
		   echo PREVENT REPEAT BELL
		   echo PREVENT DUPE BELL == %time%-%date%>>CLOCKDEBUG.log
		   )
	    )
	)
)

timeout /t 5 /nobreak > nul
REM 20 sec sleep
cls
goto clockloop
echo Err... I failed
echo "FAIL AT %time%">>CLOCKDEBUG.log
echo RETRYING after 15s ....
timeout /t 15 /nobreak > nul
goto clockloop
echo FAIL AGAIN
echo "RETRY FAIL AT %time%">>CLOCKDEBUG.log
pause
