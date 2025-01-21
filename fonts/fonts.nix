{ config, pkgs, ...}:

{
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    # iosevka
    nerd-fonts.iosevka-term-slab
    # font-awesome
  ];
}
