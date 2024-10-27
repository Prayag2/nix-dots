{pkgs}:
  pkgs.writeShellScriptBin "custom-scr-list_fonts" ''
    # lists all installed fonts and copies the selected one's name
    rofi_theme="$HOME/.config/rofi/theme.rasi"
    fc-list -f "%{family}\n" | sed 's/,/\n/g' | sort | uniq | rofi -dmenu -p "" -theme-str "entry {placeholder:\"Select a font..\";}" -i -theme $rofi_theme | wl-copy
  ''
