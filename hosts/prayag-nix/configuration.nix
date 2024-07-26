{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    ./system/printers.nix
    ./system/filesystem.nix
    ./system/bluetooth.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "prayag-nix";
  networking.networkmanager.enable = true;

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
  nixpkgs.config.permittedInsecurePackages = [
      "electron-27.3.11"
    ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.displayManager.sddm = {
    enable = true;
    enableHidpi = true;
    autoNumlock = true;
  };

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
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    };
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

    graphics.enable = true;

    nvidia = {
      modesetting.enable = true;
      open = false; # use proprietary drivers
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      prime = {
        sync.enable = true; # automatically switches to GPU when required
        amdgpuBusId = "PCI:6:0:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };

  services.fstrim.enable = true;
  services.xserver.videoDrivers = ["nvidia"];

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
  ];
  
  # experimental features
  nix.settings.experimental-features = ["nix-command" "flakes"];

  nixpkgs.config = {
    allowUnfree = true;
  };
  
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 10d";
  };

  # DON'T TOUCH THIS
  system.stateVersion = "24.05";
}

