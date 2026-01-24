{ ... }: {
  imports = [
    ./gpg.nix
    ./shell.nix
    ./sops.nix
    ./users.nix
    ./localization.nix
    ./boot.nix
    ./network.nix
    ./nix.nix
  ];
}
