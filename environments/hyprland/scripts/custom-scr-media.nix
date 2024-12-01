{pkgs}:
  pkgs.writeShellScriptBin "custom-scr-media" /*bash*/ ''
    source ~/.cache/wal/colors.sh
    echo "   No Media"
    playerctl metadata -f '{{status}} {{title}}' -F 2>/dev/null | while read event; do
        out=$(playerctl metadata -f '{{status}} {{title}}' 2>/dev/null)
        if [[ -z $out || -z $(playerctl metadata -f '{{title}}') ]]; then
          [[ $XDG_SESSION_TYPE = "wayland" ]] || echo "%{T3}%{T-} No Media" && echo "   No Media"
        else
          if [[ $XDG_SESSION_TYPE = "wayland" ]]; then
            echo $out | sed "s/Paused/ /; s/Playing/ /;  s/Stopped/ /;"
          else
            echo $out | sed "s/Paused/%{T3}%{T-}/;  s/Playing/%{T3}%{T-}/;  s/Stopped/%{T3}%{T-}/;"
          fi
        fi
    done
  ''


