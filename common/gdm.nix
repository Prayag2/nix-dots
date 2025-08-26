{ pkgs, ... }: {
  environment.systemPackages = [(
    pkgs.catppuccin-sddm.override {
      flavor = "frappe";
      font  = "JetBrains Mono";
      fontSize = "12";
      loginBackground = true;
    }
  )];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    autoNumlock = true;
    enableHidpi = true;
    package = pkgs.kdePackages.sddm;
    theme = "catppuccin-frappe";
  };
}
