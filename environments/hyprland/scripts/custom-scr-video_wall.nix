{pkgs}:
let
  custom-scr-hyprsoc = "${(pkgs.callPackage ./custom-scr-hyprsoc.nix {inherit pkgs;})}/bin/custom-scr-hyprsoc";
in
    pkgs.writeShellScriptBin "custom-scr-video_wall" ''
        pkill -f mpvpaper >/dev/null 2>&1
        pkill -f custom-scr-hyprsoc >/dev/null 2>&1
        video_wall="$HOME/.local/share/wallpapers/wall.mp4"
        if [[ -e "$video_wall" ]]; then
            mpvpaper -vs -o "no-audio loop input-ipc-server=/tmp/mpv-socket" '*' -p "$video_wall" >/dev/null 2>&1 &
            ${custom-scr-hyprsoc} &
        fi
    ''
