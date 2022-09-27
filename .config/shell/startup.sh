export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

source $HOME/.config/shell/init.sh

# AUTOGITS
$HOME/scripts/start-daemons

## Disable annoying bell
xset -b
