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
    xfce.ristretto
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
    apple-cursor
    papirus-icon-theme
    pamixer
    xdg-desktop-portal-hyprland
    socat
    mpvpaper
    ffmpeg

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
