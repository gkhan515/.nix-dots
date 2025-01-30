{ config, pkgs, inputs, ...}:

{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";

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
