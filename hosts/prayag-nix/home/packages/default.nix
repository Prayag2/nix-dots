{configs, pkgs, ...}: 
{
  home.packages = with pkgs; [
    firefox
    pavucontrol
    hyprpicker
    wl-clipboard
    rofimoji
    wtype
    playerctl
    tree
    pywal
    swww
    grim
    slurp
    optipng
    yad
    libnotify
    imagemagick
    wpgtk
    bibata-cursors
    papirus-icon-theme
    pamixer
    btop
    alacritty
    kitty
    sxiv
    neofetch
    vmware-horizon-client
    dunst
    logseq
    webcord
    xdg-desktop-portal-hyprland
    inkscape
    xournalpp
    ookla-speedtest
    ueberzugpp
    gnome.gnome-disk-utility
    obs-studio
    baobab
    cava
  ];

  programs = {
    home-manager.enable = true;
    hyprlock = {
      enable = true;
      package = pkgs.hyprlock;
    };
    rofi = {
      enable = true;
    };
    waybar.enable = true;
    neovim = {
      enable = true;
      extraConfig = ''
        set clipboard=unnamedplus
        set tabstop=2
        set shiftwidth=2
        set softtabstop=2
        set expandtab
      '';
      vimAlias = true;
    };
    git = {
      enable = true;
      userEmail = "prayagjain2@gmail.com";
      userName = "Prayag2";
    };
    vscode.enable = true;
    emacs.enable = false;
    ranger.enable = true;
  };

  services = {
    cliphist = {
      enable = true;
      systemdTarget = "hyprland-session.target";
    };
    swayosd.enable = true;
    hypridle = {
      enable = true;
      package = pkgs.hypridle;
    };
    network-manager-applet.enable = true;
    kdeconnect.enable = true;
  };
}
