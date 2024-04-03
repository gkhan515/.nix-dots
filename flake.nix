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
  };

  outputs = {self, nixpkgs, ...}@inputs:
  {
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	specialArgs = {inherit inputs;};
        modules = [
          ./machines/x86_64-linux/configuration.nix
        ];
      };

      m1-vm = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
	specialArgs = {inherit inputs;};
        modules = [
          ./machines/m1-vm/configuration.nix
	  inputs.home-manager.nixosModules.default
        ];
      };
    };

    homeConfigurations = {};
  };
}
