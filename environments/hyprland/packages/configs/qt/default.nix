{ pkgs, ... }: {
  qt = {
    enable = true;
    platformTheme = "qtct";
    style.name = "kvantum";
  };

  home.packages = with pkgs; [
    kdePackages.qt6ct
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
  ];
}
