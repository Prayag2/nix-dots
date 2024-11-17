{ ... }: {
  imports = [
    ../../home/environments/kde
    ../../home/software/local.nix
  ];
  home.username = "prayag_kde";
  home.homeDirectory = "/home/prayag_kde";
}
