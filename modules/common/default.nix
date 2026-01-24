{ ... }: {
  imports = [
    ./boot.nix
    ./gpg.nix
    ./localization.nix
    ./network.nix
    ./nix.nix
    ./shell.nix
    ./sops.nix
    ./users.nix
  ];
}
