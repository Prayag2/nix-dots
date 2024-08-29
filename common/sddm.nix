{ ... }: {
  services.displayManager.sddm = {
    enable = true;
    enableHidpi = true;
    autoNumlock = true;
    wayland.enable = true;
    theme = "chili";
  };
}
