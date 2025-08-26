{ pkgs, ... }: {
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    jack.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;

    configPackages = [
    #   (pkgs.writeTextDir "share/pipewire/pipewire.conf.d/sink-virtual-surround-7.1-hesuvi.conf" (builtins.readFile ./surround.conf))
      (pkgs.writeTextDir "share/pipewire/pipewire.conf.d/combine.conf" (builtins.readFile ./combine.conf))
    ];
  };
  # environment.etc."share/pipewire/sounds/surround.wav" = {
  #   source = ./atmos.wav;
  #   mode = "0644";
  # };
}
