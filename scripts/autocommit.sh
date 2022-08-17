#!/usr/bin/env bash
/usr/bin/git --git-dir=$HOME/.local/notes-autocommit --work-tree=$HOME/notes add .
/usr/bin/git --git-dir=$HOME/.local/notes-autocommit --work-tree=$HOME/notes commit -am "Automatic Commit: `date +%F-%T`"
