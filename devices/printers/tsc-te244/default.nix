{ pkgs, ... }: {
  environment.systemPackages = [
    pkgs.cups-pdf-to-pdf
    (pkgs.callPackage ./te244driver.nix {})
  ];
  # services.printing.drivers = [
  #   (pkgs.callPackage ./te244driver.nix {})
  # ];
  # hardware.printers.ensurePrinters = [
  #   {
  #     name = "TSC-TE244";
  #     description = "Barcode Label Printer";
  #     location = "Living Room";
  #     deviceUri = "usb://TSC/TE244?serial=000001";
  #     model = "TE244.ppd";
  #   }
  # ];
}
