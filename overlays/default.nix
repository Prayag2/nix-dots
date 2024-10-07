{ inputs, ... }: {
  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
  emacs-overlay = import (fetchTarball {
    url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
    sha256 = "0zzxixwmmwrlz3k657q5yajbrb1nqvk1rdm625a8wanp8d3rs7n3";
  });
}
