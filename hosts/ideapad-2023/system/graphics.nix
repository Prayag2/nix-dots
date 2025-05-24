{ config, lib, ... }: 
let
  kver = config.boot.kernelPackages.kernel.version;
in
{
  hardware.nvidia = {
    open = false;
    nvidiaSettings = true;
    modesetting.enable = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
    prime = {
      offload = {
        enable = false;
        enableOffloadCmd = false;
      };
      sync.enable = true;
      amdgpuBusId = "PCI:6:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  hardware = {
    graphics = {
      enable = true;
    };
  };

  # nvidia
  services.xserver.videoDrivers = ["modesetting" "nvidia"];

  # pstate cpu driver
  boot = lib.mkMerge [
    (lib.mkIf
      (
        (lib.versionAtLeast kver "5.17")
        && (lib.versionOlder kver "6.1")
      )
      {
        kernelParams = [ "initcall_blacklist=acpi_cpufreq_init" ];
        kernelModules = [ "amd-pstate" ];
      })
    (lib.mkIf
      (
        (lib.versionAtLeast kver "6.1")
        && (lib.versionOlder kver "6.3")
      )
      {
        kernelParams = [ "amd_pstate=passive" ];
      })
    (lib.mkIf (lib.versionAtLeast kver "6.3") {
      kernelParams = [ "amd_pstate=active" ];
    })
  ];
}
