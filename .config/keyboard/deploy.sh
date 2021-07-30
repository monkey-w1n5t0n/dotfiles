#!/usr/bin/sh
sudo cat ./udevmon.yaml >> /etc/udevmon.yaml
sudo cat ./udevmon.service >> /etc/systemd/system/udevmon.service

sudo systemctl enable --now udevmon
