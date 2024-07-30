{config, pkgs, ...}: {
  hardware.nvidia = {
    modesetting.enable = true;
    open = false; # use proprietary drivers
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      amdgpuBusId = "PCI:6:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
  hardware.opengl.enable = true;
  #services.xserver.videoDrivers = ["nvidia"];
}
