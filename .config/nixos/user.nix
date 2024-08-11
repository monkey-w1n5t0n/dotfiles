{}:
{
# Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.w1n5t0n = {
    isNormalUser = true;
    description = "w1n5t0n";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "audio"
      "realtime"
      "dialout"
    ];
    packages = with pkgs; 
    [
      #  thunderbird
      flatpak
      gnome.gnome-software # needed for flatpak gui   apparently
      arduino-ide

      signal-desktop
      telegram-desktop
      chromium
      gitkraken
      pkgs.kdePackages.kdeconnect-kde
      virtualbox
      vscodium
      cura
      baobab
      kdePackages.isoimagewriter
      audacity
      czkawka
      darktable
      # sqlite
      sqlite-web
      sqlitebrowser

      supercollider-with-sc3-plugins

      sbcl
      clojure
      babashka
      bbin

      deskreen
      discord
      easyeffects
      filelight
      gparted
      localsend
      cinnamon.nemo
      nitrogen
      obs-studio
      openscad
      openscad-lsp
      vscode-extensions.antyos.openscad

      cpustat
      visualvm
      vlc
      warp

      wineWowPackages.stagingFull

      qbittorrent

      redshift

      shotwell

      sonic-pi

      spectacle
      stacer
      steam
      monitor
      timeshift

      zoom
      nixfmt-rfc-style
      
      ripgrep
      dolphin
      gnome.nautilus
      pcmanfm

      #theming
      #libsForQt5.qt5ct
    ];
  };
}
