{ config, pkgs, ...}:

{
  home.packages = with pkgs; [
    kitty
  ];

  wayland.windowManager.hyprland.enable = true;

  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$terminal" = "kitty";

    bind = [ 
      "$mod, t, exec, $terminal"
      "$mod, q, exit"
    ];
  };

  wayland.windowManager.hyprland.extraConfig = ''
    exec-once = $terminal
  '';

  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };
}
