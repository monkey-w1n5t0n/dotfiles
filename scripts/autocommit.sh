#!/usr/bin/env bash
/usr/bin/git --git-dir=$HOME/.local/research-autocommit --work-tree=$HOME/research add .
/usr/bin/git --git-dir=$HOME/.local/research-autocommit --work-tree=$HOME/research commit -am "Automatic Commit: `date +%F-%T`"
