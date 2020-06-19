#!/bin/sh

# Launch some programs
prime-offload &
xset r rate 200 30 &
xset m 0 0 &
xsetroot -cursor_name left_ptr &
picom &
unclutter &
feh --bg-scale ~/pictures/wallpapers/otachan.png & 
sxhkd &
dwmblocks &

# relaunch dwm if the binary changes
csum=$(sha1sum $(which dwm))
new_csum=""
while true
do
    if [ "$csum" != "$new_csum" ]
    then
        csum=$new_csum
        dwm
    else
        exit 0
    fi
    new_csum=$(sha1sum $(which dwm))
done
