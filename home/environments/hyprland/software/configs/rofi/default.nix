{ pkgs, ... }: {
  home.file.".config/wal/templates/theme.rasi" = {
    source = ./theme.rasi;
    force = true;
  };
  home.file.".config/rofimoji.rc".text = ''
    action = copy
    files = [emojis, math, nerd_font]
    selector = rofi
    max-recent = 0
  '';
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = with pkgs; [
      rofi-calc
    ];
  };
  home.packages = with pkgs; [ 
    rofimoji
  ];
}
