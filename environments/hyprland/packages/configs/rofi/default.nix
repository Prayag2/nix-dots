{ config, pkgs, ... }: {
  home.file.".config/wal/templates/theme.rasi" = {
    text = ''
        configuration {{
            show-icons: true;
            modi: "drun,run";
            show: "drun";
            icon-theme: "Papirus-Dark";
            drun {{
            fallback-icon: "package-x-generic";
            }}
        }}

        configuration {{
            display-ssh:    "";
            display-run:    "";
            display-drun:   "󰘳";
            display-window: "";
            display-combi:  "";
            display-emoji: "󰞅";
            display-calc: "󰃬";
            display-clipboard: "󰅎";
            fixed-num-lines: false;
            show-icons:     true;
            transparency: "real";
        }}

        /*****----- Global Properties -----*****/
        * {{
            font:                        "${config.myFont.font.nerd_name} ${builtins.toString (11.2*config.myFont.font.size_multiplier)}";
            background:                  {background}B3;
            background-alt:              {background};
            foreground:                  {foreground};
            selected:                    {color2};
            active:                      {color1};
            urgent:                      {color5};
        }}

        /*****----- Main Window -----*****/
        window {{
            /* properties for window widget */
            transparency:                "real";
            location:                    center;
            anchor:                      center;
            fullscreen:                  false;
            width:        600px;
            x-offset:                    0px;
            y-offset:                    0px;

            /* properties for all widgets */
            enabled:                     true;
            border-radius:               0px; /* 16px */
            border-color:                {color8}; 
            border:                      2.5px;
            cursor:                      "default";
            background-color:            @background;
            padding:                     4px;
        }}

        /*****----- Main Box -----*****/
        mainbox {{
            enabled:                     true;
            spacing:                     0px;
            background-color:            transparent;
            orientation:                 vertical;
            children:                    [ "inputbar", "listbox", "mode-switcher" ];
        }}

        imagebox {{
            padding:                     16px;
            border-radius: 0px; /* 11px */
            background-color:            transparent;
            background-image:            url("~/.local/share/wallpapers/wall.png", width);
            orientation:                 vertical;
            children:                    [ "inputbar" ];
        }}

        listbox {{
            spacing:                     4px;
            padding:                     4px 0px;
            background-color:            transparent;
            orientation:                 vertical;
            children:                    [ "message", "listview" ];
        }}

        dummy {{
            background-color:            transparent;
        }}

        /*****----- Inputbar -----*****/
        inputbar {{
            enabled:                     true;
            spacing:                     8px;
            padding:                     40px 40px 40px;
            border-radius:               0px; /* 8px */
            border:  2px;
            border-color: {color8};
            background-color:            transparent;
            background-image:            url("~/.local/share/wallpapers/wall.png", width);
            text-color:                  @foreground;
            children:                    [ "textbox-prompt-colon", "entry" ];
        }}
        textbox-prompt-colon {{
            enabled:                     true;
            expand:                      false;
            str:                         "";
            padding: 12px 16px;
            border: 2px;
            border-color: {color8};
            background-color:            {color0};
            text-color:                  inherit;
        }}
        entry {{
            enabled:                     true;
            padding: 12px 16px;
            background-color:            {color0};
            border: 2px;
            border-color: {color8};
            text-color:                  inherit;
            cursor:                      text;
            placeholder:                 "Search";
            placeholder-color:           inherit;
        }}

        /*****----- Mode Switcher -----*****/
        mode-switcher{{
            enabled:                     true;
            spacing:                     4px;
            background-color:            transparent;
            text-color:                  @foreground;
        }}
        button {{
            padding:                     12px;
            border-radius:               0px; /* 8px */
            background-color:            @background-alt;
            text-color:                  inherit;
            cursor:                      pointer;
        }}
        button selected {{
            background-color:            @selected;
            text-color:                  @background;
        }}

        /*****----- Listview -----*****/
        listview {{
            enabled:                     true;
            columns:                     1;
            lines:                       8;
            cycle:                       true;
            dynamic:                     true;
            scrollbar:                   false;
            layout:                      vertical;
            reverse:                     false;
            fixed-height:                true;
            fixed-columns:               true;
            
            spacing:                     0px;
            background-color:            transparent;
            text-color:                  @foreground;
            cursor:                      "default";
            border: 2px;
            border-color: {color8};
            border: none;
        }}

        /*****----- Elements -----*****/
        element {{
            enabled:                     true;
            spacing:                     12px;
            padding:                     9.5px;
            border-radius:               0px; /* 8px */
            background-color:            transparent;
            text-color:                  @foreground;
            cursor:                      pointer;
        }}
        element normal.normal {{
            background-color:            inherit;
            text-color:                  inherit;
        }}
        element alternate.normal {{
            background-color:            inherit;
            text-color:                  inherit;
        }}

        element normal.urgent {{
            background-color:            @urgent;
            text-color:                  @foreground;
        }}
        element normal.active {{
            background-color:            @active;
            text-color:                  @foreground;
        }}
        element selected.normal {{
            background-color:            @selected;
            text-color:                  @background;
        }}
        element selected.urgent {{
            background-color:            @urgent;
            text-color:                  @background;
        }}
        element selected.active {{
            background-color:            @urgent;
            text-color:                  @background;
        }}
        element-icon {{
            background-color:            transparent;
            text-color:                  inherit;
            size:                        25.6px;
            cursor:                      inherit;
        }}
        element-text {{
            background-color:            transparent;
            text-color:                  inherit;
            cursor:                      inherit;
            vertical-align:              0.5;
            horizontal-align:            0.0;
        }}

        /*****----- Message -----*****/
        message {{
            background-color:            transparent;
            border: none;
        }}
        textbox {{
            padding:                     12px;
            border-radius:               0px; /* 8px */
            background-color:            @background-alt;
            text-color:                  @foreground;
            vertical-align:              0.5;
            horizontal-align:            0.0;
        }}
        error-message {{
            padding:                     12px;
            border-radius:               0px; /* 16px */
            background-color:            @background;
            text-color:                  @foreground;
        }}
    '';
    force = true;
  };
  home.file.".config/rofimoji.rc".text = ''
    action = copy
    files = [emojis, math, nerd_font]
    selector = rofi
    max-recent = 0
  '';
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = with pkgs; [
      rofi-calc
    ];
  };
  home.packages = with pkgs; [ 
    rofimoji
  ];
}
