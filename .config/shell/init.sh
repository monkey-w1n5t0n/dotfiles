export FUNCTIONS_CONFIG="$CONFIG_SHELL_DIR/functions.sh"
export PATH_CONFIG="$CONFIG_SHELL_DIR/path.sh"
export ENV_CONFIG="$CONFIG_SHELL_DIR/env.sh"
export ALIAS_CONFIG="$CONFIG_SHELL_DIR/alias.sh"

function source_config() {
   source $FUNCTIONS_CONFIG
   source $PATH_CONFIG
   source $ENV_CONFIG
   source $ALIAS_CONFIG
}

source_config


source /usr/share/nvm/init-nvm.sh
