{ lib, pkgs, fetchFromGitHub }: {
  pywal16-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "pywal16.nvim";
    version = "2024-11-17";
    src = fetchFromGitHub {
      owner = "uZer";
      repo = "pywal16.nvim";
      rev = "446ae689c8e4569b9537cddadb28d6e939658ea5";
      sha256 = "0g0z1g1nmrjmg9298vg2ski6m41f1yhpas8kr9mi8pa6ibk4m63x";
    };
    meta.homepage = "https://github.com/uZer/pywal16.nvim";
  };
}
