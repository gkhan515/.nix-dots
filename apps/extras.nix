{ config, pkgs, ...}:

{

  home.sessionVariables = {
    EDITOR = "neovim";
  };

  home.packages = with pkgs; [
    ani-cli
    nodePackages.peerflix
  ];

  programs.btop.enable = true;
  programs.kitty.enable = true;
  programs.wezterm.enable = true;

}
