{pkgs}:
    pkgs.writeShellScriptBin "otd-toggle-tool" ''
        if [[ ''$XDG_SESSION_TYPE = "wayland" ]]; then
            {pkgs.ydotool}/bin/ydotoold
        else

        fi
    ''
