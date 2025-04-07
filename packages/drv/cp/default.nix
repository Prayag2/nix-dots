{ config, /*pkgs, */ ...} :
# let
#   cp = (pkgs.callPackage ./drv.nix {});
# in
{
  # home.packages = [cp];
  # home.sessionVariables = {
  #   CPLUS_INCLUDE_PATH = "${cp}/include";
  # };
  home.sessionVariables = {
    CPLUS_INCLUDE_PATH = "${config.home.homeDirectory}/.config/scripts/";
  };
  home.file.".config/scripts/cp.sh".source = ./cp.sh;
  home.file.".config/scripts/cp-header.h".source = ./cp-header.h;
  home.file.".config/scripts/bits/stdc++.h.gch".source = ./stdc++.h.gch;
}
