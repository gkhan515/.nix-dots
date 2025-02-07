{ pkgs, inputs, ...}:

{
  imports = [
    inputs.stylix.nixosModules.stylix
    ./stylix.nix
  ];

  stylix = {
    image = /home/gkhan/.dotfiles/wallpapers/kame-house.jpg;
    cursor = {
      package = pkgs.google-cursor;
      name = "GoogleDot-White";
      size = 24;
    };
  };
}
