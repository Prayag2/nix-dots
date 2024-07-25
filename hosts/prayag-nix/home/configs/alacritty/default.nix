{config, pkgs, ...}: 
let
  fontSize = 13;
  fontFamily = "JetBrainsMono Nerd Font";
  opacity = 0.9;
in
{
  home.file.".config/wal/templates/alacritty.toml" = {
      text = builtins.readFile ./alacritty.toml + ''

        [font]
        size = ${builtins.toString fontSize}

        [font.normal]
        family = "${fontFamily}"

        [window]
        opacity = ${builtins.toString opacity}
      '';
      force = true;
    };
}
