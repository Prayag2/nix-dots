{ config, pkgs, ... }: 
let
  custom-scr-power = "${(pkgs.callPackage ../../../scripts/custom-scr-power.nix {inherit pkgs;})}/bin/custom-scr-power";
  custom-scr-media = "${(pkgs.callPackage ../../../scripts/custom-scr-media.nix {inherit pkgs;})}/bin/custom-scr-media";
  custom-scr-switch_sink = "${(pkgs.callPackage ../../../scripts/custom-scr-switch_sink.nix {inherit pkgs;})}/bin/custom-scr-switch_sink";
in
{
  home.file.".config/waybar/style.css" = {
    text = ''
        @import url("../../.cache/wal/colors-waybar.css");

        * {
            border: none;
            font-family: "Symbols Nerd Font Mono", "${config.myFont.font.name}";
            font-weight: bold;
            font-size: ${(builtins.toString (12*config.myFont.font.size_multiplier))}px;
            min-height: 0;
        }

        window#waybar {
            background: alpha(@background, 0.8);
            color: @foreground;
            border-bottom: 2.5px solid @color8;
            box-shadow: 0px 10px 12px 0px rgba(0,0,0,0.5);
        }

        #workspaces {
            outline: none;
            /* background: alpha(@color8, 1); */
            /* margin: 6px 6px 6px 0; */
            /* border-radius: 24px; */
        }

        #workspaces button {
            outline: none;
            padding: 0 8px;
            color: @color6;
            border-bottom: none;
            border-top: 2.5px solid transparent;
            /* background: alpha(#fff, 0.1); */
            /* background: @color8; */
            border-radius: 0;
        }
        #workspaces button:last-child {
            /*border-hypridle radius: 0 24px 24px 0;*/
        }
        #workspaces button:first-child {
            /* border-radius: 24px 0 0 24px; */
        }
        #workspaces button:only-child {
            /* border-radius: 24px; */
        }
        #workspaces button.empty {
            /* background: alpha(#fff, 0); */
        }
        #workspaces button.active {
            border-top: 2.5px solid @color6;
            background: @color8;
            /* background: alpha(#fff, 0.2); */
        }

        tooltip {
            background: alpha(@color8, 1);
        }
        tooltip label {
            color: @foreground;
        }

        #idle_inhibitor,
        #clock,
        #cpu,
        #memory,
        #pulseaudio,
        #tray,
        #temperature,
        #keyboard-state,
        #custom-microphone,
        #custom-ping,
        #custom-power,
        #gamemode,
        #backlight,
        #battery,
        #custom-pkgs,
        #custom-dunst,
        #custom-mpris {
            /* margin: 6px 0px 6px 0; */
            /* background: alpha(@color8, 1); */
            background: transparent;
            padding: 0 10px;
            transition: background 0.2s;
        }

        #gamemode {
          /* border-radius: 24px; */
          margin-right: 6px;
        }

        #custom-mpris {
            /* margin-left: 8px; */
            /* border-radius: 24px; */
            padding: 8px;
            color: @color6;
        }

        #backlight {
          color: @color4;
        }

        #custom-dunst {
            color: @color4;
            background-color: @color8;
            /* border-radius: 24px 0 0 24px; */
            padding: 0 16px;
        }

        #custom-dunst.off {
            /* background: alpha(@color8, 1); */
        }

        #custom-power {
            color: @color1;
            padding: 0 16px;
            /* border-radius: 24px; */
        }

        #temperature {
            color: @color2;
            /* border-radius: 24px 0 0 24px; */
            padding-left: 16px;
        }

        #temperature.critical {
            color: alpha(@color1, 0.3);
        }

        #cpu {
            color: @color3;
        }

        #memory {
            color: @color4;
        }

        #clock {
            color: @color5;
            /* border-radius: 0 24px 24px 0; */
            /* padding-right: 16px; */
        }

        #idle_inhibitor {
            color: @color5;
            /* border-radius: 24px 0 0 24px; */
            padding: 0 16px;
        }
        #idle_inhibitor.activated {
            background: alpha(@color8, 0.2);
        }

        #custom-pkgs {
            color: @color1;
        }

        #custom-ping {
            color: @color2;
        }

        #pulseaudio.speaker {
            color: @color3;
        }

        #pulseaudio.mic {
            color: @color4;
        }

        #pulseaudio.speaker.muted {
            background: alpha(@color8, 0.3);
        }
        #pulseaudio.mic.source-muted {
            background: alpha(@color8, 0.3);
        }

        #battery {
            color: @color5;
            /* margin-right: 8px; */
            /* border-radius: 0 24px 24px 0; */
            padding-right: 16px;
        }

        #tray {
            color: @color6;
            /* margin-right: 8px; */
            /* border-radius: 0 24px 24px 0; */
            padding-right: 16px;
        }
        #tray > .needs-attention {
            border-bottom: 2px solid @color1;
        }

        #custom-power {
            background-color: @color8;
            /* margin: 6px; */
        }

        #tray menu * {
            font-size: 12px;
        }

        @keyframes blink {
            to {
                background-color: #ffffff;
                color: black;
            }
        }
    '';
    force = true;
  };
  programs.waybar.enable = true;
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
        on-click-middle = "${custom-scr-switch_sink}";
        on-click-right = "pavucontrol";
      };

      "pulseaudio#mic" = {
        format = "{format_source}";
        format-source = "  {volume}%";
        format-source-muted = "  {volume}%";
        on-click = "pamixer --default-source -t";
        on-click-middle = "pactl list modules | grep -q 'Name: module-loopback' && (pactl unload-module module-loopback && notify-send -i 'microphone-sensitivity-muted-symbolic' 'Stopped Listening' -r 421) || (pactl load-module module-loopback && notify-send -i 'microphone-sensitivity-high-symbolic' 'Listening to microphone' -r 421)";
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
