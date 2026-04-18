{ ... }: {
  services.hyprpaper.enable = true;
  services.hyprpaper.settings = {
    ipc = "on";
    splash = false;

    preload =
      [ "$HOME/.local/share/wallpapers/wall.png" ];

    wallpaper = [
      "eDP-1, $HOME/.local/share/wallpapers/wall.png"
    ];
  };
}
