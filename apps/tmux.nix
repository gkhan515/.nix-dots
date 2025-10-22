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
      {
        plugin = resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-capture-pane-contents 'on'
        '';
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-save-interval '10'
          set -g @continuum-restore 'on'
          set -g @continuum-boot 'on'
        '';
      }
    ];
 };

 # stylix.targets.tmux.enable = false;
}
