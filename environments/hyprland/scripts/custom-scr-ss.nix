{pkgs}:
  pkgs.writeShellScriptBin "custom-scr-ss" ''
    echo ":: setting up variables ::"
    script_name="Screenshot"
    script_icon="preferences-desktop-theme"
    screenshot_dir="$HOME/pictures/screenshots/$(date +%d-%m-%Y)"
    script_args=$1

    echo ":: generating file name ::"
    if [[ $script_args == *"t"* ]]; then
      screenshot_file="/tmp/ss-$(whoami).png"
    else
        mkdir -p $screenshot_dir
        let screenshot_num=(1 + $(ls $screenshot_dir | wc -l))
        screenshot_file="$screenshot_dir/$screenshot_num.png"
    fi

    echo ":: taking screenshot ::"
    if [[ $script_args == *"a"* ]]; then
        grim -g "$(slurp)" "$screenshot_file"
    else
        grim "$screenshot_file"
    fi

    if [[ $? -ne 0 ]]; then
        exit 0
    fi

    if [[ $script_args == *"o"* ]]; then
        echo ":: optimizing screenshot ::"
        notification_id=$(notify-send -a "$script_name" -i "$script_icon" "Optimising Screenshot"\
          "The screenshot is being optimised. Please wait..." -p -u low)
        optipng "$screenshot_file"
    else
        notification_id=0
    fi

    function copyimage() {
      if [[ $script_args == *"c"* ]]; then
          echo ":: copying screenshot to clipboard ::"
          wl-copy < "$screenshot_file"
      fi
    }
    copyimage

    echo ":: sending final notification ::"
    notification_output=$(notify-send -a "$script_name" -i "$script_icon" "Screenshot Taken"\
      "Screenshot saved to $screenshot_file" -r $notification_id -A "Annotate" -A "Open Image" -A "Delete Image")

    # Action
    case "$notification_output" in
        0)
            notify-send -a "$script_name" -i "$script_icon" "Screenshot Taken"\
              "Screenshot saved to $screenshot_file" -r $notification_id
            copyimage
            ;;
        1)
            sxiv "$screenshot_file" ;;
        2)
            rm "$screenshot_file" ;;
    esac
''
