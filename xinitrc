[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

xset r rate 400 44
setxkbmap hr
setxkbmap -option ctrl:nocaps

exec i3

