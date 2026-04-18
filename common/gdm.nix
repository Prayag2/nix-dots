{ pkgs, lib, ... }: {
  environment.systemPackages = [(
    pkgs.catppuccin-sddm.override {
      flavor = "frappe";
      accent = "teal";
      font  = "JetBrains Mono";
      fontSize = "12";
      loginBackground = false;
    }
  )];

  services.displayManager.sddm = lib.mkForce {
    enable = true;
    theme = "catppuccin-frappe-teal";
    package = pkgs.kdePackages.sddm;
    wayland.enable = true;
    autoNumlock = true;
    enableHidpi = true;
  };
}
