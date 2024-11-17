{ ... }:
{
  imports = [
    ./software/local.nix
    ../../software/local.nix
  ];

  # Don't change this
  home.stateVersion = "24.05";
}
