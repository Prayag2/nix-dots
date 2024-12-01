{ ... }:
{
  imports = [
    ./scripts
    ./packages/local.nix
  ];

  # Don't change this
  home.stateVersion = "24.05";

  # Dotfiles
  home.file = {
    ".local/share/wallpapers/default.png".source = ./wallpaper/default.png;
    ".local/bin".source = ./scripts;
  };
}
