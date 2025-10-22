{ inputs, ...}:

{
  imports = [
    inputs.stylix.homeModules.stylix
    ./stylix.nix
  ];

  stylix = {
    enableReleaseChecks = false;
    image = /Users/gkhan/.dotfiles/wallpapers/kame-house.jpg;
  };
}
