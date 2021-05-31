# Development
xbps-install -Sy gcc base-devel pkgconfig pkgconf libX11-devel libXft-devel libXinermama-devel ncurses-devel

# X11/Wayland window managers
xbps-install -Sy xorg-minimal i3

# X11 Programs
xbps-install -Sy setxkbmap xrdb xdotool nitrogen rxvt-unicode xsel scrot feh connman-gtk

# Web browsers
xbps-install -Sy firefox icecat vimb elinks lynx tor torbrowser-launcher

# Internet
xbps-install -Sy connman connman-ncurses onionshare torsocks

# System tools
xbps-install -Sy sudo tmux vifm vim git make zsh bash tty-clock acpi

# Misc
xbps-install -Sy neofetch dialog 
