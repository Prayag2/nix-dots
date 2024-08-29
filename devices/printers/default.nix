{ ... }: {
  # enables auto detection of printers using IPP
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
  services.printing = {
    enable = true;
    extraConf = "LogLevel debug";
  };
}
