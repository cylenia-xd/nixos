{
  description = "Very awesome NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, sops-nix, ... }@inputs: {
    nixosConfigurations.jane = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      system = "x86_64-linux";
      modules = [
        ./hosts/jane/system/configuration.nix
        sops-nix.nixosModules.sops
        home-manager.nixosModules.default {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.cylenia = ./hosts/jane/home/home.nix;
            extraSpecialArgs = { inherit inputs; };
          };
        }
      ];
    };
    nixosConfigurations.paul = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      system = "x86_64-linux";
      modules = [
        ./hosts/paul/system/configuration.nix
        sops-nix.nixosModules.sops
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
