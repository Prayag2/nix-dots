{ pkgs, ... }: {
  home.file.".config/xournalpp/settings.xml".source = ./settings.xml;
  home.file.".config/xournalpp/palette.gpl".source = ./palette.gpl;
  home.file.".config/xournalpp/toolbar.ini".source = ./toolbar.ini;
  home.packages = [ pkgs.xournalpp ];
}
