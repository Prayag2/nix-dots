{
  pkgs,
  lib,
  stdenv,
  fetchzip,
  libusb1,
  glibc,
  libGL,
  xorg,
  makeWrapper,
  makeDesktopItem,
  qtx11extras,
  wrapQtAppsHook,
  autoPatchelfHook,
  libX11,
  libXtst,
  libXi,
  libXrandr,
  libXinerama,
  copyDesktopItems,
}:

let
  pname = "xp-pentablet-unwrapped";
  version = "3.4.9-231023";
  configDir = "etc/xp-pen/config";
in
stdenv.mkDerivation rec {
  inherit pname version;
  src = fetchzip {
    url = "https://download01.xp-pen.com/file/2023/11/XPPenLinux${version}.tar.gz";
    name = "XPPenLinux${version}.tar.gz";
    sha256 = "sha256-A/dv6DpelH0NHjlGj32tKv37S+9q3F8cYByiYlMuqLg=";
  };

  nativeBuildInputs = [
    wrapQtAppsHook
    autoPatchelfHook
    makeWrapper
    copyDesktopItems
  ];

  dontBuild = true;
  dontWrapQtApps = true;

  buildInputs = [
    libusb1
    libX11
    libXtst
    libXi
    libXrandr
    libXinerama
    glibc
    libGL
    stdenv.cc.cc.lib
    qtx11extras
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/usr/lib
    cp -r App/usr/lib/pentablet $out/usr/lib
    chmod +x $out/usr/lib/pentablet/PenTablet*

    mkdir -p $out/share/icons
    cp -r App/usr/share/icons/* $out/share/icons
    cp -r App/lib $out/lib

    sed -i "s#usr/lib/pentablet#${configDir}#g" $out/usr/lib/pentablet/PenTablet

    runHook postInstall
  '';

  postFixup = ''
    makeWrapper $out/usr/lib/pentablet/PenTablet $out/bin/xp-pentablet \
       "''${qtWrapperArgs[@]}" \
       --set QT_QPA_PLATFORM xcb \
       --set QT_XKB_CONFIG_ROOT "${xorg.xkeyboardconfig}/share/X11/xkb" \
       --run 'if [ ! -d /${configDir} ] && [ "$EUID" -ne 0 ]; then echo "Please run as root atleast once."; exit 1; fi' \
       --run 'if [ ! -d /${configDir} ]; then mkdir -p /${configDir}; cp -r '$out'/usr/lib/pentablet/conf /${configDir}; fi' \
       --run 'if [ "$EUID" -eq 0 ]; then chmod -R 777 /${configDir}; fi'
  '';

  desktopItems = [
    (makeDesktopItem {
      name = "xppentablet";
      desktopName = "XP Pen Tablet Drivers";
      genericName = "Graphic Tablet Drivers";
      exec = "xp-pentablet";
      icon = "xppentablet";
      comment = "XPPen graphical tablet drivers";
      categories = [
        "Utility"
        "Graphics"
      ];
    })
  ];

  meta = with lib; {
    mainProgram = "xp-pentablet";
    homepage = "https://www.xp-pen.com/";
    description = "Drivers for the XP-PEN drawing tablets";
    platforms = [ "x86_64-linux" ];
    sourceProvenance = with sourceTypes; [ binaryNativeCode ];
    maintainers = [ prayag ];
    license = licenses.unfree;
  };
}
