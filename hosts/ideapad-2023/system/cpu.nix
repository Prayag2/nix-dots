{ ... }: {
  services.auto-cpufreq = {
    enable = true;
  };
  services.power-profiles-daemon.enable = false;
  # boot.kernelParams = [ "acpi_mask_gpe=0x07" ];
}
