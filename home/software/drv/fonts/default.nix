{ stdenv, lib, fontconfig }: 

stdenv.mkDerivation {
  pname = "my-fonts";
  version = "1.0";

  src = ./ttf;

  buildInputs = [ fontconfig ];

  installPhase = ''
    mkdir -p $out/share/fonts/truetype
    cp *.ttf $out/share/fonts/truetype/
  '';

  postInstall = ''
    fc-cache -v $out/share/fonts/truetype
  '';

  meta = with lib; {
    description = "Custom fonts";
    license = licenses.mit;
  };
}
