#!/usr/bin/env bash

icon="$HOME/.config/lockscreen/lockicon.png"
tmpbg='/tmp/screen.png'

(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
#convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
convert "$tmpbg" -font "Roboto" -pointsize 26 -fill white -gravity center -annotate +0+290 'Please enter your password to unlock' "$icon" -gravity center -composite -matte "$tmpbg"
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
i3lock -u -i /tmp/screen.png
