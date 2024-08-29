{ pkgs, inputs, ... }:
let
  local-overlays = import ../overlays {inherit inputs;};
in
{
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

  nixpkgs.overlays = [
    local-overlays.rofi-plugins
  ];
}
