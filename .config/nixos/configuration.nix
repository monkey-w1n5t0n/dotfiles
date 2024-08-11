{
  config,
  pkgs,
  lib,
  ...
}:

{

  # System Configuration
  system.stateVersion = "24.05";
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Boot Configuration
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_8;

  # Networking
  networking.hostName = "blooper";
  networking.networkmanager.enable = true;

  # Time and Locale
  time.timeZone = "Europe/Athens";
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # X11 and Window Manager Configuration
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "dvorak";
      options = "caps:ctrl_modifier";
    };
    desktopManager.xterm.enable = false;
  };
  services.displayManager.defaultSession = "none+i3";
  services.xserver.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    extraPackages = with pkgs; [
      dmenu
      rofi
      i3status
      i3lock
      polybarFull
      # polybar-pulseaudio-control
      arandr
    ];
  };
  programs.dconf.enable = true;

  # Console Configuration
  console.keyMap = "dvorak";

  # Sound Configuration
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # User Configuration
  users.defaultUserShell = pkgs.zsh;
  users.users.w1n5t0n = {
    isNormalUser = true;
    description = "w1n5t0n";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  # System Packages
  environment.systemPackages = with pkgs; [
    # System utilities
    wget
    curl
    killall
    blueman
    tlp
    bluez
    bluez-tools
    brightnessctl
    ddcutil
    lm_sensors
    # tuned TODO

    # Development tools
    gcc
    clang
    gnumake
    cmake
    emacs
    nodejs

    # Audio tools
    pavucontrol
    helvum
    qpwgraph

    # Theming
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct

    # Other utilities
    xorg.xbacklight
    alacritty
    # p7zip
  ];

  # Program Configuration
  programs = {
    firefox.enable = true;
    git.enable = true;
    zsh = {
      enable = true;
      enableCompletion = true;
      histFile = "$HOME/.config/zsh/history";
      autosuggestions.enable = true;
      zsh-autoenv.enable = true;
      syntaxHighlighting.enable = true;
      ohMyZsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [
          "git"
          "npm"
          "history"
          "node"
          "rust"
          "deno"
        ];
      };
    };
  };

  # Service Configuration
  services = {
    emacs = {
      enable = true;
      defaultEditor = true;
    };
    flatpak.enable = true;
    printing.enable = true;
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 20;
        START_CHARGE_THRESH_BAT0 = 40;
        STOP_CHARGE_THRESH_BAT0 = 80;
      };
    };
  };

  # Hardware Configuration
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  powerManagement.enable = true;

  # XDG Portal Configuration
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };

  home-manager.backupFileExtension = "hm_backup"; # Add this line
}
