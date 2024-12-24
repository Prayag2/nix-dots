{pkgs}:
  pkgs.writeShellScriptBin "custom-scr-switch_sink" ''
    #!/usr/bin/env bash

    # Get a list of all available sinks
    readarray -t sinks <<< "''$(pactl list short sinks | awk -F'\t' '{print ''$2}')"

    # Get the default sink
    default_sink=''$(pactl info | grep "Default Sink" | sed 's/Default Sink: \(.*\)/\1/')

    # Find the index of the current default sink
    current_index=-1
    for i in "''${!sinks[@]}"; do
        if [[ "''${sinks[''$i]}" == "''$default_sink" ]]; then
            current_index=''$i
            break
        fi
    done

    # If the current sink is not found, exit
    if [[ ''$current_index -eq -1 ]]; then
        echo "Error: Default sink not found."
        exit 1
    fi

    # Calculate the index of the next sink
    next_index=''$(( (current_index + 1) % ''${#sinks[@]} ))

    # Set the next sink as the default sink
    next_sink=''${sinks[''$next_index]}
    next_sink_name=''$(pactl list sinks | grep -A 15 "Name: ''$next_sink" | grep "Description" | awk -F ": " '{print ''$2}')
    pactl set-default-sink "''$next_sink"

    notify-send "Switched To" "''$next_sink_name" -i "audio-speakers" -r 420

    # Move all currently playing streams to the new sink
    readarray -t streams <<< "''$(pactl list short sink-inputs | awk '{print ''$1}')"
    for stream in "''${streams[@]}"; do
        pactl move-sink-input "''$stream" "''$next_sink" 2>/dev/null
    done
    ''
