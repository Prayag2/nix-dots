{config, pkgs, ...}: {
  home.file.".config/OpenTabletDriver/settings.json".source = ./settings.json;
}
