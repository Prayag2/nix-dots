{ config, pkgs, lib, ... }: 
let
    font_list = [
        {
            name = "JetBrains Mono";
            nerd_name = "JetBrainsMono Nerd Font";
            size_multiplier = 1;
            pkg = pkgs.nerd-fonts.jetbrains-mono;
        }
        {
            name = "Google Sans Mono";
            nerd_name = "GoogleSansM Nerd Font";
            size_multiplier = 1;
            pkg = pkgs.nerd-fonts.symbols-only;
        }
        {
            name = "Hurmit Nerd Font Mono";
            nerd_name = "Hurmit Nerd Font Mono";
            size_multiplier = 0.9;
            pkg = pkgs.nerd-fonts.hurmit;
        }
        {
            name = "BlexMono Nerd Font Mono";
            nerd_name = "BlexMono Nerd Font Mono";
            size_multiplier = 1;
            pkg = pkgs.nerd-fonts.blex-mono;
        }
        {
            name = "Brass Mono Code";
            nerd_name = "BrassMonoCode Nerd Font";
            size_multiplier = 1.15;
            pkg = pkgs.nerd-fonts.symbols-only;
        }
        {
            name = "EnvyCodeR Nerd Font Mono";
            nerd_name = "EnvyCodeR Nerd Font Mono";
            size_multiplier = 1;
            pkg = pkgs.nerd-fonts.envy-code-r;
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

    config.myFont.font = (builtins.elemAt font_list 0);
}
