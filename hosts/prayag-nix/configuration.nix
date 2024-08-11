{ config, lib, pkgs, inputs, ... }:
let
  overlays = import ./overlays {inherit inputs;};
in
{
  imports = [ 
    ./hardware-configuration.nix
    ./system/printers.nix
    ./system/filesystem.nix
    ./system/bluetooth.nix
    ./system/graphics.nix
    ./system/boot.nix
    ./system/sddm.nix
    ./system/network.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";
  time.hardwareClockInLocalTime = true; 

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = lib.mkForce "us";
    useXkbConfig = true; # use xkb.options in tty.
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  security.pam.services.sddm.enableGnomeKeyring = true;
  services.gnome.gnome-keyring.enable = true;
  programs.seahorse.enable = true;

  # Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    jack.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;
  services.libinput.touchpad.tapping = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.prayag = {
    home = "/home/prayag";
    description = "Prayag Jain";
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "storage" ];
    shell = pkgs.zsh;
  };

  # programs
  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;		
    };
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [ thunar-volman thunar-archive-plugin ];
    };
    file-roller.enable = true;
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    };
  };

  nix.settings = {
    substituters = [
      "https://cache.nixos.org/"
      "https://hyprland.cachix.org"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
  };

  environment.pathsToLink = [ "/share/xdg-desktop-portal" "/share/applications" ];

  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      jetbrains-mono
      noto-fonts
      noto-fonts-emoji
      (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "NerdFontsSymbolsOnly" ]; })
    ];
  };

  hardware = {
    opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };
  };

  services.fstrim.enable = true;

  # system packages
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    tmux
    home-manager
    zsh-powerlevel10k
    pulseaudio
    killall
    sddm-chili-theme
  ];
  
  # experimental features
  nix.settings.experimental-features = ["nix-command" "flakes"];

  nixpkgs = {
    overlays = [
      overlays.unstable-packages  
      overlays.rofi-plugins
    ];
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "electron-27.3.11"
      ];
    };
  };
  
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 10d";
  };

  # DON'T TOUCH THIS
  system.stateVersion = "24.05";
}

