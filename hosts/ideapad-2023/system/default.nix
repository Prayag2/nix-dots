{config, pkgs, ...}: {
  imports = [
    ./tlp.nix
    ./bluetooth.nix
    ./graphics.nix
  ];
}
