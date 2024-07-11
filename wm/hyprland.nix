{ config, pkgs, ...}:

{
  wayland.windowManager.hyprland.enable = true;

  programs.kitty.enable = true;

  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "ALT";
    "$mod" = "SUPER";
    "$terminal" = "kitty";

    bind = [ 
      "$mainMod SHIFT, code:24, exit"

      "$mainMod SHIFT, code:54, killactive"

      "$mainMod, h, movefocus, l"
      "$mainMod, l, movefocus, r"
      "$mainMod, k, movefocus, u"
      "$mainMod, j, movefocus, d"

      "$mainMod, SPACE, fullscreen, 1"
      "$mainMod, code:58, fullscreen, 1"

      "$mainMod, code:10, workspace, 1"
      "$mainMod, code:11, workspace, 2"
      "$mainMod, code:12, workspace, 3"
      "$mainMod, code:13, workspace, 4"
      "$mainMod, code:14, workspace, 5"
      "$mainMod, code:15, workspace, 6"
      "$mainMod, code:16, workspace, 7"
      "$mainMod, code:17, workspace, 8"
      "$mainMod, code:18, workspace, 9"
      "$mainMod, code:19, workspace, 10"

      "$mainMod SHIFT, code:10, movetoworkspace, 1"
      "$mainMod SHIFT, code:11, movetoworkspace, 2"
      "$mainMod SHIFT, code:12, movetoworkspace, 3"
      "$mainMod SHIFT, code:13, movetoworkspace, 4"
      "$mainMod SHIFT, code:14, movetoworkspace, 5"
      "$mainMod SHIFT, code:15, movetoworkspace, 6"
      "$mainMod SHIFT, code:16, movetoworkspace, 7"
      "$mainMod SHIFT, code:17, movetoworkspace, 8"
      "$mainMod SHIFT, code:18, movetoworkspace, 9"
      "$mainMod SHIFT, code:19, movetoworkspace, 10"

      "$mod, RETURN, exec, $terminal"
      "$mod, b, exec, firefox"
      "$mod SHIFT, b, exec, firefox --private-window"
    ];

    exec-once = [
      "nm-applet"
      "wpaperd -d"
      "eww open bar0"
      "eww open bar1"
    ];

  };

  wayland.windowManager.hyprland.extraConfig = ''
  monitor=eDP-1,1920x1080@60,0x0,1

  general {
    border_size = 1
    gaps_in = 3
    gaps_out = 6
  }

  misc {
    new_window_takes_over_fullscreen = 1
    disable_hyprland_logo = true
  }

  input {
    kb_layout = us
    kb_variant = dvp

    touchpad {
      natural_scroll = yes
      scroll_factor = 0.2
    }
  }

  dwindle {
    no_gaps_when_only = 1
  }
  '';

  home.packages = with pkgs; [
    wpaperd
    networkmanagerapplet
  ];

  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };
}
