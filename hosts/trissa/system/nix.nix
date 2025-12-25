{ config, pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "olm-3.2.16"
  ];
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      "https://freesmlauncher.cachix.org"
    ];
    trusted-public-keys = [
      "freesmlauncher.cachix.org-1:Jcp5Q9wiLL+EDv8Mh7c6L9xGk+lXr7/otpKxMOuBuDs="
    ];
  };
}
