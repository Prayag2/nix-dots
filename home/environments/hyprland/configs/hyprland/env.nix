{configs, pkgs, ...}: {
  wayland.windowManager.hyprland.settings.env = [
    "EDITOR,vim"
    "BROWSER,firefox"
    "TERMINAL,kitty"
    "XCURSOR_SIZE,20"
    "XDG_CURRENT_DESKTOP,Hyprland"
    "XDG_SESSION_DESKTOP,Hyprland"
    "XDG_SESSION_TYPE,wayland"
    "ELECTRON_OZONE_PLATFORM_HINT,wayland"
  ];
}
