{ pkgs, self, inputs, ... }: 

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget

  imports = [
    ../../fonts/fonts.nix
    # ../../styles/macos.nix
  ];

  system.primaryUser = "gkhan";

  environment.systemPackages = with pkgs; [
    btop
    cmake
    cmatrix
    dotnetCorePackages.sdk_9_0-bin
    home-manager
    htop
    jdk
    # zulu # java
    # ladybird
    texliveFull
    mpv
    neovim
    nodePackages.serve
    starship
    tmux
    yt-dlp
    zathura
  ];

  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
    };
    brews = [
      "emacs-plus@29"
      "git-lfs"
      "sdl3"
      "sdl3_ttf"
      "skhd"
      "webtorrent-cli"
      "yabai"
    ];
    casks = [
      "alacritty"
      "anaconda"
      "betterdisplay"
      "discord"
      "firefox"
      "ghostty"
      "iina"
      "ipe"
      "kitty"
      "libreoffice"
      "obsidian"
      "onyx"
      "openmtp"
      "protonvpn"
      "stremio"
      "unity-hub"
      "visual-studio-code"
      "vlc"
      "wezterm"
      "zoom"
    ];
    taps = [
      "d12frosted/emacs-plus"
      "koekeishiya/formulae"
    ];
  };

  # system.activationScripts.postActivation.text = ''
  # '';

  services = {
    # skhd.enable = true;
    # yabai.enable = true;
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
