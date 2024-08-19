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
    # settings = {
    #   blur = true;
    #   blurExclude = [ ];
    #   inactiveDim = "0.5";
    #   noDNDShadow = false;
    #   noDockShadow = false;
    #   # shadow-radius = 20
    #   # '';
    #   # shadow-radius = 20
    #   # corner-radius = 10
    #   # blur-size = 20
    #   # rounded-corners-exclude = [
    #   # "window_type = 'dock'",
    #   # "class_g = 'i3-frame'"
    #   # ]
    #   # '';
    # };
    activeOpacity = 1.0;
    fade = true;
    inactiveOpacity = 0.8;
    menuOpacity = 1.0;
    opacityRules = [
      "0:_NET_WM_STATE@[0]:32a = '_NET_WM_STATE_HIDDEN'" # Hide tabbed windows
    ];
    shadow = true;
    shadowExclude = [ ];
    shadowOffsets = [
      (-10)
      (-10)
    ];
    shadowOpacity = 0.8;
    vSync = true;
  };

  xsession.windowManager.i3.config.startup = [
    {
      command = "systemctl --user restart picom";
      always = true;
      notification = false;
    }
  ];
}
