{config, pkgs, ...}: {
  home.packages = with pkgs; [
    imagemagick
    alacritty
    sxiv
    pavucontrol
    hyprpicker
    wl-clipboard
    rofimoji
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
    dunst
    xdg-desktop-portal-hyprland
    ueberzugpp
  ];
  programs = {
    home-manager.enable = true;
    hyprlock.enable = true;
    waybar.enable = true;
    ranger.enable = true;
    rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      plugins = with pkgs; [
        rofi-calc
      ];
    };
  };
  services = {
    cliphist = {
      enable = true;
      systemdTarget = "hyprland-session.target";
    };
    hypridle = {
      enable = true;
      package = pkgs.hypridle;
    };
    swayosd.enable = true;
    network-manager-applet.enable = true;
    kdeconnect.enable = true;
  };
}
