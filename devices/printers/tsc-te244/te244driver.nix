{ lib
, stdenv
, fetchzip
, gtk2
, libusb1
, cups
, unzip
}:

stdenv.mkDerivation rec {
  pname = "tscdriver";
  version = "1.2.13";

  src = fetchzip {
    url = "https://fs.tscprinters.com/system/files/linux64_v${version}.zip";
    hash = "sha256-FKLRilAaQMUdtLR8B8I1lNl7YPwB+MJFOjzdsVkDnmg=";
    stripRoot = false;
  };

  nativeBuildInputs = [ cups unzip ];
  buildInputs = [ gtk2 libusb1 ];

  unpackPhase = ''
    tar xf ${src}/Linux64_v${version}/barcodedriver-${version}-x86_64.tar.gz
  '';

  sourceRoot = "barcodedriver-${version}";

  installPhase = ''
    runHook preInstall

    # Install CUPS backends
    install -Dm755 backend/brusb "$out/lib/cups/backend/brusb"
    install -Dm755 backend/brsocket "$out/lib/cups/backend/brsocket"

    # Install CUPS filter
    install -Dm755 rastertobarcodetspl "$out/lib/cups/filter/rastertobarcodetspl"

    # Install PPD files
    install -dm755 "$out/share/cups/model/tsc-ppds"
    install -Dm644 ppd/*.ppd -t "$out/share/cups/model/tsc-ppds"

    runHook postInstall
  '';

  meta = with lib; {
    description = "Drivers for TSC Printers";
    homepage = "https://www.tscprinters.com";
    platforms = platforms.x86_64;
  };
}
