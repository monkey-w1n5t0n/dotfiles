# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi




##########
## PATH
export PATH="$HOME/dev/lib/depot_tools:${PATH}"

export PATH="$HOME/dev/scripts:${PATH}"


# Background
#feh --bg-scale ~/Documents/wallpapers/wp5413541.jpg
