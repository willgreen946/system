gentoo:
	NULL

debian:
	apt-get install vim ranger nitrogen xorg pulseaudio ncpamixer git make
	apt-get install mpv youtube-dl htop connman connman-ncurses connman-gtk
	apt-get install nasm gcc setxkbmap lynx

arch:
	pacman -S vim ranger nitrogen xorg pulseaudio ncpamixer git make
	pacman -S mpv youtube-dl htop connman connman-ncurses connman-gtk
	pacman -S base-devel
	pacman -S nasm gcc setxkbmap lynx

void:
	xbps-install vim ranger nitrogen xorg-minimal pulseaudio ncpamixer git make
	xbps-install mpv youtube-dl htop connman connman-ncurses connman-gtk 
	xbps-install libX11-devel libXinerama-devel freetype-devel terminus-font
	xbps-install nasm gcc setxkbmap lynx
	ln -s /etc/connmand /var/service/
	ln -s /etc/dbus /var/service/

system:
	mv fonts/ .fonts
	mv .fonts /home/will/
	mv config/ .config
	mv .config/ /home/will/
	mv .xinitrc /home/will/ && mv .bashrc /home/will/
	cd suckless
	cd st/ && make clean install
	cd ..
	cd dwm/ && make clean install
	cd ..
	cd slstatus/ && make clean install
	cd ..
	cd dmenu/ && make clean install
	cd /home/will/
	mkdir Desktop Documents Downloads Git Programs Pictures Test
	
