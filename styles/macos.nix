{ inputs, ...}:

{
  imports = [
    inputs.stylix.homeManagerModules.stylix
    ./stylix.nix
  ];

  stylix = {
    enableReleaseChecks = false;
    image = /Users/gkhan/.dotfiles/wallpapers/kame-house.jpg;
  };
}
