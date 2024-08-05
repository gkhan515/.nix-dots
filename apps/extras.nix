{ config, pkgs, ...}:

{

  home.sessionVariables = {
    EDITOR = "neovim";
  };

  home.packages = with pkgs; [
    ani-cli
    cmatrix
    discord
    distrobox
    eww
    helix
    nodePackages.peerflix
    # nodePackages_latest.webtorrent-cli
  ];

  programs.btop.enable = true;
  programs.kitty.enable = true;
  programs.wezterm.enable = true;

}
