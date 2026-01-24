{ pkgs, ... }: {
  imports = [
    ./gpg.nix
    ./shell.nix
    ./sops.nix
  ];

  environment.systemPackages = with pkgs; [ git ];
}
