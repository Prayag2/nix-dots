{ pkgs, inputs, ... }:
let
  local-overlays = import ../overlays {inherit inputs;};
in
{
  # not a part of home manager!
  programs = {
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [ 
        thunar-volman
        thunar-archive-plugin 
      ];
    };
    hyprland = {
      enable = true;
      xwayland.enable = true;		
    };
  };

  services = {
    tumbler.enable = true;
  };

  nixpkgs.overlays = [
    local-overlays.rofi-plugins
  ];

  environment.systemPackages = with pkgs; [
    inter
  ];

  environment.variables.QT_QPA_PLATFORMTHEME = "qt6ct";
}
