{ pkgs, lib, inputs, ... }:
let
  overlays = import ../overlays {inherit inputs;};
in
{
  time.timeZone = "Asia/Kolkata";
  time.hardwareClockInLocalTime = true; 

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = lib.mkForce "us";
    useXkbConfig = true;
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings = {
    substituters = [
      "https://cache.nixos.org/"
      "https://prayag2.cachix.org/"
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "prayag2.cachix.org-1:Lu+JhgBkHI0vNG3VcZJAXTniydou+5bUiqf67kEcA4g="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  environment = {
    pathsToLink = [ 
      "/share/xdg-desktop-portal"
      "/share/applications"
    ];
    systemPackages = with pkgs; [
      git
      vim
      wget
      tmux
      pulseaudio
      killall
      home-manager
    ];
  };

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      overlays.unstable-packages  
      overlays.emacs-overlay
      overlays.old-rnote
    ];
  };


  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      jetbrains-mono
      noto-fonts
      noto-fonts-emoji
      nerdfonts
    ];
  };

  documentation.enable = true;
  documentation.man.enable = true;
  documentation.dev.enable = true;

  services.xserver.enable = true;
  services.xserver.excludePackages = [ pkgs.xterm ]; # i don't want xterm :(

  nix.optimise.automatic = true; 
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 10d";
  };
}
