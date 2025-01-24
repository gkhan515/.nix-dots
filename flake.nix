{
  description = "my config flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
  };

  outputs = {self, nixpkgs, ...}@inputs:
  {
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./machines/x86_64-linux/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };

    };

    homeConfigurations = {};

    darwinConfigurations = {
      default = inputs.darwin.lib.darwinSystem {
        specialArgs = { inherit self; inherit inputs; };
        modules = [ 
	  ./machines/macos/configuration.nix
	  inputs.home-manager.darwinModules.home-manager
	];
      };
    };

  };
}
