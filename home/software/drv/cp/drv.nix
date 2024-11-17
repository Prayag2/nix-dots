{ lib, stdenv }:

stdenv.mkDerivation {
  pname = "cp";
  version = "0.1";

  src = ./.;

  installPhase = ''
    mkdir -p $out/include/cp
    cp *.h $out/include/cp/
  '';

  meta = with lib; {
    description = "Utilities for competitive programming";
    license = licenses.mit;
  };
}
