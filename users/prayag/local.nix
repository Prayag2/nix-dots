{ ... }: {
  imports = [
    ../../home/environments/hyprland
    ../../home/software/local.nix
  ];
  home.username = "prayag";
  home.homeDirectory = "/home/prayag";
}
