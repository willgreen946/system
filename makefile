# Run make DISTRO to install the software I use 

void:
	# Development
	xbps-install gcc libX11-devel libXinerama-devel libXft-devel pkgconf pkg-config base-devel
	# Window managers and ui in general
	xbps-install i3 tmux xorg-minimal zsh 
	# Audio
	xbps-install pulseaudio ncpamixer
	# Internet
	xbps-install icecat lynx vimb connman connman-ncurses qutebrowser
	# System tools
	xbps-install vifm vim acpi htop
	# Misc
	xbps-install cointop

freebsd:
	# Development
	pkg install gcc pkgconfig
	# Window managers and ui in general
	pkg install i3 tmux xorg zsh
	# Audio
	pkg install alsa-utils
	# Internet
	pkg install icecat vimb lynx qutebrowser
	# System tools
	pkg install vifm vim acpi htop
	# Misc
	pkg install cointop 
