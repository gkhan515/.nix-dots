{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";

    baseIndex = 1;

    extraConfig = ''
      set-option -sa terminal-overrides ",*:Tc"
    '';

    plugins = with pkgs.tmuxPlugins; [
      # onedark-theme
    ];
 };

 # stylix.targets.tmux.enable = false;
}
