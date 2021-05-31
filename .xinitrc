# Setting Keyboard Layout
exec setxkbmap gb &

# Status Bar
exec slstatus &

# Wallpaper
# nitrogen --restore &

# Install rxvt-unicode xsel and xrdb
xrdb -load ~/.Xresources &
urxvt &

# Startup Programs
#exec st -e zsh &
#exec st -e vifm &

#exec xdotool key alt+f &

# Window Managers
# Uncomment The One You Want 
exec i3
#exec dwm
