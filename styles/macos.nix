{ config, pkgs, inputs, ...}:

{
  imports = [
    inputs.stylix.darwinModules.stylix
    ./stylix.nix
  ];

  stylix = {
    image = /Users/gkhan/.dotfiles/wallpapers/kame-house.jpg;
  };
}
