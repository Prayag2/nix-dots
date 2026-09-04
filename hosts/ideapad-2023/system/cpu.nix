{ ... }: {
  services.auto-cpufreq = {
    enable = false;
  };

  services.power-profiles-daemon = {
    enable = true;
  };

  # boot.kernelParams = [ "acpi_mask_gpe=0x07" ];
}
