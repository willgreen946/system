# Development
xbps-install -Sy gcc base-devel pkgconfig pkgconf libX11-devel libXft-devel libXinermama-devel ncurses-devel

# X11/Wayland window managers
xbps-install -Sy xorg-minimal i3 sway elogind

# X11 Programs
xbps-install -Sy setxkbmap xrdb xdotool nitrogen rxvt-unicode xsel scrot feh connman-gtk xrandr arandr 

# Fonts
xbps-install -Sy terminus-font tff-ubuntu-font-family

# Virtual machine
xbps-install -Sy qemu kvm virt-manager 

# Web browsers
xbps-install -Sy firefox icecat elinks lynx tor torbrowser-launcher

# Internet
xbps-install -Sy mutt connman connman-ncurses onionshare torsocks dbus wicd

# Audio
xbps-install -Sy pulseaudio ncpamixer

# System tools
xbps-install -Sy sudo tmux git wget make zsh bash tty-clock acpi

# Vi/Vim like programs
xbps-install -Sy vim vifm vimpc vimiv vimb hexer cointop 

# Misc
xbps-install -Sy neofetch dialog 

# Enable things at boot
ln -s /etc/sv/dbus /var/service
ln -s /etc/sv/connmand /var/service

# Vi/Vim like htop
git clone https://github.com/KoffeinFlummi/htop-vim.git
./autogen.sh && ./configure && make 
