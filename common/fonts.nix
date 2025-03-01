{ config, lib, ... }: 
let
    font_list = [
        {
            name = "JetBrains Mono";
            nerd_name = "JetBrainsMono Nerd Font";
            size_multiplier = 1;
        }
        {
            name = "BlexMono Nerd Font Mono";
            nerd_name = "BlexMono Nerd Font Mono";
            size_multiplier = 1;
        }
        {
            name = "Brass Mono Code";
            nerd_name = "BrassMonoCode Nerd Font";
            size_multiplier = 1.15;
        }
        {
            name = "EnvyCodeR Nerd Font Mono";
            nerd_name = "EnvyCodeR Nerd Font Mono";
            size_multiplier = 1;
        }
    ];
in
{
    options.myFont = {
        font = lib.mkOption {
            type = lib.types.attrsOf lib.types.anything;
            default = (builtins.elemAt font_list 0);
            description = "System wide font";
        };
    };

    config.myFont.font = (builtins.elemAt font_list 1);
}
