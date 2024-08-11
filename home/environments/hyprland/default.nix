{ config, pkgs, inputs, ... }:
let
  global-overlays = import ../../../overlays {inherit inputs;};
  local-overlays = import ./overlays {inherit inputs;};
in
{
  imports = [
    ./scripts
    ./configs
    ./packages/local.nix
    ../../software/local.nix
  ];

  # Don't change this
  home.stateVersion = "24.05";

  # Dotfiles
  home.file = {
    ".local/share/wallpapers/default.png".source = ./wallpaper/default.png;
    ".local/bin".source = ./scripts;
    ".config/themes/".source = configs/themes;
  };

  nixpkgs.overlays = [
    global-overlays.unstable-packages    
    local-overlays.rofi-plugins
  ];
}
