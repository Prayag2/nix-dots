{pkgs}:
  pkgs.writeShellScriptBin "custom-scr-reload" ''
    echo ":: reloading pywal ::"
    wal -R >/dev/null 2>&1

    echo ":: reloading xresources ::"
    xrdb -merge $HOME/.Xresources

    echo ":: reloading waybar ::"
    pkill .waybar-wrapped >/dev/null 2>&1
    hyprctl dispatch exec waybar >/dev/null 2>&1
''
