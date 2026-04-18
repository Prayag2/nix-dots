{ pkgs, ... }: {
  imports = [
    ../../environments/kde/packages/global.nix
    ../../packages/global.nix
    ../../devices/printers

    ../../common/audio
    ../../common/config.nix
    ../../common/boot.nix
    ../../common/filesystem.nix
    ../../common/keyring.nix
    ../../common/network.nix
    ../../common/gdm.nix
    ../../common/touchpad.nix
    ../../common/fonts.nix
  ];
  users.users.prayag_kde = {
    home = "/home/prayag_kde";
    description = "Prayag Jain";
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "storage" ];
    shell = pkgs.zsh;
  };
}
