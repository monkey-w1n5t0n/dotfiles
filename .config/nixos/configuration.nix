{
  config,
  pkgs,
  lib,
  ...
}:
let
  homeManagerConfig = import ./home.nix { inherit config pkgs lib; };
  # screen & keyboard management
  enable-script = pkgs.writeScript "enable-eDP2.sh" ''
    ${pkgs.xorg.xrandr}/bin/xrandr --output eDP-2 --below eDP-1 --auto
  '';
  disable-script = pkgs.writeScript "disable-eDP2.sh" ''
    ${pkgs.xorg.xrandr}/bin/xrandr --output eDP-2 --off
  '';

  jdk = pkgs.jdk17;

  # Create a custom leiningen wrapper with the JDK we want
  customLein = pkgs.leiningen.override { jdk = jdk; };
in
{
  # System Configuration
  system.stateVersion = "24.05";
  # nix.gc = {
  #   automatic = true;
  #   dates = "weekly";
  #   options = "--delete-older-than 7d";
  # };

  # Enable flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Boot Configuration
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # NOTE this is needed (hopefully temporarily) for dual screen to work on UX8406
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_8;
  # boot.kernelPackages = pkgs.linuxPackages_6_9;
  # boot.kernelPatches = [
  #   {
  #     name = "drm-dual-display-fix";
  #     patch = pkgs.fetchpatch {
  #       url = "https://gitlab.freedesktop.org/drm/i915/kernel/-/commit/93cbc1accbcec2740231755774420934658e2b18.patch";
  #       revert = true;
  #       hash = "sha256-MuI8aNX7651ODXsRO/1AEQHenzY6Q201l3n+U6kZD6Y=";
  #     };
  #   }
  #   # {
  #   #   name = "zenbook-asus-hid";
  #   #   patch = ./zenbook-asus-hid.patch;
  #   # }
  #   # {
  #   #   name = "zenbook-asus-wmi";
  #   #   patch = ./zenbook-asus-wmi.patch;
  #   # }
  # ];

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

  # Console Configuration
  console.keyMap = "dvorak";

  # X11 and Window Manager Configuration
  services.xserver = {
    enable = true;

    # keyboard
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;
    xkb = {
      layout = "us";
      variant = "dvorak";
      # options = "caps:ctrl_modifier,caps:escape";
      options = "ctrl:nocaps";
    };

    # displayManager.gdm.enable = true;

    desktopManager = {
      xterm.enable = false;

      # gnome = {
      #   enable = true;
      #   extraGSettingsOverrides = ''
      #     [org.gnome.mutter]
      #     dynamic-workspaces=false
      #     workspaces-only-on-primary=false
      #   '';
      # };
    };

    # i3
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-rounded;
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
  };

  # Add a script to run xcape on startup
  # services.xserver.displayManager.sessionCommands = ''
  #   ${pkgs.xcape}/bin/xcape -e 'Control_L=Escape'
  # '';

  # environment.etc."xsessions/gnome-i3.desktop" = {
  #   text = ''
  #     [Desktop Entry]
  #     Name=GNOME + i3
  #     Comment=This session logs you into GNOME with i3 as the window manager
  #     Exec=${pkgs.runtimeShell} -l -c "env GNOME_SHELL_SESSION_MODE=classic gnome-session --session=gnome-classic & sleep 1 && ${pkgs.i3-gaps}/bin/i3"
  #     TryExec=${pkgs.i3}/bin/i3
  #     Type=Application
  #     DesktopNames=GNOME
  #     X-GDM-SessionRegisters=true
  #   '';
  #   mode = "0644";
  # };

  services.displayManager.defaultSession = "none+i3";
  programs.dconf.enable = true;

  # conflicts with tlp
  services.power-profiles-daemon.enable = false;

  # services.interception-tools = {
  #   enable = true;
  #   udevmonConfig = ''
  #     - JOB: "${pkgs.interception-tools}/bin/intercept -g $DEVNODE | ${pkgs.interception-tools}/bin/caps2esc | ${pkgs.interception-tools}/bin/uinput -d $DEVNODE"
  #       DEVICE:
  #         EVENTS:
  #           EV_KEY: [KEY_CAPSLOCK, KEY_ESC]
  #   '';
  # };

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
      # "power"
      # "vboxusers"
      # "realtime"
      "video"
      "input"
      "disk"
      "audio"
      "dialout"
      # "lock"
      # "network"
      # "sys"
      # "uucp"
    ];
  };

  # System Packages
  environment.systemPackages = with pkgs; [
    gnome.gnome-session

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
    networkmanagerapplet
    # tuned TODO

    # Development tools

    gcc
    clang
    gnumake
    cmake
    emacs
    nodejs
    clang-tools
    libtool

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
    nushellFull
    redshift
    xflux-gui

    nix-index # for nix-locate
    # p7zip

    xcape

    # timelines
    customLein
    clojure
    jdk
    glfw
    libGL
    xorg.libX11
    xorg.libXxf86vm
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXi
    libpulseaudio
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

  home-manager.backupFileExtension = "hm_backup";

  # Thunderbolt
  services.hardware.bolt.enable = true;

  # Hardware acceleration
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  # manage 2nd screen when keyboard is disconnected
  # services.udev.extraRules = ''
  #   ACTION=="add",    ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1b2c", ENV{DISPLAY}=":0", ENV{XAUTHORITY}="/home/mfenniak/.Xauthority", RUN+="${pkgs.bash}/bin/bash ${disable-script}"
  #   ACTION=="remove", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1b2c", ENV{DISPLAY}=":0", ENV{XAUTHORITY}="/home/mfenniak/.Xauthority", RUN+="${pkgs.bash}/bin/bash ${enable-script}"
  # '';

  # load VPU (Vector Processing Unit) firmware
  hardware.firmware = [
    (
      let
        model = "37xx";
        version = "0.0";

        firmware = pkgs.fetchurl {
          url = "https://github.com/intel/linux-npu-driver/raw/v1.2.0/firmware/bin/vpu_${model}_v${version}.bin";
          hash = "sha256-qGhLLiBnOlmF/BEIGC7DEPjfgdLCaMe7mWEtM9uK1mo=";
        };
      in
      pkgs.runCommand "intel-vpu-firmware-${model}-${version}" { } ''
        mkdir -p "$out/lib/firmware/intel/vpu"
        cp '${firmware}' "$out/lib/firmware/intel/vpu/vpu_${model}_v${version}.bin"
      ''
    )
  ];

  # set the screen brightnesses in the initrd (50 for top, 0 for bottom)
  # boot.initrd = {
  #   kernelModules = [ "i915" ]; # Early KMS
  #   systemd.services.initrd-brightness = {
  #     unitConfig.DefaultDependencies = false;
  #     wantedBy = [ "initrd.target" ];
  #     requires = [
  #       ''sys-devices-pci0000:00-0000:00:02.0-drm-card1-card1\x2deDP\x2d1-intel_backlight.device''
  #       ''sys-devices-pci0000:00-0000:00:02.0-drm-card1-card1\x2deDP\x2d2-card1\x2deDP\x2d2\x2dbacklight.device''
  #     ];
  #     before = [ "plymouth-start.service" ];
  #     after = [
  #       ''sys-devices-pci0000:00-0000:00:02.0-drm-card1-card1\x2deDP\x2d1-intel_backlight.device''
  #       ''sys-devices-pci0000:00-0000:00:02.0-drm-card1-card1\x2deDP\x2d2-card1\x2deDP\x2d2\x2dbacklight.device''
  #     ];
  #     script = ''
  #       echo 50 > '/sys/devices/pci0000:00/0000:00:02.0/drm/card1/card1-eDP-1/intel_backlight/brightness'
  #       echo  0 > '/sys/devices/pci0000:00/0000:00:02.0/drm/card1/card1-eDP-2/card1-eDP-2-backlight/brightness'
  #     '';
  #   };
  # };

  # Stop killing wifi when moving the keyboard
  # boot.blacklistedKernelModules = [
  #   "asus_nb_wmi" # Kills the Wi-Fi any time I connect the keyboard
  # ];

  ### Kyria setup
  ### FIXME doesn't work
  # Ensure the script is copied to the Nix store
  # environment.etc."kyria-keyboard-script".source = /home/w1n5t0n/scripts/keyboard;

  # # Create a systemd service
  # systemd.services.kyria-keyboard-setup = {
  #   description = "Kyria Keyboard Setup Service";
  #   serviceConfig = {
  #     Type = "oneshot";
  #     ExecStart = "${pkgs.zsh}/bin/zsh /etc/kyria-keyboard-script";
  #     RemainAfterExit = "yes";
  #   };
  # };

  # # Create a udev rule to trigger the service
  # services.udev.extraRules = ''
  #   ACTION=="add", SUBSYSTEM=="input", ATTRS{id/product}=="6060", ATTRS{id/vendor}=="4653", TAG+="systemd", ENV{SYSTEMD_WANTS}="kyria-keyboard-setup.service"
  # '';

  # fonts.packages = with pkgs; [
  #   hermit
  #   source-code-pro
  #   terminus_font
  # ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts

    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "DroidSansMono"
      ];
    })

    font-awesome

    # xorg.fontfixed
    unifont
    siji

  ];

  # # Linker paths for timelines
  # environment.variables = {
  #   LD_LIBRARY_PATH = lib.makeLibraryPath [
  #     pkgs.libGL
  #     pkgs.libpulseaudio
  #     pkgs.glfw
  #   ];
  # };

  # Modify LD_LIBRARY_PATH
  environment.extraInit = ''
    export LD_LIBRARY_PATH=${
      lib.makeLibraryPath [
        pkgs.libGL
        pkgs.libpulseaudio
        pkgs.glfw
      ]
    }:$LD_LIBRARY_PATH
  '';

  # Add a script to run xcape on startup
  services.xserver.displayManager.sessionCommands = ''
    ${pkgs.xcape}/bin/xcape -e 'Control_L=Escape' -t 100'
  '';
}
