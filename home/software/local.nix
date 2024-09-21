{ pkgs, ...}: {

  imports = [
    ./configs/vscode
    ./configs/neovim
    ./configs/tmux
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
    libreoffice-fresh
    cachix
  ];

  programs = {
    git = {
      enable = true;
      userEmail = "prayagjain2@gmail.com";
      userName = "Prayag2";
    };
  };
}
