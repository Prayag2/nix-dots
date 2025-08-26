{ pkgs, ... }: {

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
    plugins = [
        pkgs.hyprlandPlugins.hypr-dynamic-cursors
        # pkgs.hyprlandPlugins.hyprspace
        pkgs.hyprlandPlugins.hyprexpo
    ];
    settings = {
      "plugin:dynamic-cursors" = {
        enabled = true;
        mode = "stretch";
        shake = {
            nearest = false;
            limit = 4.0;
        };
      };
      plugin = {
        hyprexpo = {
            enable_gesture = true;
            gesture_fingers = 4;
            gesture_distance = 300;
            gesture_positive = true;
        };
      };
      # "plugin:overview:overrideGaps" = false;
      # "plugin:overview:autoDrag" = false;
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
        gaps_in = -1;
        gaps_out = "0 0 0 0";
        border_size = 2;
        layout = "dwindle";
        "col.active_border" = "$color8";
        "col.inactive_border" = "$color8";
      };

      decoration = {
        shadow = {
            enabled = false;
            range = 4;
            render_power = 1;
            color = "rgba(1a1a1a80)";
        };

        active_opacity = 1;
        inactive_opacity = 1;
        fullscreen_opacity = 1;
        dim_inactive = true;
        dim_strength = 0.1;

        blur = {
          enabled = true;
          size = 4;
          passes = 4;
          new_optimizations = true;
          ignore_opacity = true;
          noise = 0.1;
          popups = true;

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
        "ignorezero,notifications"
        "ignorezero,rofi"
        "noanim,selection"
        "blur,rofi"
        "blur,waybar"
        "blur,dunst"
      ];

      windowrule = [
        "float, class:(^(yad)$)"
        "float, class:(^(MEGAsync)$)"
        "noborder, class:(^(MEGAsync)$)"
        "noblur, class:(^(MEGAsync)$)"
        "noshadow, class:(^(MEGAsync)$)"
        "float, class:(^(KDE Connect Daemon)$)"
        "noblur, class:(^(KDE Connect Daemon)$)"
        "opacity 0.85, class:(^(thunar)$)"
        "float, class:(^(Rofi)$)"
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

      workspace = [
        "w[t1], gapsout:0, gapsin:0"
        "w[tg1], gapsout:0, gapsin:0"
        "f[1], gapsout:0, gapsin:0"
      ];

      windowrulev2 = [
        "opacity 0.95, initialTitle: ^(Visual Studio Code)$"
        "opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$"
        "noanim,class:^(xwaylandvideobridge)$"
        "nofocus,class:^(xwaylandvideobridge)$"
        "noinitialfocus,class:^(xwaylandvideobridge)$"
        "noinitialfocus,class:^(PenTablet)$"
        "bordersize 0, floating:0, onworkspace:w[t1]"
        "rounding 0, floating:0, onworkspace:w[t1]"
        "bordersize 0, floating:0, onworkspace:w[tg1]"
        "rounding 0, floating:0, onworkspace:w[tg1]"
        "bordersize 0, floating:0, onworkspace:f[1]"
        "rounding 0, floating:0, onworkspace:f[1]"
      ];

      bezier = [
        "custom-bzr, 0.16, 1, 0.3, 1"
      ];
      animation = [
        "workspaces, 1, 6, custom-bzr, slide"
        "windows, 1, 5, custom-bzr, popin 80%"
        "layers, 1, 5, custom-bzr, popin 80%"
        "fade, 1, 7, custom-bzr"
        "border, 1, 7, default"
      ];
    };
  };
}
