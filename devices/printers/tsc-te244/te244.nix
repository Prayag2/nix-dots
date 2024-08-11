{ stdenv, autoPatchelfHook, lib, glibc, cups, libusb1, gtk2, cairo, gdk-pixbuf, glib }:

stdenv.mkDerivation rec {
  name = "te244-${version}";
  version = "1.0";

  src = ./.;

  nativeBuildInputs = [ autoPatchelfHook ];

  buildInputs = [ glibc cups libusb1 gtk2 cairo gdk-pixbuf glib ];

  preBuild = ''
    addAutoPatchelfSearchPath ${lib.getLib cups}/lib/
  '';

  runtimeDependencies = [ (lib.getLib cups) ];

  installPhase = ''
    runHook preInstall

    install_path="$out/share/tscbarcode/printer"
    model_path="$out/share/cups/model/tscbarcode/"
    filter_path="$out/lib/cups/filter/"
    backend_path="$out/lib/cups/backend/"

    mkdir -p $install_path
    mkdir -p $model_path
    mkdir -p $filter_path
    mkdir -p $backend_path

    install -Dm755 ./files/TE244.ppd $model_path
    install -Dm755 ./files/rastertobarcodetspl $filter_path
    install -Dm755 ./files/brsocket $backend_path
    install -Dm755 ./files/brusb $backend_path

    install -Dm755 ./files/thermalprinterui $install_path
    install -Dm755 ./files/thermalprinterut $install_path
    install -Dm755 ./files/crontest $install_path
    install -Dm755 ./files/teststatus $install_path
    cp ./files/tsc_test_11.prn $install_path
    cp ./files/thermalprinterui.png $install_path
    cp ./files/barcodeprintersetting.desktop $out/share/applications/

    substituteInPlace \
      $out/share/applications/barcodeprintersetting.desktop \
      --replace /usr/local/ $out/share/

    runHook postInstall
  '';
}
