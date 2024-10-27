{ pkgs, ... }: {
  services.displayManager.sddm = {
    enable = true;
    enableHidpi = true;
    autoNumlock = true;
    wayland.enable = true;
    theme = "chili";
  };
  environment.systemPackages = with pkgs; [
    sddm-chili-theme
  ];
  security.pam.services.sddm.enableGnomeKeyring = true;
}
