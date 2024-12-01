{pkgs}:
    pkgs.writeShellScriptBin "custom-scr-hyprsoc" ''
        # Pauses live wallpaper if it is not visible
        toggle_wallpaper() {
            windowCount=$(hyprctl activeworkspace | grep windows | sed "s/.*windows: \([0-9]\)/\1/")
            isCurrentFloating=$(hyprctl activewindow | grep floating | sed "s/.*floating: \([0-9]\)/\1/g")
            if [[ ($windowCount -eq 0) || ($windowCount -eq 1 && $isCurrentFloating -eq 1) ]]; then
                echo 'set pause no' | socat - /tmp/mpv-socket
            else
                echo 'set pause yes' | socat - /tmp/mpv-socket
            fi
        }
        
        handle() {
            case $1 in
                activewindow*) toggle_wallpaper ;;
                changefloatingmode*) toggle_wallpaper ;;
            esac
        }

        socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
    ''
