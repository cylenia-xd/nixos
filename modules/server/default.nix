{ ... }: {
  imports = [
    ./caddy.nix
    ./immich.nix
    ./sshd.nix
    ./newt.nix
    ./vaultwarden.nix    
  ];
}
