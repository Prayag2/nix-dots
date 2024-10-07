{ inputs, pkgs, ... }:
let
  legion-kb-rgb = inputs.legion-kb-rgb.packages.${pkgs.system}.wrapped;
in {
  
}
