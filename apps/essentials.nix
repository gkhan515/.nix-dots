{ config, pkgs, ...}:

{
  imports = [
    ./shells/shell.nix
  ];

  environment.systemPackages = with pkgs; [
    git
    htop
    mpv
    neovim
    nodejs_20
    ntfs3g
    python3
    wezterm
    yt-dlp
    zathura
  ];
}
