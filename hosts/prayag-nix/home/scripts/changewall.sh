#!/usr/bin/env bash
#dependencies: wpgtk pywal yad libnotify pywalfox-native imagemagick swww rofi

# Dependencies
# - xwinwrap (for videos) (not in AUR)
# - wpgtk
# - python-pywal
# - sddm-sugar-candy-git
# - l5p-keyboard-rgb-bin (optional) (Lenovo Legion/Ideapad Gaming)
# - yad (from yadpass.sh)
# - libnotify
# - pywalfox

export SUDO_ASKPASS=~/.local/bin/yadpass.sh
totalSteps=4
videoWall="$HOME/.config/videoWall"
wallDirectory="$HOME/.local/share/wallpapers"
wallLocation="$wallDirectory/wall.png"
themeDirectory="$HOME/.config/themes"
rofiConfigPath="$HOME/.config/rofi/config.rasi"

notify() {
    local step="$1"
    local message="$2"
    local timeout="$3"

    echo "[$step/$totalSteps] $message"
    if [[ -z "$4" ]]; then
	ID=$(notify-send "[$step/$totalSteps] $message" -p -u low -t 99999)
	return "$ID"
    else
	notify-send "[$step/$totalSteps] $message" -r "$4" -u low -t 99999
    fi
}

update_sddm_theme() {
    wall="/usr/share/sddm/themes/sugar-candy/Backgrounds/Wall.png"
    theme_conf="/usr/share/sddm/themes/sugar-candy/theme.conf"

    # Updating colors and wallpaper in SDDM theme config
    sudo -A sed -i "s/\(BackgroundColor=[\"|']\).*\([\"|']\)/\1${color0}\2/" $theme_conf
    sudo -A sed -i "s/\(AccentColor=[\"|']\).*\([\"|']\)/\1${color3}\2/" $theme_conf
    sudo -A magick convert "$1" "$wall"
}

main() {
    extension="${1##*.}"
    firstArg=$(readlink -f "$1")
    mkdir -p "$wallDirectory"

    magick convert "$firstArg" "$wallLocation"
    wall="$wallLocation"

    ID=$(notify 0 "Applying wallpaper using WPG" 99999)
    rm -rf "$HOME/.cache/wal"
    rm -rf "$HOME/.config/wpg/wallpapers"
    rm -rf "$HOME/.config/wpg/samples"
    rm -rf "$HOME/.config/wpg/schemes"

    wpg -a "$wall" >/dev/null 2>&1
    swww img "$wall" -t any --transition-fps 120

    useLightTheme=$(printf "Dark Theme\nLight Theme"\
			 | rofi -dmenu -p "󰉦" -theme-str 'entry{placeholder: "Light or Dark?";}' -i -config "$rofiConfigPath")

    themeMode=$( ([[ $useLightTheme = "Dark Theme" ]] && echo "dark") || echo "light")

    usePresetTheme=$(printf "Use a preset theme\nGenerate colours using pywal"\
			 | rofi -dmenu -p "󰉦" -theme-str 'entry{placeholder: "Select an option?";}' -i -config "$rofiConfigPath")

    if [[ $usePresetTheme = "Use a preset theme" ]]; then	
        theme=$(ls "$themeDirectory/$themeMode"/*.json\
                | xargs -n1 basename\
                | rofi -dmenu -p "󰉦" -theme-str 'entry{placeholder: "Select a theme";}' -i -config "$rofiConfigPath")
        wpg -i "$wall" "$themeDirectory/$themeMode/$theme" >/dev/null 2>&1
    else
        if [[ $themeMode = "dark" ]]; then
            wpg -A "$wall"
        else
            wpg -A "$wall" -L
        fi
    fi

    wpg -s "$wall" >/dev/null 2>&1

    if [[ $? -ne 0 ]]; then
        notify-send "Please choose a different wallpaper."
        exit 1
    fi

    notify 1 "Reloading polybar, dunst and bspwm" 99999 "$ID"
    ~/.local/bin/reload-hyprland.sh "silent" >/dev/null 2>&1

    source "$HOME/.cache/wal/colors.sh"
    notify 2 "Changing keyboard colours" 99999 "$ID"
    $HOME/.local/bin/update_keyboard_backlight.sh >/dev/null 2>&1

    #notify 3 "Updating SDDM" 99999 "$ID"
    #update_sddm_theme "$wall" >/dev/null 2>&1

    # live reload apps
    pgrep -u $(whoami) -f "emacs" && emacsclient -a 'emacs' --eval "(load-theme 'ewal-doom-vibrant t)"
    pywalfox update
    xsettingsd -c ~/.config/xsettingsd/xsettingsd.conf >/dev/null 2>&1 &

    ~/.config/scripts/video-wall.sh >/dev/null 2>&1
    notify 4 "Done" 5 "$ID"
}

main "$1"
