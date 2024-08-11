{config, pkgs, ...}: {
  environment.systemPackages = [
    pkgs.cups-pdf-to-pdf
  ];
  services.printing.drivers = [
    (pkgs.callPackage ./te244.nix {})
  ];
  hardware.printers.ensurePrinters = [
    {
      name = "TSC-TE244";
      description = "Barcode Label Printer";
      location = "Living Room";
      deviceUri = "usb://TSC/TE244?serial=000001";
      model = "TE244.ppd";
    }
  ];
}
