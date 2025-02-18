{ config, pkgs, ... }: {
  home.file.".emacs.d/init.el" = {
    text = builtins.readFile ./config.el + ''
        ;; FONT
        (add-to-list 'default-frame-alist
                     '(font . "${config.myFont.font.name} ${builtins.toString (14*config.myFont.font.size_multiplier)}"))

        (set-frame-font "${config.myFont.font.name} ${builtins.toString (14*config.myFont.font.size_multiplier)}" nil t)
        (set-face-attribute 'default nil :family "${config.myFont.font.name}") 
        (provide 'init)
    '';
    force = true;
  };
  home.packages = [
    (pkgs.emacsWithPackagesFromUsePackage {
      package = pkgs.emacs30-pgtk;
      config = ./config.el;
      defaultInitFile = true;
      alwaysEnsure = true;
      extraEmacsPackages = epkgs: [
        epkgs.use-package
      ];
    })
  ];
}
