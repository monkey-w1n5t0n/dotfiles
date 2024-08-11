{ pkgs, ... }:
let
  nix-software-center = import (pkgs.fetchFromGitHub {
    owner = "snowfallorg";
    repo = "nix-software-center";
    rev = "0.1.2";
    sha256 = "xiqF1mP8wFubdsAQ1BmfjzCgOD3YZf7EGWl9i69FTls=";
  }) {};
in
{
# List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; 
  [
    # General utils
    nix-software-center    
    xorg.xbacklight
    wget
    alacritty
    p7zip
    killall
    blueman
    tlp
    bluez
    bluez-tools
    nodejs

    # coding
    gnumake
    cmake
    emacs
    # audio/music
    pavucontrol
    helvum

    qpwgraph

# theming
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
  ];

  environment.systemPackages = with pkgs; 
  [ 
    emacs gitFull 
  ];
}