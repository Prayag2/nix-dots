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
    ranger
    yad
    libnotify
    pywalfox-native
    imagemagick
    wpgtk
    bibata-cursors
    papirus-icon-theme
    pamixer
    btop
    alacritty
    kitty
    sxiv
    afetch
    vmware-horizon-client
    dunst
    jq
    logseq
    zoom-us
    webcord
    xdg-desktop-portal-hyprland
  ];

  programs = {
    home-manager.enable = true;
    hyprlock.enable = true;
    rofi.enable = true;
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
      config = {
        safe.directory = "$HOME/nixos";
      };
    };
    vscode.enable = true;
  };

  services = {
    #dunst.enable = true;
    cliphist = {
      enable = true;
      systemdTarget = "hyprland-session.target";
    };
    swayosd.enable = true;
    hypridle.enable = true;
    network-manager-applet.enable = true;
  };
}
