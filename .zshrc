export XDG_RUNTIME_DIR="/tmp/swaywm"
mkdir -p $XDG_RUNTIME_DIR
chmod 0700 $XDG_RUNTIME_DIR

export WWW_HOME
WWW_HOME='https://searx.ir'

set TERMINAL='st'
set EDITOR='vim'
set BROWSER='elinks'

alias willsys='git clone https://github.com/willrollitt/system'
alias x='startx'
alias ww='sway'
alias wifi='connman-ncurses'
alias bat='acpi -i -b'
alias files='vifm'
alias net='elinks' 

PS1='%F{#00cd00}[%f%F{#00cd00}%n%f%F{#00cd00}@%f%F{#00cd00}%m%f %F{#00cd00}%/%f%F{#00cd00}]%f%F{#00cd00}$%f '
