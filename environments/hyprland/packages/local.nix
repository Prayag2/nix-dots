{ pkgs, ... }: {
  imports = [
    ./configs
    ./configs/alacritty
    ./configs/dunst
    ./configs/hypridle
    ./configs/hyprlock
    ./configs/qt
    ./configs/rofi
    ./configs/waybar
  ];
  home.packages = with pkgs; [
    xfce.ristretto
    hyprpicker
    wl-clipboard
    pavucontrol
    imagemagick
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
      systemdTargets = ["hyprland-session.target"];
    };
    swayosd.enable = true;
    network-manager-applet.enable = true;
    kdeconnect.enable = true;
  };
}
