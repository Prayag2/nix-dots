{config, pkgs, ...}: {
  # not a part of home manager!
  programs = {
    file-roller.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;		
    };
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [ 
        thunar-volman
        thunar-archive-plugin 
      ];
    };
  };
}
