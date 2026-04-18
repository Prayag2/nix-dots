{ config, pkgs, ... }: {
  home.file.".config/wal/templates/gtk.css" = {
    source = ./gtk.css;
    force = true;
  };

  home.pointerCursor = {
    gtk.enable = true;
    #x11.enable = true;
    package = pkgs.apple-cursor;
    name = "macOS";
    size = 24;
  };

  gtk = {
    enable = true;
    cursorTheme.name = "macOS";
    cursorTheme.size = 24;
    font.name = config.myFont.font.nerd_name;
    font.size = 10;
    theme.name = "linea-nord-color";
    iconTheme.name = "Papirus-Dark";

    gtk3.extraConfig = {
      gtk-button-images=true;
      gtk-menu-images=true;
      gtk-xft-hintstyle="hintnone";
      gtk-xft-rgba="rgb";
      gtk-application-prefer-dark-theme=true;
      gtk-decoration-layout="icon:minimize,maximize,close";
      gtk-enable-animations=true;
    };

    gtk4.extraConfig = {
      gtk-button-images=true;
      gtk-menu-images=true;
      gtk-xft-hintstyle="hintnone";
      gtk-xft-rgba="rgb";
      gtk-application-prefer-dark-theme=true;
      gtk-decoration-layout="icon:minimize,maximize,close";
      gtk-enable-animations=true;
    };
  };
}
