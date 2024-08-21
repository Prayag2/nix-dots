{config, pkgs, ...}: {

  imports = [
    ./configs/vscode
    # ./configs/emacs
    ./configs/opentabletdriver
    ./configs/xournalpp
  ];

  home.packages = with pkgs; [
    firefox
    tree
    btop
    kitty
    neofetch
    vmware-horizon-client
    logseq
    webcord
    inkscape
    ookla-speedtest
    gnome-disk-utility
    obs-studio
    baobab
    cava
    telegram-desktop
    simple-scan
    gimp
    corefonts
  ];

  programs = {
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
  };
}
