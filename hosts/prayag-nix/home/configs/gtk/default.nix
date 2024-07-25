{configs, pkgs, ...}: {
  home.file.".config/wal/templates/gtk.css" = {
    source = ./gtk.css;
    force = true;
  };
  gtk = {
    enable = true;
    cursorTheme.name = "Bibata-Original-Classic";
    cursorTheme.size = 20;
    font.name = "JetBrainsMono Nerd Font";
    theme.name = "linea-nord-color";
    iconTheme.name = "flattrcolor";
  };
}
