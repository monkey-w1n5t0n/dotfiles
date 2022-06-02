export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR="emacsclient -c &"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/firefox
export FILE=/usr/bin/pcmanfm


##########
## PATH stuff
export KEYBOARD_CONFIG="$HOME/.config/keyboard"
export DEV_DIR="$HOME/dev/"
export SCRIPT_DIR="$DEV_DIR/scripts"

# Scripts
export PATH="$HOME/dev/scripts:$PATH"

# Configs
export CONFIG_DIR=$HOME/.config

export I3_CONFIG=$CONFIG_DIR/i3/config
export SXHKD_CONFIG=$CONFIG_DIR/sxhkd/sxhkdrc

# Emacs
export EMACS_DIR=$CONFIG_DIR/emacs
export DOOM_DIR=$CONFIG_DIR/doom
export PATH=$EMACS_DIR/bin:$PATH

## Lang
# V
#export PATH=$HOME/dev/lang/v:$PATH
##########

source $HOME/.config/keyboard/setup_keyboard.sh
