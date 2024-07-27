{config, pkgs, ...}: {
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
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
}
