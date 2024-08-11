{ pkgs, ... }:

{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

    services.flatpak.enable = true;

services.devmon.enable = true;
services.gvfs.enable = true;
services.udisks2.enable = true;

}