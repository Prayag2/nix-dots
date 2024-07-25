{pkgs}:
  pkgs.writeShellScriptBin "custom-scr-wall" ''
    echo ":: setting up variables ::"
    wall_location="$1"
    wall_new_location="$HOME/.local/share/wallpapers/wall.png"
    theme_directory="$HOME/.config/themes/dark"
    rofi_theme="$HOME/.config/rofi/theme.rasi"

    echo ":: getting required information ::"
    use_pywal=$(printf "Auto generate colours\nSelect a colour scheme"\
                  | rofi -dmenu -p "" -theme-str 'entry{placeholder: "Select an option";}' -theme $rofi_theme)
    if [[ $use_pywal = "Select a colour scheme" ]]; then
      theme_name=$(ls "$theme_directory"/*.json\
                    | xargs -n1 basename\
                    | rofi -dmenu -p "󰉦" -theme-str 'entry{placeholder: "Select a theme";}' -i -theme $rofi_theme)
      theme_path="$theme_directory/$theme_name"
    else
      theme_path=""
    fi

    echo ":: setting wallpaper ::"
    rm $wall_new_location
    magick "$wall_location" $wall_new_location >/dev/null 2>&1
    swww img $wall_new_location -t any --transition-fps 120 >/dev/null 2>&1
    wpg -a $wall_new_location >/dev/null 2>&1
    [[ $theme_path ]] && wpg -i $wall_new_location $theme_path >/dev/null 2>&1 || wpg -A $wall_new_location >/dev/null 2>&1
    wpg -s $wall_new_location >/dev/null 2>&1
  ''
