{
  config,
  pkgs,
  lib,
  ...
}:
{

  services.picom = {
    enable = true;
    backend = "glx";
    settings = {
      # blur = true;
      # blur-size = 20;
      # blurExclude = [ ];
      # inactiveDim = "0.5";
      # noDNDShadow = false;
      # noDockShadow = true;
      corner-radius = 10;
      rounded-corners-exclude = [
        "window_type = 'dock'"
        "class_g = 'i3-frame'"
      ];
    };
    # fade = true;
    # activeOpacity = 1.0;
    # inactiveOpacity = 0.85;
    # menuOpacity = 1.0;
    # opacityRules = [
    #   "0:_NET_WM_STATE@[0]:32a = '_NET_WM_STATE_HIDDEN'" # Hide tabbed windows
    # ];
    shadow = true;
    # shadow-radius = 20;
    shadowExclude = [ ];
    shadowOffsets = [
      (-10)
      (-10)
    ];
    shadowOpacity = 0.8;
    # vSync = true;
  };

  xsession.windowManager.i3.config.startup = [
    {
      command = "systemctl --user restart picom";
      always = true;
      notification = false;
    }
  ];
}
