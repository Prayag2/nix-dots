{ pkgs, ...} :
let
  cp = (pkgs.callPackage ./drv.nix {});
in
{
  home.packages = [cp];
  home.sessionVariables = {
    CPLUS_INCLUDE_PATH = "${cp}/include";
  };
  home.file.".config/scripts/cp.sh".source = ./cp.sh;
}
