{ pkgs, ... }: {
  imports = [
    ../../home/environments/hyprland/packages/global.nix
    ../../home/software/global.nix
    #../../devices/printers/tsc-te244
    ../../devices/printers

    ../../common/audio
    ../../common/config.nix
    ../../common/boot.nix
    ../../common/filesystem.nix
    ../../common/keyring.nix
    ../../common/network.nix
    ../../common/sddm.nix
    ../../common/touchpad.nix
  ];
  users.users.prayag = {
    home = "/home/prayag";
    description = "Prayag Jain";
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "storage" ];
    shell = pkgs.zsh;
  };
}
