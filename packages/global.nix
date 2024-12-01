{ pkgs, ... }: {
  imports = [
    ./configs/flatpak
  ];

  environment.systemPackages = with pkgs; [
    distrobox
  ];
  programs.zsh.enable = true;

  nixpkgs = {
    config = {
      permittedInsecurePackages = [
        "electron-27.3.11"
      ];
    };
  };

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  environment.variables = {
    EDITOR = "vim";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
  };

  hardware = {
    opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };
  };
}
