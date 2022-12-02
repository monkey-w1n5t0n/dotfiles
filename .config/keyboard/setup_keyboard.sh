#!/usr/bin/sh

# Languages
setxkbmap 'us(dvorak), gr(simple)' \
  -option grp:alt_shift_toggle

setxkbmap -device 21 -layout 'us,gr' \
  -option grp:alt_shift_toggle

# Misc keyboard stuff

#           delay  speed
xset r rate 220    35
