{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";

    baseIndex = 1;
    # escapeTime = 10;

    extraConfig = ''
      set-option -sa terminal-overrides ",*:Tc"
      set-option -sg escape-time 10
    '';

    plugins = with pkgs.tmuxPlugins; [
      # onedark-theme
    ];
 };

 # stylix.targets.tmux.enable = false;
}
