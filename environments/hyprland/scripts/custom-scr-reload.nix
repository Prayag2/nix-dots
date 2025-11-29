{pkgs}:
let
  custom-scr-video_wall = "${(pkgs.callPackage ./custom-scr-video_wall.nix {inherit pkgs;})}/bin/custom-scr-video_wall";
in
  pkgs.writeShellScriptBin "custom-scr-reload" ''
    echo ":: reloading pywal ::"
    wal -R >/dev/null 2>&1

    echo ":: reloading xresources ::"
    xrdb -merge $HOME/.Xresources

    echo ":: reloading waybar ::"
    pkill .waybar-wrapped >/dev/null 2>&1
    hyprctl dispatch exec waybar >/dev/null 2>&1

    echo ":: reloading wallpaper ::"
    ${custom-scr-video_wall} >/dev/null 2>&1 &

    echo ":: restarting opentabletdriver ::"
    systemctl restart --user opentabletdriver.service
''
