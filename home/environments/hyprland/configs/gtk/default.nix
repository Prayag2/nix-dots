{configs, pkgs, ...}: {
  home.file.".config/wal/templates/gtk.css" = {
    source = ./gtk.css;
    force = true;
  };
  home.pointerCursor = {
    gtk.enable = true;
    #x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Original-Classic";
    size = 20;
  };
  gtk = {
    enable = true;
    cursorTheme.name = "Bibata-Original-Classic";
    cursorTheme.size = 20;
    font.name = "JetBrainsMono Nerd Font";
    theme.name = "linea-nord-color";
    iconTheme.name = "Papirus-Dark";

    gtk3.extraConfig = {
      gtk-button-images=true;
      gtk-menu-images=true;
      gtk-xft-antialias=true;
      gtk-xft-hinting=false;
      gtk-xft-hintstyle="hintnone";
      gtk-xft-rgba="rgb";
      gtk-application-prefer-dark-theme=true;
      gtk-decoration-layout="icon:minimize,maximize,close";
      gtk-enable-animations=true;
    };
    gtk4.extraConfig = {
      gtk-button-images=true;
      gtk-menu-images=true;
      gtk-xft-antialias=true;
      gtk-xft-hinting=false;
      gtk-xft-hintstyle="hintnone";
      gtk-xft-rgba="rgb";
      gtk-application-prefer-dark-theme=true;
      gtk-decoration-layout="icon:minimize,maximize,close";
      gtk-enable-animations=true;
    };
  };
}
