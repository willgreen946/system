# Home directory
$HOM = /home/will/


# .config installation
mv config .config
mv .config $HOM

# .fonts installation
mv fonts .fonts
mv .fonts $HOM

# vim configuration installation
mv vim .vim
mv .vim $HOM
mv .vimrc $HOM

# zsh and bash configuration
mv .zshrc $HOM
mv .bashrc $HOM

# X11 configuration installation
mv .Xresources $HOM
mv .xinitrc $HOM
mv XTerm $HOM

# i3status configuration installation
mv .i3status.conf $HOM

# tmux configuration installation
mv .tmux.conf $HOM

# Making my direcorys for home
mkdir -p $HOM Programs
mkdir -p $HOM Music
mkdir -p $HOM Videos
mkdir -p $HOM Documents
mkdir -p $HOM Downloads
mkdir -p $HOM Git
mkdir -p $HOM Iso
