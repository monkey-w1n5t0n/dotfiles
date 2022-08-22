#!/usr/bin/sh

function mvp ()
{
    dir="$2" # Include a / at the end to indicate directory (not filename)
    tmp="$2"; tmp="${tmp: -1}"
    [ "$tmp" != "/" ] && dir="$(dirname "$2")"
    [ -a "$dir" ] ||
    mkdir -p "$dir" &&
    mv "$@"
}

REMOTE="git@github.com:monkey-w1n5t0n/dotfiles"
LOCAL=$HOME/.local/dotfiles
BACKUP=$HOME/backup/dotfiles

echo "Cloning repo..."
git clone --bare $REMOTE $LOCAL
echo "Repo cloned."

alias dotfiles="/usr/bin/git --git-dir=$LOCAL --work-tree=$HOME"

mkdir -p $BACKUP

echo "Checking out..."
dotfiles checkout

if [ 0 = 0 ]; then
  echo Checked out dotfiles.;
  else
    echo "Backing up pre-existing dotfiles...";
    # FIXME
    dotfiles checkout 2>&1 | sed 1d | head -n -2 | awk '{ print $1 }' | xargs -I _FILE sh -c "mkdir -p $(dirname $HOME/backups/dotfiles/_FILE) "
    echo "Backup done."
fi;

dotfiles checkout
dotfiles config status.showUntrackedFiles no
