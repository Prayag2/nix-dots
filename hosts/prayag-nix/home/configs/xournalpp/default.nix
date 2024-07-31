{config, pkgs, ...}: {
  home.file.".config/xournalpp/settings.xml".source = ./settings.xml;
}
