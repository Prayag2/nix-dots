{pkgs}:
  pkgs.writeShellScriptBin "rofi" ''
    # overrides the rofi command
    rofi "$@" & sleep 0.2; hyprctl dispatch focuswindow \"^(Rofi)\"
  ''
