

export EDITOR="emacsclient -ca '' &"
export BROWSER="/usr/bin/firefox"
export FILE="/usr/bin/nemo"

# SYS
export SYS_CONFIG_DIR="$CONFIG_DIR/sys"
export PACKAGE_CONFIG_DIR="$SYS_CONFIG_DIR/packages"

export DOOM_DIR="$CONFIG_DIR/emacs"
export DOOM_USER_DIR="$CONFIG_DIR/doom"

export DOTFILES_GIT_DIR="$HOME/.local/dotfiles-git"

# NOTES
export NOTES_DIR="$HOME/notes"
export ORG_DIR="$NOTES_DIR/org"
export ORG_ROAM_DIR="$NOTES_DIR/org-roam"
## Notes Git
export NOTES_GIT_DIR="$HOME/.local/notes-git"
export NOTES_AUTOGIT_DIR="$HOME/.local/notes-autogit"
export NOTES_WORK_TREE="$NOTES_DIR"

# src & scripts
export SRC_DIR="$HOME/src"
export SCRIPT_DIR="$HOME/scripts"

# EMACS
#PATH_prepend($EMACS_DIR/bin)

# i3
export I3_CONFIG="$CONFIG_DIR/i3/config"
# SXHKD
export SXHKD_CONFIG="$CONFIG_DIR/sxhkd/sxhkdrc"

####export QT_QPA_PLATFORMTHEME="qt5ct"
####export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

####export JAVA_HOME="/usr/lib/jvm/java-20-openjdk"

dreamclublab_env="$HOME/src/jobs/ian/OSC_PIBOT/scripts/env"
if [ -f $dreamclublab_env ]; then
    source $dreamclublab_env
fi

export MY_IP="192.168.1.212"
export MY_ID="192.168.1.212"
export MY_ROBOT_NAME="iRobotCreate3"
