#!/bin/bash

while true; do
  # Read the data from data.txt
  while read hour minute audiofile text; do
    # Check if the current time matches the specified hour and minute
    if [ $(date +%H) -eq $hour ] && [ $(date +%M) -eq $minute ]; then
      # Play the audio file
      afplay "$audiofile"

      # Print the text
      echo "$text"
    fi
  done < data.txt

  # Sleep for 1 minute
  sleep 60
done
