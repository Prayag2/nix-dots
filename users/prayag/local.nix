{ ... }: {
  imports = [
    ../../environments/hyprland
    ../../packages/local.nix
    ../../common/fonts.nix
  ];
  home.username = "prayag";
  home.homeDirectory = "/home/prayag";
}
