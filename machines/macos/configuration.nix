{ pkgs, self, ... }: 

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget

  environment.systemPackages = with pkgs; [
    kitty
    neovim
  ];

  # homebrew = {
  #   enable = true;
  #   brews = [
  #   ];
  #   casks = [
  #   ];
  # };

  # system.activationScripts.postActivation.text = ''
  # '';

  services = {
    skhd.enable = true;
    yabai.enable = true;
  };  

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";
  
  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;
  
  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;
  
  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
