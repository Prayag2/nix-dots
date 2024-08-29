{ pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    zsh-powerlevel10k
    sddm-chili-theme
  ];

  nixpkgs = {
    config = {
      permittedInsecurePackages = [
        "electron-27.3.11"
      ];
    };
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
        clear
      '';
    };
  };

  hardware = {
    opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };
  };
}
