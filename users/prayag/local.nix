{ ... }: {
  imports = [
    ../../environments/hyprland
    ../../packages/local.nix
  ];
  home.username = "prayag";
  home.homeDirectory = "/home/prayag";
}
