{ config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    ani-cli
    nodePackages.peerflix
  ];
}
