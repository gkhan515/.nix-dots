{ config, pkgs, inputs, ...}:

{
  imports = [
    inputs.stylix.darwinModules.stylix
    ./stylix.nix
  ];

  stylix = {
    enableReleaseChecks = false;
    image = /Users/gkhan/.dotfiles/wallpapers/kame-house.jpg;
  };
}
