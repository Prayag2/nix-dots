{ config, pkgs, ... }: 
let
  fontSize = 12*config.myFont.font.size_multiplier;
  fontFamily = config.myFont.font.nerd_name;
  opacity = 1;
in
{
  home.packages = [ pkgs.alacritty ];
  home.file.".config/wal/templates/alacritty.toml" = {
      text = builtins.readFile ./alacritty.toml + ''
        [font]
        size = ${builtins.toString fontSize}

        [font.normal]
        family = "${fontFamily}"

        [window]
        opacity = ${builtins.toString opacity}
        
        [env]
        term = "xterm-256color"
      '';
      force = true;
    };
}
