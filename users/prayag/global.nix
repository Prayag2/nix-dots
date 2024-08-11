{config, pkgs, ...}: {
  imports = [
    ../../home/environments/hyprland/packages/global.nix
    ../../home/software/global.nix
  ];
  users.users.prayag = {
    home = "/home/prayag";
    description = "Prayag Jain";
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "storage" ];
    shell = pkgs.zsh;
  };
}
