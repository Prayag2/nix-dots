{ pkgs, ... }:
let
  custom-scr-video_wall = "${(pkgs.callPackage ../../../scripts/custom-scr-video_wall.nix {inherit pkgs;})}/bin/custom-scr-video_wall";
in
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"

      "waybar &"
      "wal -R"
      "cliphist wipe &"
      "swww init &"
      "hyprctl setcursor Bibata-Original-Classic 20"
      "xsetroot -cursor_name left_ptr &"
      "sleep 2 && xrdb -merge ~/.Xresources"
      "${custom-scr-video_wall} &"
    ];

    source = "$HOME/.cache/wal/colors-hyprland.conf";
  };
}