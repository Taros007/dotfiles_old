#!/usr/bin/env bash

#icon="$HOME/.config/lockscreen/lockicon.png"
scriptpath=$(readlink -f -- "$0")
scriptpath=${scriptpath%/*}
tmpbg='/tmp/screen.png'

(( $# )) && { icon=$1; }

#sleep 10 && scrot "$tmpbg"
import -window root "$tmpbg"

color=$(convert "$tmpbg" -gravity center -crop 100x100+0+0 +repage -colorspace hsb \
    -resize 1x1 txt:- | awk -F '[%$]' 'NR==2{gsub(",",""); printf "%.0f\n", $(NF-1)}');

value="60" #brightness value to compare to

if [[ $color -gt $value ]]; then #white background image and black text
    bw="black"
    icon="$scriptpath/icons/lockdark.png"
    param=("--textcolor=00000000" "--insidecolor=0000001c" "--ringcolor=0000003e" \
        "--linecolor=00000000" "--keyhlcolor=ffffff80" "--ringvercolor=ffffff00" \
        "--separatorcolor=22222260" "--insidevercolor=ffffff1c" \
        "--ringwrongcolor=ffffff55" "--insidewrongcolor=ffffff1c")
else #black
    bw="white"
    icon="$scriptpath/icons/lock.png"
    param=("--textcolor=ffffff00" "--insidecolor=ffffff1c" "--ringcolor=ffffff3e" \
        "--linecolor=ffffff00" "--keyhlcolor=00000080" "--ringvercolor=00000000" \
        "--separatorcolor=22222260" "--insidevercolor=0000001c" \
        "--ringwrongcolor=00000055" "--insidewrongcolor=0000001c")
fi


convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
#convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"


convert "$tmpbg" -font "Roboto-Medium" -pointsize 26 -fill "$bw" -gravity center -annotate +0+290 'Please enter your password to unlock' "$icon" -gravity center -composite -matte "$tmpbg"

#convert "$tmpbg" -font "Roboto-Medium" -pointsize 26 -fill white -gravity center -annotate +0+290 'Please enter your password to unlock' "$icon" -gravity center -composite -matte "$tmpbg"
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
i3lock -u -e -n -i /tmp/screen.png >/dev/null 2>&1
