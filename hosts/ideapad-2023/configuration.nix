{ ... }:
{
  imports = [ 
    ./system
    ./hardware-configuration.nix
  ];

  networking.hostName = "ideapad-2023";
  services.fstrim.enable = true;

  # DON'T TOUCH THIS
  system.stateVersion = "24.05";
}

