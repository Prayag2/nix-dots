{ pkgs, ... }: 
let
  fontSize = 14;
  fontFamily = "JetBrainsMono Nerd Font";
  opacity = 0.9;
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
