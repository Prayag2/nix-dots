{ pkgs, lib, ... }: 
let
  configFile = pkgs.writeText "create_ap.conf" ''
    CHANNEL=6
    DHCP_DNS=gateway
    NO_VIRT=1
    FREQ_BAND=2.4
    WIFI_IFACE=wlo1
    INTERNET_IFACE=enp2s0
    SSID=ideapad
    PASSPHRASE=password
  '';
in {
  imports = [
    ./configs/flatpak
  ];

  services.flatpak.uninstallUnmanaged = true;
  environment.systemPackages = with pkgs; [
    distrobox
    openrgb-with-all-plugins
  ];

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  services.hardware.openrgb.enable = true;

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
  };

  virtualisation.docker = {
    enable = true;
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

  systemd = {
    services.create_ap = {
      wantedBy = lib.mkForce [];
      description = "Create AP Service";
      after = [ "network.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.linux-wifi-hotspot}/bin/create_ap --config ${configFile}";
        KillSignal = "SIGINT";
        Restart = "on-failure";
      };
    };
  };

  # MOVIESSS
  services = {
    radarr = {
        enable = false;
        openFirewall = true;
    };
    prowlarr = {
        enable = false;
        openFirewall = true;
    };
    nzbget = {
        enable = false;
    };
    jellyfin = {
        enable = false;
        openFirewall = true;
    };
    ombi = {
        enable = false;
        openFirewall = true;
    };
  };
  virtualisation.virtualbox.host.enable = true;
}
