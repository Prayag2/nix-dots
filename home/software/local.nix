{ pkgs, ...}: {

  imports = [
    ./configs/emacs
    ./configs/vscode
    ./configs/neovim
    ./configs/tmux
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
    qbittorrent
    jamesdsp
    # (pkgs.callPackage ./drv/lyrics-in-terminal.nix {})
    megasync
    vesktop
  ];

  programs = {
    git = {
      enable = true;
      userEmail = "prayagjain2@gmail.com";
      userName = "Prayag2";
    };
  };
}
