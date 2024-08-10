{config, pkgs, ...}: 
let
  custom-scr-power = "${(pkgs.callPackage ../../scripts/custom-scr-power.nix {inherit pkgs;})}/bin/custom-scr-power";
  custom-scr-media = "${(pkgs.callPackage ../../scripts/custom-scr-media.nix {inherit pkgs;})}/bin/custom-scr-media";
in
{
  home.file.".config/waybar/style.css" = {
    source = ./style.css;
    force = true;
  };
  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 36;
      spacing = 0;
      reload_style_on_change = true;

      # Module Order
      modules-left = [
        "custom/power"
        "temperature#cpu"
        "cpu"
        "memory"
        "clock"
        "custom/mpris"
      ];
      modules-center = [
        "hyprland/workspaces"
      ];
      modules-right = [
        "gamemode"
        "idle_inhibitor"
        "backlight"
        "custom/ping"
        "pulseaudio#speaker"
        "pulseaudio#mic"
        "battery"
        "tray"
        "custom/dunst"
      ];

      # Left Modules
      "custom/power" = {
        format = "󰐥";
        on-click = "${custom-scr-power}";
      };

      "hyprland/workspaces" = {
        format = "{name}";
        on-click = "activate";
        sort-by-number = true;
        active-only = false;
      };

      "custom/mpris" = {
        exec = "${custom-scr-media}";
        format = "{}";
        on-click = "playerctl play-pause";
        on-click-middle = "alacritty -e lyrics";
        max-length = 20;
      };

      # Right Modules
      "gamemode" = {
        format = "{glyph} {count}";
        glyph = "󰮂";
        hide-not-running = true;
        use-icon = true;
        icon-name = "input-gaming-symbolic";
        icon-spacing = 4;
        icon-size = 20;
        tooltip = true;
        tooltip-format = "Games running = {count}";
      };

      "idle_inhibitor" = {
        format = "{icon}";
        format-icons = {
          activated = "󰒳";
          deactivated = "󰒲";
        };
      };

      "backlight" = {
        device = "intel_backlight";
        format = "{icon}  {percent}%";
        scroll-step = 5;
        format-icons = ["󰃞" "󰃟" "󰃝" "󰃠"];
      };

      "custom/ping" = {
        exec = "printf '%03d' $(ping -c 1 1.1.1.1 -w 1 2>/dev/null | tail -1 | awk '{print $4}' | cut -d '/' -f 2 | cut -d '.' -f 1)";
        interval = 2;
        format = "󰀂  {}ms";
      };

      "pulseaudio#speaker" = {
        format = "{icon}  {volume}%";
        format-muted = "󰝟  {volume}%";
        format-bluetooth = "{icon}  {volume}%";
        max-volume = 150;
        format-bluetooth-muted = "󰝟  {volume}%";
        format-icons = {
          headphone = "";
          hands-free = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = ["" "" ""];
        };
        scroll-step = 5.0;
        on-click = "pamixer -t";
        on-click-right = "pavucontrol";
      };

      "pulseaudio#mic" = {
        format = "{format_source}";
        format-source = "  {volume}%";
        format-source-muted = "  {volume}%";
        on-click = "pamixer --default-source -t";
        on-click-middle = "pactl load-module module-loopback";
        on-click-right = "pactl unload-module module-loopback";
        on-scroll-up = "pamixer --default-source -i 5";
        on-scroll-down = "pamixer --default-source -d 5";
      };

      "cpu" = {
        format = "󰓅  {usage:02}%";
        interval = 2;
      };

      "memory" = {
        format = "󰍛  {used:02} GB";
        interval = 2;
        tooltip-format = "Used = {percentage}%\nTotal = {total} GB";
      };

      "temperature#cpu" = {
        # thermal-zone = 0;
        # hwmon-path = "/sys/devices/virtual/thermal/thermal_zone0/hwmon1/temp1_input";
        critical-threshold = 80;
        format-critical = "  {temperatureC}°C";
        format = "  {temperatureC}°C";
      };

      "temperature#gpu" = {
          #thermal-zone = 0;
          #hwmon-path = "/sys/devices/virtual/thermal/thermal_zone0/hwmon1/temp1_input";
          critical-threshold = 80;
          format-critical = "  {temperatureC}°C";
          format = "  {temperatureC}°C";
      };
      "clock" = {
          timezone = "Asia/Kolkata";
          tooltip-format = "<tt>{calendar}</tt>";
          format = "  {:%I:%M %p}";
          format-alt = "  {:%d %h %Y ∙ %A}";
      };

     "battery" = {
        interval = 30;
        states = {
          warning = 30;
          critical = 15;
        };
        format = "{icon}  {capacity}%";
        format-plugged = "󱐋  {capacity}%";
        format-charging = "󱐋  {capacity}%";
        format-icons = ["󰂎" "󰁻" "󰁾" "󰂁" "󰁹"];
        max-length = 25;
        tooltip = true;
        tooltip-format = "󱧥 {timeTo}";
      };

      "custom/dunst" = {
        exec = ''[[ $(dunstctl is-paused) = false ]] && printf '{"text": "󰂚", "class": "on"}' || printf '{"text": "󰂛", "class": "off"}' '';
        format = "{} ";
        return-type = "json";
        on-click = "dunstctl set-paused toggle";
        interval = 1;
      };

      "tray" = {
          spacing = 10;
      };
    };
  };
}
