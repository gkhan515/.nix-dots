{ config, pkgs, ...}:

{
  fonts.packages = with pkgs; [
    commit-mono
    nerd-fonts.fira-code
    iosevka
    nerd-fonts.iosevka-term-slab
    # font-awesome
  ];
}
