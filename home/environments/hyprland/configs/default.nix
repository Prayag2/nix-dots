{config, pkgs, ...}: {
  imports = [
    ./hyprland
    ./hypridle
    ./hyprlock
    ./gtk
    ./qt
    ./waybar
    ./alacritty
    ./rofi
    ./xresources
    ./dunst
    ./ranger
  ];
}
