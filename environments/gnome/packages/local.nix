{ pkgs, ... }: {
  imports = [
  ];

  home.packages = with pkgs; [
    ffmpeg
    libnotify
    wl-clipboard
    pavucontrol
    playerctl
    imagemagick
  ];

  programs = {
    home-manager.enable = true;
  };
}
