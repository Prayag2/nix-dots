{ config, pkgs, inputs, ... }:
let
  overlays = import ../overlays {inherit inputs;};
in
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
    ./configs/emacs
    ./configs/ranger
    ./configs/opentabletdriver
    ./configs/xournalpp
  ];

  # Information
  home.username = "prayag";
  home.homeDirectory = "/home/prayag";

  # Don't change this
  home.stateVersion = "24.05";

  # Dotfiles
  home.file = {
    ".local/share/wallpapers/default.png".source = ./wallpaper/default.png;
    ".local/bin".source = ./scripts;
    ".config/themes/".source = configs/themes;
  };

  nixpkgs.overlays = [
    overlays.unstable-packages    
  ];
}
