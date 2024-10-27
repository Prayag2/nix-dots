{ ... }: {
  programs.mpv.enable = true;

  # anime4k
  home.file.".config/mpv/shaders".source = ./shaders;  
  home.file.".config/mpv/input.conf".source = ./input.conf;  
  home.file.".config/mpv/mpv.conf".source = ./mpv.conf;  
}
