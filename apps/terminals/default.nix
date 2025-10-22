{ config, pkgs, ...}:

{
  programs.alacritty = {
    enable = true;
    package = pkgs.emptyDirectory;
  };

  programs.ghostty = {
    enable = true;
    package = pkgs.emptyDirectory;
    settings = {
      quit-after-last-window-closed = true;
      shell-integration-features = "no-cursor";
      cursor-style = "block";
      cursor-style-blink = false;
      cursor-text = "#000000";
      gtk-single-instance = true;
    };
  };

  programs.kitty = {
    enable = true;
    package = pkgs.emptyDirectory;
    settings = {
      confirm_os_window_close = -1;
      shell_integration = "enabled";
      macos_quit_when_last_window_closed = "yes";
      cursor_blink_interval = "0";
    };
    extraConfig = ''
      include ./extra.conf
    '';
  };

  programs.wezterm = {
    enable = true;
    package = pkgs.emptyDirectory;
    extraConfig = ''
      return {
        hide_tab_bar_if_only_one_tab = true
      }
    '';
  };
}
