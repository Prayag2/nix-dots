{ config, pkgs, ... }:
let
  rofi = "${pkgs.rofi}/bin/rofi -theme $HOME/.config/rofi/theme.rasi";
in
{
  home.packages = [ pkgs.dunst ];
  home.file.".config/wal/templates/dunstrc".text = ''
    [global]
        follow = none
        width = 350
        height = 300
        origin = top-right
        offset = 10x10
        notification_limit = 5
        indicate_hidden = yes
        transparency = 90
        separator_height = 2
        padding = 8
        horizontal_padding = 8
        text_icon_padding = 0
        frame_width = 2
        frame_color = "{color8}"
        gap_size = 0
        separator_color = frame
        sort = yes
        font = "${config.myFont.font.nerd_name} ${builtins.toString (10*config.myFont.font.size_multiplier)}"
        markup = full
        format = "<b>%s</b>\n%b"
        alignment = left
        vertical_alignment = center
        show_age_threshold = 60
        ellipsize = middle
        ignore_newline = no
        stack_duplicates = true
        hide_duplicate_count = false
        show_indicators = yes
        enable_recursive_icon_lookup = true
        icon_theme = Papirus-Dark
        icon_position = left
        min_icon_size = 32
        max_icon_size = 128
        sticky_history = yes
        history_length = 20
        dmenu = ${rofi} -dmenu -p 󰂚 rofi -hover-select -i
        browser = xdg-open
        always_run_script = true
        title = Dunst
        class = Dunst
        corner_radius = 0
        ignore_dbusclose = false
        force_xwayland = false
        force_xinerama = false
        mouse_left_click = close_current
        mouse_middle_click = do_action, close_current
        mouse_right_click = close_all
    [experimental]
        per_monitor_dpi = false
    [urgency_low]
        background = "{color0}"
        foreground = "{color15}"
        timeout = 5
    [urgency_normal]
        background = "{color0}"
        foreground = "{color15}"
        timeout = 5
    [urgency_critical]
        background = "{color0}"
        foreground = "{color15}"
        frame_color = "{color3}"
        timeout = 0
    [play_sound]
        msg_urgency = normal
        script = ~/.local/bin/noti.sh
  '';
}
