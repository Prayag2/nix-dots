{ ... }:
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
      #"$scriptDir/keyrgb.sh"
      "sleep 2 && xrdb -merge ~/.Xresources"
    ];

    source = "$HOME/.cache/wal/colors-hyprland.conf";
  };
}
