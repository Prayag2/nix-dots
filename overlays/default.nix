{ inputs, ... }: {
  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };

  old-rnote = import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/05bbf675397d5366259409139039af8077d695ce.tar.gz";
    sha256 = "1phisy95shvwdqcb8akrsk1qf3af52ch93nqp8wbgl5vqq3xmz54";
  });

  emacs-overlay = import (fetchTarball {
    url = "https://github.com/nix-community/emacs-overlay/archive/87e8ffccb53aa67dfaab7bd4fd9f27b543e73cec.tar.gz";
    sha256 = "1phisy95shvwdqcb8akrsk1qf3af52ch93nqp8wbgl5vqq3xmz54";
  });
}
