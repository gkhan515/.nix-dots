{ config, pkgs, ...}:

{
  # progams.hyprland.enable = true;
  wayland.windowManager.hyprland.enable = true;

  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$terminal" = "wezterm";

    bind = [ 
      "$mod, RETURN, exec, $terminal"
      "$mod, q, exit"
    ];
  };

  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };
}
