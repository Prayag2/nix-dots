{config, pkgs, ...}: {
  programs.emacs = {
    extraConfig = builtins.readFile ./config.el;
  };
}
