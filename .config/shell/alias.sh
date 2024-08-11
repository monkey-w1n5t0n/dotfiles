####git=/usr/bin/git

alias notes="git \
    --git-dir=$NOTES_GIT_DIR \
    --work-tree=$NOTES_WORK_TREE"
alias notes_ac="git \
    --git-dir=$NOTES_AUTOGIT_DIR \
    --work-tree=$NOTES_WORK_TREE"
alias n=notes
alias na=notes_ac

alias dotfiles="git --git-dir=$DOTFILES_GIT_DIR --work-tree=$HOME"
alias dot=dotfiles

# TODO not working?
alias cdsrc=cd $SRC_DIR
alias cdscr=cd $SCRIPT_DIR

# Taken from the manjaro zsh config
alias cp="cp -i"                                                # Confirm before overwriting something
alias df='df -h'                                                # Human-readable sizes
alias free='free -m'                                            # Show sizes in MB
alias gitu='git add . && git commit && git push'

# Performance related
alias cpu-max='tuned-adm profile latency-performance'
alias cpu-balanced='tuned-adm profile balanced'
alias cpu-min='tuned-adm profile laptop-battery-powersave'

alias nixswitch='sudo nixos-rebuild switch --flake ~/.config/nixos#blooper'

alias nixbuild='sudo nixos-rebuild build --flake ~/.config/nixos#blooper'
alias nixtest='sudo nixos-rebuild test --flake ~/.config/nixos#blooper'
