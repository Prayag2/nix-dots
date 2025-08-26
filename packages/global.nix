{ pkgs, ... }: {
  imports = [
    ./configs/flatpak
  ];

  services.flatpak.uninstallUnmanaged = true;
  environment.systemPackages = with pkgs; [
    distrobox
    jellyfin-media-player
  ];
  programs.zsh.enable = true;

  nixpkgs = {
    config = {
      permittedInsecurePackages = [
        "electron-27.3.11"
      ];
    };
  };

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  environment.variables = {
    EDITOR = "vim";
    BROWSER = "firefox";
        TERMINAL = "alacritty";
  };

  hardware = {
    opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };
  };

  services.create_ap = {
    settings = {
        CHANNEL=6;
        DHCP_DNS="gateway";
        NO_VIRT=1;
        FREQ_BAND="2.4";
        WIFI_IFACE="wlo1";
        INTERNET_IFACE="enp2s0";
        SSID="ideapad";
        PASSPHRASE="password";
    };
    enable = false;
  };

  # MOVIESSS
  services = {
    radarr = {
        enable = true;
        openFirewall = true;
    };
    prowlarr = {
        enable = true;
        openFirewall = true;
    };
    nzbget = {
        enable = true;
    };
    jellyfin = {
        enable = true;
        openFirewall = true;
    };
    ombi = {
        enable = true;
        openFirewall = true;
    };
  };
}
