export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=${HOME}/.config}
export ZDOTDIR=${ZDOTDIR:=${XDG_CONFIG_HOME}/zsh}
export HISTFILE=$ZDOTDIR/.zhistory
source $ZDOTDIR/.zshenv
