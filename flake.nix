{
  description = "my config flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
  };

  outputs = {self, nixpkgs, ...}@inputs:
  {
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./machines/x86_64-linux/configuration.nix
        ];
      };

      darwin = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = [
          ./machines/m1-vm/configuration.nix
        ];
      };
    };
  };
}
