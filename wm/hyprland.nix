{ config, pkgs, inputs, ...}:

{
  wayland.windowManager.hyprland.enable = true;

  programs.kitty.enable = true;

  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "ALT";
    "$mod" = "SUPER";
    "$terminal" = "kitty";

    "workspace" = "f[1], border:0, gapsout:0";

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

      "$mainMod SHIFT, code:10, movetoworkspacesilent, 1"
      "$mainMod SHIFT, code:11, movetoworkspacesilent, 2"
      "$mainMod SHIFT, code:12, movetoworkspacesilent, 3"
      "$mainMod SHIFT, code:13, movetoworkspacesilent, 4"
      "$mainMod SHIFT, code:14, movetoworkspacesilent, 5"
      "$mainMod SHIFT, code:15, movetoworkspacesilent, 6"
      "$mainMod SHIFT, code:16, movetoworkspacesilent, 7"
      "$mainMod SHIFT, code:17, movetoworkspacesilent, 8"
      "$mainMod SHIFT, code:18, movetoworkspacesilent, 9"
      "$mainMod SHIFT, code:19, movetoworkspacesilent, 10"

      "$mod,       RETURN, exec, $terminal"

      "$mod,       d,      exec, discord"
      "$mod,       b,      exec, firefox"
      "$mod SHIFT, b,      exec, firefox --private-window"
      "$mod,       a,      exec, pavucontrol"
    ];

    binde = [
      "    , XF86MonBrightnessUp,   exec, ~/.config/eww/scripts/brightness.sh --inc 3"
      "    , XF86MonBrightnessDown, exec, ~/.config/eww/scripts/brightness.sh --dec 3" 
      "CTRL, XF86MonBrightnessUp,   exec, ~/.config/eww/scripts/brightness.sh --inc 1" 
      "CTRL, XF86MonBrightnessDown, exec, ~/.config/eww/scripts/brightness.sh --dec 1" 

      "    , XF86AudioMute,        exec, ~/.config/eww/scripts/volume.sh --mute"
      "    , XF86AudioRaiseVolume, exec, ~/.config/eww/scripts/volume.sh --inc 3"
      "    , XF86AudioLowerVolume, exec, ~/.config/eww/scripts/volume.sh --dec 3" 
      "CTRL, XF86AudioRaiseVolume, exec, ~/.config/eww/scripts/volume.sh --inc 1" 
      "CTRL, XF86AudioLowerVolume, exec, ~/.config/eww/scripts/volume.sh --dec 1" 
    ];

    exec-once = [
      "nm-applet"
      "wpaperd -d"
      # "eww open bar0"
      # "eww open bar1"
    ];
  };

  wayland.windowManager.hyprland.extraConfig = ''
  source=~/.config/hypr/extra.conf
  monitor=eDP-1,1920x1080@60,0x0,1

  # decoration {
  #   blur {
  #     enabled = false
  #   }
  # }
  #
  # dwindle {
  #   no_gaps_when_only = 1
  # }

  general {
    border_size = 1
    gaps_in = 3
    gaps_out = 6
  }

  input {
    kb_layout = us
    kb_variant = dvp

    touchpad {
      natural_scroll = yes
      scroll_factor = 0.2
    }
  }

  misc {
    new_window_takes_over_fullscreen = 1
    disable_hyprland_logo = true
  }
  '';

  home.packages = with pkgs; [
    ags
    eww
    networkmanagerapplet
    wpaperd
    # inputs.hyprpanel.packages.${builtins.currentSystem}.default
    # (builtins.getFlake "github:Jas-SinghFSU/HyprPanel/2fbbdd7b412bbb016ad9535771bf28f1d284550f").packages.${builtins.currentSystem}.default
  ];

  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };
}
