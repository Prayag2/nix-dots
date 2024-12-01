{ pkgs, ... }: {
  home.file.".emacs.d/init.el".source = ./config.el;
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
