{
  description = "Very awesome NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    freesmlauncher = {
      url = "https://github.com/FreesmTeam/FreesmLauncher/archive/develop.tar.gz";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.trissa = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./src/configuration.nix
        home-manager.nixosModules.default {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.cylenia = ./src/home/home.nix;
            extraSpecialArgs = { inherit inputs; };
          };
        }
      ];
    };
  };
}
