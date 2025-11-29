{ ... }: {
  boot.initrd.systemd.network.wait-online.enable = false;
  networking = {
    networkmanager.enable = true;
    networkmanager.wifi.powersave = false;

    firewall = { 
      enable = true;
      allowedTCPPortRanges = [ 
        { from = 1714; to = 1764; } # KDE Connect
      ];  
      allowedUDPPortRanges = [ 
        { from = 1714; to = 1764; } # KDE Connect
      ];  
    };  
  };
}
