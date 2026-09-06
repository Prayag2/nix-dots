{ inputs, pkgs, unstable-pkgs, ... }:
{
  services.xserver.enable = true;
  services.desktopManager.plasma6.enable = true;

  nixpkgs.overlays = [
    (final: prev: {
      kdePackages = unstable-pkgs.kdePackages;
    })
  ];
}
