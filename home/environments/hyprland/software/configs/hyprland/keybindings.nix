{ pkgs, ... }: 
let
  custom-scr-reload = "${(pkgs.callPackage ../../../scripts/custom-scr-reload.nix {inherit pkgs;})}/bin/custom-scr-reload";
  custom-scr-ss = "${(pkgs.callPackage ../../../scripts/custom-scr-ss.nix {inherit pkgs;})}/bin/custom-scr-ss";
in
{
  wayland.windowManager.hyprland.settings = {
    "$main_mod" = "SUPER";
    "$rofi_theme" = "$HOME/.config/rofi/theme.rasi";
    #"$focus_rofi" = "& sleep 0.2; hyprctl dispatch focuswindow \"^(Rofi)\"";
    "$focus_rofi" = "";

    bind = [
      # VMWare Horizon Client
      "$main_mod,R,pass,^(Vmware-view)$"
      "$main_mod,V,pass,^(Vmware-view)$"
      "$main_mod,E,pass,^(Vmware-view)$"
      "$main_mod SHIFT,S,pass,^(Vmware-view)$"

      # Scripts
      "$main_mod CONTROL, F12, exec, ${custom-scr-reload}"
      "ALT SHIFT, S, exec, ${custom-scr-ss} taoc"
      "ALT, PRINT, exec, ${custom-scr-ss} toc"
      "CONTROL, PRINT, exec, ${custom-scr-ss}"
      "$main_mod SHIFT, S, exec, ${custom-scr-ss} aoc"
      "$main_mod, PRINT, exec, ${custom-scr-ss} oc"

      # Actions
      "$main_mod SHIFT, P, exec, hyprpicker | wl-copy"
      "$main_mod, BackSpace, exec, hyprlock &"
      "$main_mod, Return, exec, alacritty"
      "$main_mod, W, killactive"
      "$main_mod, E, exec, thunar"

      # Rofi
      "$main_mod, R, exec, rofi -show drun -theme $rofi_theme $focus_rofi"
      "$main_mod, Equal, exec, rofi -modi calc -show calc -theme $rofi_theme $focus_rofi"
      "$main_mod, Period, exec, rofimoji --selector-args \"-theme '$HOME/.config/rofi/theme.rasi'\" $focus_rofi"
      "$main_mod, N, exec, dunstctl action $focus_rofi"
      "$main_mod, V, exec, cliphist list | rofi -dmenu -p C -theme $rofi_theme | cliphist decode | wl-copy $focus_rofi"
      "$main_mod ALT, V, exec, wtype \"$(wl-paste)\""

      # Audio
      "$main_mod, P, exec, playerctl play-pause"
      "$main_mod, M, exec, swayosd-client --input-volume mute-toggle"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPrev, exec, playerctl prev"
      ", XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
      ", XF86AudioMicMute, exec, swayosd-client --input-volume mute-toggle"

      # Tiling
      "$main_mod, T, togglefloating"
      "$main_mod, F, fullscreen"
      "$main_mod, H, movefocus, l"
      "$main_mod, L, movefocus, r"
      "$main_mod, K, movefocus, u"
      "$main_mod, J, movefocus, d"

      # Workspaces
      "$main_mod, bracketright, workspace, +1"
      "$main_mod, bracketleft, workspace, -1"
      "$main_mod CONTROL, bracketright, movetoworkspace, +1"
      "$main_mod CONTROL, bracketleft, movetoworkspace, -1"

      # Resizing
      "$main_mod ALT, L, resizeactive, 20 0"
      "$main_mod ALT, H, resizeactive, -20 0"
      "$main_mod ALT, K, resizeactive, 0 -20"
      "$main_mod ALT, J, resizeactive, 0 20"
    ];
    binde = [
      ", XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise"
      ", XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"
      "SHIFT, XF86AudioRaiseVolume, exec, swayosd-client --input-volume raise"
      "SHIFT, XF86AudioLowerVolume, exec, swayosd-client --input-volume lower"
      ", XF86MonBrightnessDown, exec, swayosd-client --brightness -10"
      ", XF86MonBrightnessUp, exec, swayosd-client --brightness +10"
    ];
    bindm = [
      "$main_mod, mouse:272, movewindow"    
      "$main_mod, mouse:273, resizewindow"
    ];
  };
}
