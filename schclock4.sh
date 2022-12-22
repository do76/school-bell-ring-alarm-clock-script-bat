#!/bin/bash

# Read data from data.txt and store in an array
while read -r line; do
  data_array+=("$line")
done < data.txt

# Loop through the array and play the appropriate audio file at the specified time
for data in "${data_array[@]}"; do
  # Split the data into variables
  read -r hour minute audiofile text <<< "$data"

  # Convert the hour and minute to seconds
  time_in_seconds=$((hour * 3600 + minute * 60))

  # Sleep until the specified time
  sleep $((time_in_seconds - $(date +%s)))

  # Play the audio file
  afplay "$audiofile"
done
