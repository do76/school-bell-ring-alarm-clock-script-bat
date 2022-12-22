@echo off

setlocal EnableDelayedExpansion

rem Read data from data.txt and store in an array
set i=0
for /F "tokens=1-4" %%a in (data.txt) do (
  set /A i+=1
  set "data_array[!i!]=%%a %%b %%c %%d"
)

rem Loop through the array and play the appropriate audio file at the specified time
for /F "tokens=1-4" %%a in ("%data_array[@]%") do (
  rem Split the data into variables
  set hour=%%a
  set minute=%%b
  set audiofile=%%c
  set text=%%d

  rem Convert the hour and minute to seconds
  set /A time_in_seconds=hour * 3600 + minute * 60

  rem Sleep until the specified time
  ping -n 1 -w %time_in_seconds% localhost >nul
  REM ---- OR TIMEOUT MAYBE...? ----

  rem Play the audio file
  wmplayer /play /close "%audiofile%"
)
