{ pkgs, ... }: {
  home.file.".emacs.d/init.el".source = ./config.el;
  home.packages = [
    (pkgs.emacsWithPackagesFromUsePackage {
      config = ./config.el;
      defaultInitFile = true;
      alwaysEnsure = true;
      extraEmacsPackages = epkgs: [
        epkgs.use-package
      ];
    })
  ];
}
