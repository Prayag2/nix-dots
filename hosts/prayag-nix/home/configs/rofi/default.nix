{config, pkgs, ...}: {
  programs.rofi = {
    plugins = with pkgs; [
      rofi-calc
    ];
  };
  home.file.".config/wal/templates/theme.rasi" = {
    source = ./theme.rasi;
    force = true;
  };
}
