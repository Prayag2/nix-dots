{ ... }: {
  imports = [
    ../../environments/kde
    ../../packages/local.nix
    ../../common/fonts.nix
  ];
  home.username = "prayag_kde";
  home.homeDirectory = "/home/prayag_kde";
}
