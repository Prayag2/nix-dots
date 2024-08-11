{ config, lib, pkgs, inputs, ... }:
let
  overlays = import ./overlays {inherit inputs;};
in
{
  imports = [ 
    ./system
    ./hardware-configuration.nix

    ../../devices/printers

    ../../common/config.nix
    ../../common/audio.nix
    ../../common/boot.nix
    ../../common/filesystem.nix
    ../../common/keyring.nix
    ../../common/network.nix
    ../../common/sddm.nix
    ../../common/touchpad.nix
  ];

  networking.hostName = "ideapad-2023";
  services.fstrim.enable = true;

  # DON'T TOUCH THIS
  system.stateVersion = "24.05";
}

