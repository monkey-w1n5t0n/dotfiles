#!/usr/bin/env bash
echo
echo "****"
echo "Starting autocommits..."
echo "$(date)"
echo

while true; do
echo "**$(date)"
inotifywait -e modify,create,move,delete -r $HOME/notes && \
echo "**Changed" && \
echo "$(date)" && \
echo "Sleeping before commit..." && \
sleep 5 && \
echo "Awake!" && \
echo "**Committing..." && \
echo "$(date)" && \
$HOME/scripts/autocommit.sh && \
echo "**Done!" && \
echo "$(date)" && \
echo
done
echo "***"
echo "Stopped autocommits..."
