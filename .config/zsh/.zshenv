## EDITOR
export EDITOR='emacsclient -a "" -c'
export VISUAL=$EDITOR
export ALTERNATE_EDITOR=emacs

## DOTFILES ALIASES
export DOTFILES_GIT_DIR="$CONFIG_HOME/dotfiles/"
alias dotfiles="/usr/bin/git --git-dir=$DOTFILES_GIT_DIR --work-tree=$HOME"
alias dot=dotfiles

source $CONFIG_HOME/housekeeping/xdg-compliance.sh
