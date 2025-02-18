{ pkgs, inputs, ... }:
let
  local-overlays = import ../overlays {inherit inputs;};
in
{
  # not a part of home manager!
  programs = {
    file-roller.enable = true;
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

  # aliases
  programs.zsh.shellAliases = {
    "ranger" = ''ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'';
  };

  nixpkgs.overlays = [
    local-overlays.rofi-plugins
  ];

  environment.variables.QT_QPA_PLATFORMTHEME = "qt6ct";
}
