{ config, pkgs, ...}:

{

  home.sessionVariables = {
    EDITOR = "neovim";
  };

  home.packages = with pkgs; [
    # ags
    cmatrix
    discord
    distrobox
    # eww
    helix
    # nodePackages.peerflix
    # nodePackages_latest.webtorrent-cli

    # (builtins.getFlake "github:0xc000022070/zen-browser-flake").packages.${builtins.currentSystem}.default
  ];

  programs.btop.enable = true;
  programs.kitty.enable = true;
  programs.wezterm.enable = true;

}
