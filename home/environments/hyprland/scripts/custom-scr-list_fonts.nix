{pkgs}:
  pkgs.writeShellScriptBin "custom-scr-reload" ''
    # lists all installed fonts and copies the selected one's name
    fc-list -f "%{family}\n" | sed 's/,/\n/g' | sort | uniq | rofi -dmenu -p "" -theme-str "entry {placeholder:\"Select a font..\";}" -i | wl-copy
  ''
