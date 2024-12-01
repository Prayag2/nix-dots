{pkgs}:
  pkgs.writeShellScriptBin "custom-scr-power" ''
    text_poweroff=" Power Off"
    text_logout="󰍃 Log Out"
    text_sleep="󰒲 Sleep"
    text_reboot="󰜉 Reboot"
    rofi_theme="$HOME/.config/rofi/theme.rasi"

    chosen=$(printf "$text_poweroff\n$text_logout\n$text_sleep\n$text_reboot"\
      | rofi -dmenu -p "󰐥" -hover-select -me-select-entry "" -me-accept-entry MousePrimary -theme $rofi_theme) 

    run-task() {
      sleep 1 && sh -c "$1"
    }

    case $chosen in
      $text_poweroff) run-task "systemctl --no-wall poweroff" ;;
      $text_reboot) run-task "systemctl --no-wall reboot";;
      $text_logout) run-task "hyprctl dispatch exit";;
      $text_sleep) run-task "systemctl suspend";;
      *) exit 0;;
    esac
  ''
