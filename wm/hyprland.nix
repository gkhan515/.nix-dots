{ config, pkgs, ...}:

{
  wayland.windowManager.hyprland.enable = true;

  programs.kitty.enable = true;

  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$terminal" = "kitty";

    bind = [ 
      "$mod, RETURN, exec, $terminal"
      "$mod, q, exit"
      "$mod, b, exec, firefox"
    ];
  };

  wayland.windowManager.hyprland.extraConfig = ''
  input {
    kb_layout = us
    kb_variant = dvp
  }
  '';

  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };
}
