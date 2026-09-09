{ pkgs, lib, ... }: {
  services.displayManager.sddm.enable = false;

  services.displayManager.ly = {
    enable = true;
  };
}
