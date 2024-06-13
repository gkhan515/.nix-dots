{ config, pkgs, ...}:

{

  home.sessionVariables = {
    EDITOR = "neovim";
  };

  imports = [
    ../shells/shells.nix
  ];

  home.packages = with pkgs; [
    ani-cli
    nodePackages.peerflix
  ];
}
