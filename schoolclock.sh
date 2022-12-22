#!/bin/bash

while true; do
  # extract hour, minute, second, and centisecond values from current time
  read fhour fmin fsec fcsec <<< $(date +"%H %M %S %3N")

  # read data from data.txt file
  while IFS=" " read -r hour minute audio text; do
    if [[ $fhour == $hour ]]; then
      if [[ $fmin == $minute ]]; then
        echo "Playing school bell sound: $audio"
        echo "Current lesson or break: $text"
        mpv "$audio"
      fi
    fi
  done < data.txt

  sleep 60
done

