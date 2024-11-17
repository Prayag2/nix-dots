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
    ./drv/cp
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
    megasync
    vesktop
    ani-cli

    clang-tools
    clang
    (hiPrio gcc)
    (pkgs.callPackage ./drv/lyrics-in-terminal.nix {})
    (pkgs.callPackage ./drv/fonts {})


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
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      initExtraFirst = ''
        if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
          source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
        fi

        # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

        source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      '';
      initExtra = ''
        setopt EMACS
        if [ -t 0 ] && [[ -z $TMUX ]] && [[ $- = *i* ]]; then
          exec tmux
        fi
      '';
    };

    git = {
      enable = true;
      userEmail = "prayagjain2@gmail.com";
      userName = "Prayag2";
    };
  };
}
