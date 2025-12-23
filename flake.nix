{
  description = "Very awesome NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.trissa = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/trissa/system/configuration.nix
        home-manager.nixosModules.default {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.cylenia = ./hosts/trissa/home/home.nix;
            extraSpecialArgs = { inherit inputs; };
          };
        }
      ];
    };
    nixosConfigurations.paul = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/paul/system/configuration.nix
        home-manager.nixosModules.default {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.cylenia = ./hosts/paul/home/home.nix;
            extraSpecialArgs = { inherit inputs; };
          };
        }
      ];
    };
  };
}
