{pkgs}:
  pkgs.writeShellScriptBin "custom-scr-wall" ''
    echo ":: setting up variables ::"
    arg="$1"
    wall_dir="$HOME/.local/share/wallpapers"
    wall="$wall_dir/wall.png"
    video_wall="$wall_dir/wall.mp4"
    theme_directory="$HOME/.config/themes/dark"
    rofi_theme="$HOME/.config/rofi/theme.rasi"

    if [ -f "''$arg" ]; then
        extension="''${arg##*.}"
        rm $wall
        rm $video_wall
        mkdir -p $wall_dir >/dev/null 2>&1

        echo ":: converting wallpaper ::"
        if [[ "$extension" == "mp4" || "$extension" == "mkv" ]]; then
            ffmpeg -y -i "$arg" -vframes 1 "$wall" >/dev/null 2>&1
            ffmpeg -y -i "$arg" "$video_wall" >/dev/null 2>&1
        else
            magick convert "$arg" $wall >/dev/null
        fi
    else
        echo "File does not exist or is not a regular file."
    fi

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
    swww img $wall -t any --transition-fps 120 >/dev/null
    wpg -a $wall >/dev/null
    ([[ $theme_path ]] && wpg -i $wall $theme_path >/dev/null) || wpg -A $wall >/dev/null
    wpg -s $wall >/dev/null
  ''
