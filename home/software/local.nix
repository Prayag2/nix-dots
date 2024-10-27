{ pkgs, ...}: {

  imports = [
    ./configs/emacs
    ./configs/vscode
    ./configs/neovim
    ./configs/tmux
    ./configs/opentabletdriver
    ./configs/xournalpp
    ./configs/firefox
    ./configs/mpv
  ];

  home.packages = with pkgs; [
    tree
    btop
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
    ani-cli

    # cracked minecraft :)
    # (pkgs.prismlauncher.override {
    #   prismlauncher-unwrapped = pkgs.prismlauncher-unwrapped.overrideAttrs (oldAttrs: {
    #     src = pkgs.fetchFromGitHub {
    #       owner = "Diegiwg";
    #       repo = "PrismLauncher-Cracked";
    #       rev = "v8.4.1";
    #       hash = "sha256-ffx3MgvKj9VsRIK9DT5Cxr+3WSrvMglzLE+kFU/cni4=";
    #     };
    #     buildInputs = oldAttrs.buildInputs ++ [
    #       pkgs.kdePackages.qtnetworkauth
    #     ];
    #   });
    # })
  ];

  programs = {
    git = {
      enable = true;
      userEmail = "prayagjain2@gmail.com";
      userName = "Prayag2";
    };
  };
}
