{ ... }: {
  services.auto-cpufreq = {
    enable = true;
  };
  boot.kernelParams = [ "acpi_mask_gpe=0x07" ];
}
