{ config, pkgs, ...}:

{
  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = -1;
      shell_integration = "enabled";
      macos_quit_when_last_window_closed = "yes";
    };
  };

  programs.wezterm = {
    enable = true;
    extraConfig = ''
      return {
        hide_tab_bar_if_only_one_tab = true
      }
    '';
  };
}
