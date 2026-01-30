{ pkgs, ... }: {
  imports = [
    ./caddy.nix
    ./immich.nix
    ./newt.nix
    ./openssh.nix
    ./vaultwarden.nix    
    ./torrenting.nix
    ./flix.nix
    ./navidrome.nix
  ];

  environment.systemPackages = [ pkgs.git ];
}
