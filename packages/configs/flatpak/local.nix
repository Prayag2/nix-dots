{ lib, ... }: {
    home.sessionVariables = {
        XDG_DATA_DIRS= lib.mkDefault "$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share";
    };
}
