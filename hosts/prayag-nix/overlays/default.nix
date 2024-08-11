{inputs, ...}: {
  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
  rofi-plugins = final: _prev: {
    rofi-calc = _prev.rofi-calc.override { rofi-unwrapped = _prev.rofi-wayland-unwrapped; };
    rofimoji = _prev.rofimoji.override { rofi = _prev.rofi-wayland; };
  };
}
