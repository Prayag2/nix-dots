{lib, config, pkgs, ...}:
let
  custom-scr-setup = "${(pkgs.callPackage ./custom-scr-setup.nix {inherit pkgs;})}/bin/custom-scr-setup";
  wal="${pkgs.pywal}/bin/wal";
in
{
  home.packages = [
    (import ./custom-scr-setup.nix {inherit pkgs;})
    (import ./custom-scr-ss.nix {inherit pkgs;})
    (import ./custom-scr-reload.nix {inherit pkgs;})
    (import ./custom-scr-power.nix {inherit pkgs;})
    (import ./custom-scr-wall.nix {inherit pkgs;})
    (import ./custom-scr-media.nix {inherit pkgs;})
  ];
  home.activation = {
    reloadAction = lib.hm.dag.entryAfter ["writeBoundary"] ''
      setup_marker="$HOME/.config/onetimesetup"
      if [[ ! -e $setup_marker ]]; then
        echo ":: one time setup ::"
        ${custom-scr-setup}
        touch $setup_marker
      fi

      echo ":: reloading pywal ::"
      ${wal} -R
    '';
  };
}
