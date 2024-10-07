{ ... }: {
  programs.hyprlock.settings = {
    enable = true;
    source = "~/.cache/wal/colors-hyprland.conf";
    background = {
        path = "~/.local/share/wallpapers/wall.png";
        blur_passes = 3;
        contrast = 0.8916;
        brightness = 0.8172;
        vibrancy = 0.1696;
        vibrancy_darkness = 0.0;
    };
    general = {
        no_fade_in = false;
        grace = 0;
        disable_loading_bar = true;
    };
    input-field = {
        size = "250, 40";
        outline_thickness = 2;
        dots_size = 0.2;
        dots_spacing = 0.2;
        dots_center = true;
        outer_color = "rgba(0, 0, 0, 0)";
        inner_color = "rgba(0, 0, 0, 0.5)";
        font_color = "rgb(200, 200, 200)";
        fade_on_empty = false;
        font_family = "JetBrains Mono Nerd Font";
        placeholder_text = "<i><span foreground=\"##cdd6f4\">Input Password...</span></i>";
        hide_input = false;
        position = "0, -120";
        halign = "center";
        valign = "center";
    };
    label = [
      {
        text = "cmd[update:1000] echo \"$(date +\"%-I:%M%p\")\"";
        color = "$foreground";
        font_size = 120;
        font_family = "JetBrains Mono Nerd Font ExtraBold";
        position = "0, -300";
        halign = "center";
        valign = "top";
      }
      {
        text = "Hi there, $USER";
        color = "$foreground";
        font_size = 25;
        font_family = "JetBrains Mono Nerd Font";
        position = "0, -40";
        halign = "center";
        valign = "center";
      }
    ];
  };
}
