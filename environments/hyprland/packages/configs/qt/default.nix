{ lib, pkgs, ... }: {
  qt = {
    enable = true;
    platformTheme.name = lib.mkForce "kde";
    # style.name = lib.mkForce "";
  };

  home.packages = with pkgs; [
    kdePackages.qt6gtk2
    libsForQt5.qtstyleplugins
    gtk_engines
  ];
}
