{ pkgs, ... }:

{
  imports = [
    ../../apps/nixvim
    ../../styles/macos.nix
    ../../apps/terminals
    ../../apps/tmux.nix
    # ../../apps/starship.nix
  ];

  home.username = "gkhan";
  home.homeDirectory = "/Users/gkhan";

  programs.btop.enable = true;
  programs.kitty.package = pkgs.emptyDirectory;
  programs.wezterm.package = pkgs.emptyDirectory;

  # home.packages = with pkgs; [
  # ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;

  # nixpkgs = {
  #   config = {
  #     allowUnfree = true;
  #     allowUnfreePredicate = (_: true);
  #   };
  # };
 
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.
}
