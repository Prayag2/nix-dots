#!/bin/bash

. ~/.cache/wal/colors.sh
echo " No Media"
playerctl metadata -f '{{status}} {{title}}' -F 2>/dev/null | while read event; do
    #if [[ $(playerctl metadata artist) = '' ]]; then
        #playerctl metadata -f '{{status}} {{title}}' | sed 's/Paused//; s/Playing//; s/Stopped//'
    #else
    out=$(playerctl metadata -f '{{status}} {{title}}' 2>/dev/null)
    if [[ -z $out ]]; then
	    [[ $XDG_SESSION_TYPE = "wayland" ]] || echo "%{T3}%{T-} No Media" && echo "  No Media"
    else
      if [[ $XDG_SESSION_TYPE != "wayland" ]]; then
        echo $out | sed "s/Paused/%{T3}%{T-}/;  s/Playing/%{T3}%{T-}/;  s/Stopped/%{T3}%{T-}/;"
      else
        echo $out | sed "s/Paused/ /; s/Playing/ /;  s/Stopped/ /;"
      fi
    fi
    #fi
done
