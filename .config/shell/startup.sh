# From Manjaro default .profile
export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nano
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/firefox


export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export SHELL_CONFIG_HOME="$XDG_CONFIG_HOME/shell"
source $SHELL_CONFIG_HOME/init.sh

# AUTOGITS
$HOME/scripts/start-daemons

## Disable annoying bell
xset -b

source /usr/share/nvm/init-nvm.sh
