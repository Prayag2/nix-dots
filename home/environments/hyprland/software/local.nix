{ pkgs, ... }: {
  imports = [
    ./configs
    ./configs/alacritty
    ./configs/dunst
    ./configs/hypridle
    ./configs/hyprlock
    ./configs/qt
    ./configs/ranger
    ./configs/rofi
    ./configs/waybar
  ];
  home.packages = with pkgs; [
    imagemagick
    sxiv
    pavucontrol
    hyprpicker
    wl-clipboard
    wtype
    playerctl
    pywal
    swww
    grim
    slurp
    optipng
    yad
    libnotify
    wpgtk
    bibata-cursors
    papirus-icon-theme
    pamixer
    xdg-desktop-portal-hyprland
  ];
  programs = {
    home-manager.enable = true;
  };
  home.file.".config/themes/".source = ./configs/themes;
  services = {
    cliphist = {
      enable = true;
      systemdTarget = "hyprland-session.target";
    };
    swayosd.enable = true;
    network-manager-applet.enable = true;
    kdeconnect.enable = true;
  };
}
