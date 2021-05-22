# Run make DISTRO to install the software I use 

void:
	# Development
	xbps-install gcc libX11-devel libXinerama-devel libXft-devel pkgconf pkgconfig base-devel
	# Window managers and ui in general
	xbps-install tmux xorg-minimal
	# Audio
	xbps-install pulseaudio ncpamixer
	# Internet
	xbps-install icecat lynx connman connman-ncurses
	# System tools
	xbps-install vifm vim acpi
	# Misc
	xbps-install cointop

freebsd:
	# Development
	pkg install gcc pkgconfig
	# Window managers and ui in general
	pkg install tmux xorg
	# Audio
	pkg install alsa-utils
	# Internet
	pkg install icecat lynx
	# System tools
	pkg install vifm vim acpi
	# Misc
	pkg install cointop 
