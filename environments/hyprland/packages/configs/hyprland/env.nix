{ ... }: {
  wayland.windowManager.hyprland.settings.env = [
    "XCURSOR_SIZE,20"
    "XDG_CURRENT_DESKTOP,Hyprland"
    "XDG_SESSION_DESKTOP,Hyprland"
    "XDG_SESSION_TYPE,wayland"
    "ELECTRON_OZONE_PLATFORM_HINT,wayland"
    "HYPRCURSOR_THEME,macOS"
    "HYPRCURSOR_SIZE,32"
  ];
}
