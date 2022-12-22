#!/bin/bash

while true; do
    # Get the current hour and minute
    hour=$(date +%H)
    minute=$(date +%M)

    # Read the data.txt file and extract the audio file and text for the current time
    audio_file=$(grep "$hour $minute" data.txt | cut -d' ' -f3)
    text=$(grep "$hour $minute" data.txt | cut -d' ' -f4-)

    # If an audio file and text were found, play the audio file and display the text
    if [ -n "$audio_file" ] && [ -n "$text" ]; then
        echo "$text"
        afplay "$audio_file"
    fi

    # Sleep for 1 minute before checking the time again
    sleep 60
done
