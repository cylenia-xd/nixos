{
  description = "Very awesome NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fjordlauncher.url = "github:hero-persson/FjordLauncherUnlocked";
  };

  outputs = { self, nixpkgs, home-manager, fjordlauncher, ... }@inputs: {
    nixosConfigurations.trissa = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        home-manager.nixosModules.default {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs; };
            users.cylenia = ./home.nix;
          };
        }
      ];
    };
  };
}
