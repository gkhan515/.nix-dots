{ config, pkgs, ...}:

{
  home.packages = with pkgs; [
    ani-cli
    nodePackages.peerflix
  ];
}
