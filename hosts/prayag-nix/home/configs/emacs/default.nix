{config, pkgs, ...}: {
  home.file.".emacs.d/init.el".source = ./config.el;
}
