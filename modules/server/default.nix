{ pkgs, ... }: {
  imports = [
    ./caddy.nix
    ./immich.nix
    ./sshd.nix
    ./newt.nix
    ./vaultwarden.nix    
  ];

  environment.systemPackages = [ pkgs.git ];
}
