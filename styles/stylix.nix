{ config, pkgs, inputs, ...}:

{
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  stylix = {
    enable = true;
    image = /home/gkhan/.dotfiles/wallpapers/kame-house.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";

    cursor = {
      package = pkgs.google-cursor;
      name = "GoogleDot-White";
      size = 24;
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.iosevka-term-slab;
        name = "IosevkaTermSlab Nerd Font";
      };
      # serif = {};
      # sansSerif = {};
      # emoji = {};

      sizes = {
        # applications = ;
        # desktop = ;
        # popups  ;
        terminal = 13;
      };
    };

    opacity = {
      # applications = ;
      # desktop = ;
      # popups = ;
      # terminal = 0.9;
    };
  };
}
