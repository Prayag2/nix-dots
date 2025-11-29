{ config, pkgs, ... }: {
  imports = [
    ../../environments/hyprland/packages/global.nix
    ../../environments/awesome/packages/global.nix
    ../../packages/global.nix
    ../../devices/printers/tsc-te244
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
  users.users.prayag = {
    home = "/home/prayag";
    description = "Prayag Jain";
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "storage" "input" "docker" ];
    shell = pkgs.zsh;
  };
  fonts.packages = [
    config.myFont.font.pkg
  ];
  nix.settings.trusted-users = ["root" "prayag"];

  # BLOCK WEBSITES
  networking.extraHosts = ''
    0.0.0.0 reddit.com
    0.0.0.0 www.reddit.com
    # 0.0.0.0 old.reddit.com
    0.0.0.0 instagram.com
    0.0.0.0 www.instagram.com
  '';
}
