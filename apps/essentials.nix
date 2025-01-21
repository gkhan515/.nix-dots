{ config, pkgs, ...}:

{
  imports = [
  ];

  environment.systemPackages = with pkgs; [
    firefox
    git
    htop
    killall
    mpv
    neovim
    nodejs_20
    ntfs3g
    pavucontrol
    python3
    wezterm
    yt-dlp
    zathura
  ];

  hardware.brillo.enable = true;
}
