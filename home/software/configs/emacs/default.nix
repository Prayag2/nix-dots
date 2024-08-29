{ ... }: {
  home.file.".emacs.d/init.el".source = ./config.el;
  programs.emacs.enable = true;
}
