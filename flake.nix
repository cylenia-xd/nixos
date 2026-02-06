{
  description = "Very awesome NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    textfox.url = "github:adriankarlen/textfox";
    arkenfox-nixos.url = "github:dwarfmaster/arkenfox-nixos";
    catppuccin.url = "github:catppuccin/nix";
    home-manager.url = "github:nix-community/home-manager/master";
    sops-nix.url = "github:Mic92/sops-nix";
    nixcraft = {
      url = "github:loystonpais/nixcraft";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, sops-nix, catppuccin, ... }@inputs: {
    nixosConfigurations.jane = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      system = "x86_64-linux";
      modules = [
        ./hosts/jane.nix
        sops-nix.nixosModules.sops
        catppuccin.nixosModules.catppuccin
        home-manager.nixosModules.default {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            sharedModules = [
              inputs.nixcraft.homeModules.default
              inputs.arkenfox-nixos.hmModules.arkenfox
              inputs.catppuccin.homeModules.catppuccin
              inputs.textfox.homeManagerModules.default
            ];
          };
        }
      ];
    };
    nixosConfigurations.paul = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      system = "x86_64-linux";
      modules = [
        ./hosts/paul.nix
        sops-nix.nixosModules.sops
        home-manager.nixosModules.default {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
          };
        }
      ];
    };
  };
}
