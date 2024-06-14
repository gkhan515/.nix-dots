{ config, pkgs, ...}:

{

  home.sessionVariables = {
    EDITOR = "neovim";
  };

  home.packages = with pkgs; [
    ani-cli
    nodePackages.peerflix
  ];
}
