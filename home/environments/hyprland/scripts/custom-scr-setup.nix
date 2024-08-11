{pkgs}:
let
  wpg-install="${pkgs.wpgtk}/bin/wpg-install.sh";
  wpg="${pkgs.wpgtk}/bin/wpg";
  swww="${pkgs.swww}/bin/swww";
  magick="${pkgs.imagemagick}/bin/magick";
in
  pkgs.writeShellScriptBin "custom-scr-setup" ''
    setup_marker="$HOME/.config/onetimesetup"

    echo ":: installing gtk theme and icons ::"
    [[ -e $setup_marker ]] || ${wpg-install} -G
    [[ -e $setup_marker ]] || ${wpg-install} -i

    echo ":: creating symlinks ::"
    declare -A paths=(
      ["$HOME/.cache/wal/gtk.css"]="$HOME/.config/gtk-4.0/gtk.css"
      ["$HOME/.cache/wal/alacritty.toml"]="$HOME/.config/alacritty/alacritty.toml"
      ["$HOME/.cache/wal/theme.rasi"]="$HOME/.config/rofi/theme.rasi"
      ["$HOME/.cache/wal/dunstrc"]="$HOME/.config/dunst/dunstrc"
      ["$HOME/.cache/wal/vs-wal-color-theme.json"]="$HOME/.vscode/extensions/vscode-wal/themes/vs-wal-color-theme.json"
    )
    for original_path in "''${!paths[@]}"; do
      new_path="''${paths[$original_path]}"
      mkdir -p "$(dirname "$new_path")"
      ln -sf "$original_path" "$new_path"
      echo ":: created symlink: $new_path -> $original_path ::"
    done

    default_wall_location="$HOME/.local/share/wallpapers/default.png"
    wall_location="$HOME/.local/share/wallpapers/wall.png"
    theme_location="$HOME/.config/themes/dark/nord.json"
    if [[ ! $(${wpg} -l) ]]; then
      echo ":: setting nord theme ::"
      ${magick} $default_wall_location $wall_location
      ${swww} img $wall_location -t any --transition-fps 120 >/dev/null 2>&1
      ${wpg} -a $wall_location >/dev/null 2>&1
      ${wpg} -i $wall_location $theme_location >/dev/null 2>&1
      ${wpg} -s $wall_location >/dev/null 2>&1
    else
      echo ":: theme already present ::"
    fi

    touch $setup_marker
  ''
