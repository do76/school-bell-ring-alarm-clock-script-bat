#!/bin/bash

# Set the current time and date variables
current_time=$(date +%H:%M)
current_day=$(date +%A)

# Set the school bell audio file
bell_audio_file="/path/to/school/bell/audio/file.wav"

# Read the data from the data file
while IFS= read -r line
do
  # Split the line into fields based on the spaces
  fields=($line)
  # Extract the time, audio file, and text fields
  time="${fields[0]} ${fields[1]}"
  audio_file="${fields[2]}"
  text="${fields[3]}"

  # Check if the current time matches the time in the data file
  if [[ "$current_time" == "$time" ]]; then
    # Play the school bell audio file
    afplay "$bell_audio_file"

    # Print the current lesson or break
    echo "It's $text time!"
  fi
done < data.txt
