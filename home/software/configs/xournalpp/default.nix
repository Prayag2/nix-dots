{ pkgs, ... }: {
  home.file.".config/xournalpp/settings.xml".source = ./settings.xml;
  home.packages = [ pkgs.xournalpp ];
}
