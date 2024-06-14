{ config, pkgs, ...}:

{
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.xwayland.enable = true;

  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$terminal" = "wezterm";

    bind = [ 
      "$mod, t, exec, $terminal"
      "$mod ALT, t, exec, kitty"
      "$mod, q, exit"
    ];
  };

  wayland.windowManager.hyprland.extraConfig = ''
    exec-once = wezterm
  '';

  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };
}
