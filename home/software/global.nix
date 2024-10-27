{ pkgs, ... }: {
  imports = [
    # nothing
  ];

  environment.systemPackages = with pkgs; [
    zsh-powerlevel10k
    distrobox
  ];

  nixpkgs = {
    config = {
      permittedInsecurePackages = [
        "electron-27.3.11"
      ];
    };
  };

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      setOptions = [
        "EMACS"
      ];
      shellInit = ''
        if [ -t 0 ] && [[ -z $TMUX ]] && [[ $- = *i* ]]; then exec tmux; fi
      '';
    };
  };

  environment.variables = {
    EDITOR = "vim";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
  };

  hardware = {
    opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };
  };
}
