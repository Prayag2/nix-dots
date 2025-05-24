{ config, ...} :
# let
#   cp = (pkgs.callPackage ./drv.nix {});
# in
{
  # home.packages = [cp];
  # home.sessionVariables = {
  #   CPLUS_INCLUDE_PATH = "${cp}/include";
  # };
  home.sessionVariables = {
    CPLUS_INCLUDE_PATH = "${builtins.getEnv "CPLUS_INCLUDE_PATH"}:${config.home.homeDirectory}/.config/scripts/";
  };
  home.file.".config/scripts/cp.sh".source = ./cp.sh;
  home.file.".config/scripts/precompile.sh".source = ./precompile.sh;
  home.file.".config/scripts/cp-header.h".source = ./cp-header.h;
}
