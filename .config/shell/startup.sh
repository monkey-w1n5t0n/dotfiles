source $HOME/.config/shell/init.sh

# AUTOGITS
$HOME/scripts/start-daemons

## Disable annoying bell
xset -b

/usr/lib/geoclue-2.0/demos/agent & redshift-gtk &

source /usr/share/nvm/init-nvm.sh
