{ pkgs, ... }: {
  imports = [
    ./caddy.nix
    ./immich.nix
    ./newt.nix
    ./openssh.nix
    ./vaultwarden.nix    
    ./jellyfin.nix
  ];

  environment.systemPackages = [ pkgs.git ];
}
