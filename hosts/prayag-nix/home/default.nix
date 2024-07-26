{ config, pkgs, ... }:

{
  imports = [
    ./scripts
    ./packages
    ./configs/hyprland 
    ./configs/hypridle
    ./configs/hyprlock
    ./configs/gtk
    ./configs/qt
    ./configs/waybar
    ./configs/alacritty
    ./configs/rofi
    ./configs/xresources
    ./configs/dunst
    ./configs/vscode
  ];

  # Information
  home.username = "prayag";
  home.homeDirectory = "/home/prayag";

  # Don't change this
  home.stateVersion = "23.11";

  # Dotfiles
  home.file = {
    ".local/share/wallpapers/default.png".source = ./wallpaper/default.png;
    ".local/bin".source = ./scripts;
    ".config/themes/".source = configs/themes;
  };
}
