{config, pkgs, ...}: {
  home.file.".Xresources".text = ''
    Xcursor.theme: "Bibata-Modern-Classic"
    Xft.dpi: 120
  '';
}
