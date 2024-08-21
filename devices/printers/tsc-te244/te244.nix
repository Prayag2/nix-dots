{ stdenv, autoPatchelfHook, lib, glibc, cups, libusb1, gtk2, cairo, gdk-pixbuf, glib, makeDesktopItem }:

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

  desktopItem = makeDesktopItem {
    name = "tsc_settings";
    exec = "thermalprinterui %u";
    icon = "thermalprinterui.png";
    desktopName = "TSC Printer Settings";
    comment = "Settings for TSC Barcode Printers";
    categories = [ "HardwareSettings" "Settings" "Printing" ];
  };

  installPhase = ''
    runHook preInstall

    application_path="$out/share/applications/"
    install_path="${desktopItem}/bin/"
    model_path="$out/share/cups/model/tscbarcode/"
    filter_path="$out/lib/cups/filter/"
    backend_path="$out/lib/cups/backend/"

    mkdir -p $application_path
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
    #cp ./files/barcodeprintersetting.desktop $application_path

    #substituteInPlace \
    #  $application_path/barcodeprintersetting.desktop \
    #  --replace /usr/local/ $out/share/

    runHook postInstall
  '';
}
