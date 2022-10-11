#!/bin/sh

# prime-offload
picom &
unclutter &
sxhkd &
dunst &
dwmblocks &
#fcitx5 -d &
polybar &
xinput set-prop 12 181 2 0 0 0 1 0 0 0 1

feh --no-fehbg --bg-center ~/pictures/wallpapers/something.png

bspwm

# relaunch dwm if the binary changes
# old_csum=""
# csum=$(sha1sum $(which dwm))
# while true
# do
#     if [ "$csum" != "$old_csum" ]
#     then
#         old_csum=$csum
#         # somehow this fixes the 6 screens bug on an mx150
#         xrandr --screen 0 --dpi 96
#         feh --no-fehbg --bg-scale ~/pictures/wallpapers/okayuflos1.png & dwm
#     else
#         exit 0
#     fi
#     csum=$(sha1sum $(which dwm))
# done

