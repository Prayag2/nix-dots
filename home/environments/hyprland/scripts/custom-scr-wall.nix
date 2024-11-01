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
    rm -rf $HOME/.config/wpg/schemes # remove cached schemes
    rm -rf $HOME/.config/wpg/wallpapers # remove cached schemes
    rm $wall_new_location
    magick convert "$wall_location" $wall_new_location >/dev/null
    swww img $wall_new_location -t any --transition-fps 120 >/dev/null
    wpg -a $wall_new_location >/dev/null
    ([[ $theme_path ]] && wpg -i $wall_new_location $theme_path >/dev/null) || wpg -A $wall_new_location >/dev/null
    wpg -s $wall_new_location >/dev/null
  ''
