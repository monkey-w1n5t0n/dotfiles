{ config, pkgs, ... }:

{
  home.username = "w1n5t0n";
  home.homeDirectory = "/home/w1n5t0n";

  home.stateVersion = "24.05";

  # Enable backup of existing files
  # home.backupFileExtension = "hm_backup";

  home.packages = with pkgs; [
    # Communication
    signal-desktop
    telegram-desktop
    discord
    zoom

    # Web browsers
    chromium

    # Development tools
    gitkraken
    virtualbox
    vscodium
    sbcl
    clojure
    babashka
    bbin
    openscad
    openscad-lsp
    vscode-extensions.antyos.openscad

    # System utilities
    baobab
    czkawka
    filelight
    gparted
    localsend
    timeshift
    cpustat
    visualvm
    monitor
    stacer
    keepassxc

    # File management
    nemo
    dolphin
    nautilus
    pcmanfm

    # Media
    vlc
    shotwell
    audacity
    darktable
    obs-studio

    # Graphics and design
    nitrogen
    spectacle

    # Audio and music production
    supercollider-with-sc3-plugins
    sonic-pi
    easyeffects

    # Database tools
    sqlite-web
    sqlitebrowser

    # Networking tools
    deskreen
    warp
    qbittorrent

    # Gaming
    steam

    # Other utilities
    arduino-ide
    kdeconnect
    kdePackages.isoimagewriter
    redshift
    wineWowPackages.stagingFull
    bc
    ripgrep

    # Formatting tools
    nixfmt-rfc-style

    # FONTS
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "DroidSansMono"
      ];
    })
    mplus-outline-fonts.githubRelease
    # dina-font
    # proggyfonts

  ];

  # Git configuration
  programs.git = {
    enable = true;
    userName = "w1n5t0n";
    userEmail = "w1n5t0n@lnfinitemonkeys.org";
  };

  programs.zsh = {
    enable = true;

    shellAliases = {
      notes = "$GIT_CMD --git-dir=$NOTES_GIT_DIR --work-tree=$NOTES_WORK_TREE";
      "notes-ac" = "$GIT_CMD --git-dir=$NOTES_AUTOGIT_DIR --work-tree=$NOTES_WORK_TREE";
      n = "notes";
      na = "notes_ac";
      dotfiles = "$GIT_CMD --git-dir=$DOTFILES_GIT_DIR --work-tree=$HOME";
      dot = "dotfiles";
      cdsrc = "cd $SRC_DIR";
      cdscr = "cd $SCRIPT_DIR";
      cp = "cp -i";
      df = "df -h";
      free = "free -m";
      gitu = "git add . && git commit && git push";
      # "cpu-max" = "tuned-adm profile latency-performance";
      # "cpu-balanced" = "tuned-adm profile balanced";
      # "cpu-min" = "tuned-adm profile laptop-battery-powersave";
    };

    # Other zsh configurations...
  };

  home.sessionVariables = {
    EDITOR = "emacsclient -ca '' &";
    BROWSER = "firefox";
    FILE = "nemo";

    ##########
    ## PATHS
    CONFIG_DIR = "$HOME/.config";
    SYS_CONFIG_DIR = "$CONFIG_DIR/sys";
    PACKAGE_CONFIG_DIR = "$SYS_CONFIG_DIR/packages";
    EMACS_DIR = "$CONFIG_DIR/emacs";
    DOOM_DIR = "$EMACS_DIR";
    DOOM_USER_DIR = "$CONFIG_DIR/doom";
    DOTFILES_GIT_DIR = "$HOME/.local/dotfiles-git";

    # NOTES
    NOTES_DIR = "$HOME/notes";
    ORG_DIR = "$NOTES_DIR/org";
    ORG_ROAM_DIR = "$NOTES_DIR/org-roam";

    # Notes Git
    NOTES_GIT_DIR = "$HOME/.local/notes-git";
    NOTES_AUTOGIT_DIR = "$HOME/.local/notes-autogit";
    NOTES_WORK_TREE = "$NOTES_DIR";

    # src & scripts
    SRC_DIR = "$HOME/src";
    SCRIPT_DIR = "$HOME/scripts";

    # EMACS
    # Note: PATH modifications are handled differently in NixOS/Home Manager

    # i3
    I3_CONFIG = "$CONFIG_DIR/i3/config";

    # SXHKD
    SXHKD_CONFIG = "$CONFIG_DIR/sxhkd/sxhkdrc";
  };

  # Add any other home-manager configurations here
  # For example, you can configure your dotfiles, shell aliases, etc.
  # fonts.enableDefaultpackages = true;
  # fonts = {
  #   fontDir.enable = true;
  #   enableDefaultPackages = true;
  #   packages = with pkgs; [
  #     noto-fonts
  #     noto-fonts-cjk
  #     noto-fonts-emoji
  #     liberation_ttf
  #     fira-code
  #     fira-code-symbols
  #     (nerdfonts.override {
  #       fonts = [
  #         "FiraCode"
  #         "DroidSansMono"
  #       ];
  #     })
  #     mplus-outline-fonts.githubRelease
  #     dina-font
  #     proggyfonts
  #   ];

  #   fontconfig = {
  #     defaultFonts = {
  #       serif = [ "Liberation Serif" ];
  #       sansSerif = [ "Noto Sans" ];
  #       monospace = [ "Fira Code" ];
  #     };
  #   };
  # };

  fonts.fontconfig.enable = true;

}
