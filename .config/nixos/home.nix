{ config, pkgs, ... }:

{
  # imports = [ ./visual/picom.nix ];

  home.username = "w1n5t0n";
  home.homeDirectory = "/home/w1n5t0n";

  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    # Communication
    signal-desktop
    telegram-desktop
    discord
    zoom

    # Web browsers
    firefox
    brave
    chromium
    # nyxt

    # Development tools
    gitkraken
    virtualbox
    vscodium
    bbin
    openscad
    openscad-lsp
    vscode-extensions.antyos.openscad
    pkg-config
    ## languages
    sbcl
    clojure
    racket
    babashka
    go
    meson
    ninja

    #storage & backup
    pcloud
    megasync
    # megacmd
    syncthing
    syncthingtray

    # System utilities
    baobab
    czkawka
    filelight
    localsend
    gparted
    timeshift
    cpustat
    visualvm
    monitor
    stacer
    keepassxc
    neofetch
    ripgrep
    jq
    yq-go
    eza
    fzf
    feh
    bitwarden-desktop
    bitwarden-cli
    bitwarden-menu

    # archives
    zip
    xz
    unzip
    p7zip

    # File management
    cinnamon.nemo
    dolphin
    gnome.nautilus
    pcmanfm
    nnn # terminal file browser

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

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    hugo # static site generator
    glow # markdown previewer in terminal

    btop # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    # lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
    #
    cura

    # wine-staging
    wineWowPackages.stagingFull
    # winetricks (all versions)
    winetricks
    yabridge
    yabridgectl
  ];

  #   # Git configuration
  programs.git = {
    enable = true;
    userName = "w1n5t0n";
    userEmail = "w1n5t0n@lnfinitemonkeys.org";
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      nixswitch = "sudo nixos-rebuild switch --flake ~/.config/nixos#blooper";
      nixbuild = "sudo nixos-rebuild build --flake ~/.config/nixos#blooper";
      nixtest = "sudo nixos-rebuild test --flake ~/.config/nixos#blooper";

      notes = "git --git-dir=${config.home.sessionVariables.NOTES_GIT_DIR} --work-tree=${config.home.sessionVariables.NOTES_WORK_TREE}";
      n = "git --git-dir=${config.home.sessionVariables.NOTES_GIT_DIR} --work-tree=${config.home.sessionVariables.NOTES_WORK_TREE}";
      na = "git --git-dir=${config.home.sessionVariables.NOTES_AUTOGIT_DIR} --work-tree=${config.home.sessionVariables.NOTES_WORK_TREE}";
      dotfiles = "git --git-dir=${config.home.sessionVariables.DOTFILES_GIT_DIR} --work-tree=${config.home.homeDirectory}";
      dot = "git --git-dir=${config.home.sessionVariables.DOTFILES_GIT_DIR} --work-tree=${config.home.homeDirectory}";
      cdsrc = "cd ${config.home.sessionVariables.SRC_DIR}";
      cdscr = "cd ${config.home.sessionVariables.SCRIPT_DIR}";
      cp = "cp -i";
      df = "df -h";
      free = "free -m";
      gitu = "git add . && git commit && git push";
    };
  };

  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      window.opacity = 0.9;
      env.TERM = "xterm-256color";
      font = {
        size = 12;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  home.sessionPath = [
    "~/.config/emacs/bin"
    "~/scripts"
  ];

  home.sessionVariables = {
    EDITOR = "emacsclient -ca '' &";
    BROWSER = "firefox";
    FILE = "nemo";

    ##########
    ## PATHS
    CONFIG_DIR = "${config.home.homeDirectory}/.config";
    SYS_CONFIG_DIR = "${config.home.sessionVariables.CONFIG_DIR}/sys";
    PACKAGE_CONFIG_DIR = "${config.home.sessionVariables.SYS_CONFIG_DIR}/packages";
    EMACS_DIR = "${config.home.sessionVariables.CONFIG_DIR}/emacs";
    DOOM_DIR = "${config.home.sessionVariables.EMACS_DIR}";
    DOOM_USER_DIR = "${config.home.sessionVariables.CONFIG_DIR}/doom";
    DOTFILES_GIT_DIR = "${config.home.homeDirectory}/.local/dotfiles-git";

    # NOTES
    NOTES_DIR = "${config.home.homeDirectory}/notes";
    ORG_DIR = "${config.home.sessionVariables.NOTES_DIR}/org";
    ORG_ROAM_DIR = "${config.home.sessionVariables.NOTES_DIR}/org-roam";

    # Notes Git
    NOTES_GIT_DIR = "${config.home.homeDirectory}/.local/notes-git";
    NOTES_AUTOGIT_DIR = "${config.home.homeDirectory}/.local/notes-autogit";
    NOTES_WORK_TREE = "${config.home.sessionVariables.NOTES_DIR}";

    # src & scripts
    SRC_DIR = "${config.home.homeDirectory}/src";
    SCRIPT_DIR = "${config.home.homeDirectory}/scripts";

    # i3
    I3_CONFIG = "${config.home.sessionVariables.CONFIG_DIR}/i3/config";

    # SXHKD
    SXHKD_CONFIG = "${config.home.sessionVariables.CONFIG_DIR}/sxhkd/sxhkdrc";
  };

  #   # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
