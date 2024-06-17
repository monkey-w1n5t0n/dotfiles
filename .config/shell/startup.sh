source $HOME/.config/shell/init.sh

# AUTOGITS
$HOME/scripts/start-daemons

## Disable annoying bell
xset -b

/usr/lib/geoclue-2.0/demos/agent & redshift-gtk &


# Start the SSH agent if it is not running
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi

# Load the environment variables for the SSH agent
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<"$XDG_RUNTIME_DIR/ssh-agent.env")"
fi


# source /usr/share/nvm/init-nvm.sh
