# Home directory
$HOME = /home/will/


# .config installation
mv config .config
mv .config $HOME

# .fonts installation
mv fonts .fonts
mv .fonts $HOME

# vim configuration installation
mv vim .vim
mv .vim $HOME
mv .vimrc $HOME

# zsh and bash configuration
mv .zshrc $HOME
mv .bashrc $HOME

# X11 configuration installation
mv .Xresources $HOME
mv .xinitrc $HOME
mv XTerm $HOME

# i3status configuration installation
mv .i3status.conf $HOME

# tmux configuration installation
mv .tmux.conf $HOME

# Making my direcorys for home
mkdir -p $HOME Programs
mkdir -p $HOME Music
mkdir -p $HOME Videos
mkdir -p $HOME Documents
mkdir -p $HOME Downloads
mkdir -p $HOME Git
mkdir -p $HOME Iso
