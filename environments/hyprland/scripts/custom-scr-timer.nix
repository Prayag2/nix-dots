{pkgs}:
  pkgs.writeShellScriptBin "custom-scr-timer" ''
    TIMER_FILE="/tmp/waybar_timer.state"
    DEFAULT_TIME=300  # 5 minutes in seconds

    init_timer() {
        echo "$DEFAULT_TIME:paused" > "$TIMER_FILE"
    }

    read_timer() {
        IFS=":" read -r TIME STATUS < "$TIMER_FILE"
    }

    write_timer() {
        echo "$TIME:$STATUS" > "$TIMER_FILE"
    }

    format_time() {
        printf "%02d:%02d:%02d" $((TIME/3600)) $(((TIME%3600)/60)) $((TIME%60))
    }

    notify_and_wait() {
        notify-send -u critical -t 0 "Time's up!"
        TIME=$DEFAULT_TIME
        STATUS="paused"
        write_timer
    }

    [[ -f "$TIMER_FILE" ]] || init_timer

    read_timer

    # Input handler (waybar calls this script with $1)
    case "$1" in
        "scroll_up")
            TIME=$((TIME + 5))
            write_timer
            ;;
        "scroll_down")
            TIME=$((TIME > 5 ? TIME - 5 : 0))
            write_timer
            ;;
        "set_time")
            ROFIINP=$(printf "5\n10\n20\n30\n40\n50\n60" | rofi -dmenu -p "Enter time in minutes")
            TIME=$((ROFIINP * 60))
            STATUS="running"
            write_timer
            ;;
        "click")
            if [[ "$STATUS" == "running" ]]; then
                STATUS="paused"
            else
                STATUS="running"
            fi
            write_timer
            ;;
    esac

    # Output time or countdown
    ICON="󰐍"
    if [[ "$STATUS" == "running" ]]; then
        ICON="󰏦"
        TIME=$((TIME - 1))
        if [[ "$TIME" -le 0 ]]; then
            TIME=0
            STATUS="paused"
            write_timer
            format_time
            notify_and_wait
        else
            write_timer
        fi
    fi

    echo "{\"text\": \"$ICON  $(format_time)\", \"tooltip\": \"''${STATUS^}\"}"
  ''
