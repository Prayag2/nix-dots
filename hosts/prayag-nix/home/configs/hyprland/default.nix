{configs, pkgs, inputs, ...}: {

  imports = [
    ./env.nix
    ./monitors.nix
    ./keybindings.nix
    ./autostart.nix
  ];

  home.file.".config/wal/templates/colors-hyprland.conf" = {
    source = ./colors-hyprland.conf;
    force = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    systemd.enableXdgAutostart = true;
    settings = {
      input = {
        kb_layout = "us";
        follow_mouse = true;
        numlock_by_default = true;

        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
          middle_button_emulation = true;
          tap-and-drag = true;
        };
      };
      
      debug.disable_logs = false;

      xwayland.force_zero_scaling = true;

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;

        enable_swallow = true;
        swallow_regex = "^(kitty)$";
        vfr = false;
      };

      general = {
        gaps_in = 3;
        gaps_out = 6;
        border_size = 2;
        layout = "dwindle";
        "col.active_border" = "$color8";
        "col.inactive_border" = "$color8";
      };

      decoration = {
        rounding = 0;
        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 1;
        "col.shadow" = "rgba(1a1a1a80)";

        active_opacity = 1;
        inactive_opacity = 0.85;
        fullscreen_opacity = 1;

        blur = {
          enabled = true;
          size = 4;
          passes = 4;
          new_optimizations = true;
          ignore_opacity = true;
          noise = 0.1;

          blurls = [
            "waybar"
            "rofi"
            "notifications"
          ];
        };
      };

      animations.enabled = true;

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 4;
        workspace_swipe_cancel_ratio = 0.25;
      };

      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      layerrule = [
        "ignorezero, notifications"
        "ignorezero, rofi"
      ];

      windowrule = [
        "float, ^(yad)$"
        "float, ^(MEGAsync)$"
        "noborder, ^(MEGAsync)$"
        "noblur, ^(MEGAsync)$"
        "noshadow, ^(MEGAsync)$"
        "float, ^(KDE Connect Daemon)$"
        "noblur, ^(KDE Connect Daemon)$"
        "opacity 0.85, ^(thunar)$"
        "float, ^(Rofi)$"
        "opacity 1, title:KDE Connect Daemon"
        "noblur, title:KDE Connect Daemon"
        "noborder, title:KDE Connect Daemon"
        "noshadow, title:KDE Connect Daemon"
        "noanim, title:KDE Connect Daemon"
        "nofocus, title:KDE Connect Daemon"
        "suppressevent fullscreen, title:KDE Connect Daemon"
        "float, title:KDE Connect Daemon"
        "pin, title:KDE Connect Daemon"
        "minsize 1920 1080, title:KDE Connect Daemon"
        "move 0 0, title:KDE Connect Daemon"
      ];

      windowrulev2 = [
        "opacity 0.95, initialTitle: ^(Visual Studio Code)$"
        "opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$"
        "noanim,class:^(xwaylandvideobridge)$"
        "nofocus,class:^(xwaylandvideobridge)$"
        "noinitialfocus,class:^(xwaylandvideobridge)$"
      ];
    };
  };
}
