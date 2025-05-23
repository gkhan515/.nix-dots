{ pkgs, self, inputs, ... }: 

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget

  imports = [
    ../../fonts/fonts.nix
    # ../../styles/macos.nix
  ];

  environment.systemPackages = with pkgs; [
    btop
    cmatrix
    dotnetCorePackages.dotnet_9.sdk
    home-manager
    htop
    # ladybird
    texliveFull
    mpv
    neovim
    starship
    tmux
    yt-dlp
    zathura
  ];

  homebrew = {
    enable = true;
    # brews = [
    # ];
    casks = [
      "betterdisplay"
      "discord"
      "firefox"
      "iina"
      "kitty"
    ];
  };

  # system.activationScripts.postActivation.text = ''
  # '';

  services = {
    skhd.enable = true;
    yabai.enable = true;
  };

  users.users.gkhan = {
    name = "gkhan";
    home = "/Users/gkhan";
  };

  # home-manager = {
  #   extraSpecialArgs = { inherit inputs; };
  #   users = {
  #     gkhan = import ./home.nix;
  #   };
  #   backupFileExtension = "BAK";
  #   useGlobalPkgs = true;
  #   useUserPackages = true;
  # };

  nix.optimise.automatic = true;

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
