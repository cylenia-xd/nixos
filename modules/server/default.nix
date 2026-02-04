{ pkgs, ... }: {
  imports = [
    ./caddy.nix
    ./immich.nix
    ./newt.nix
    ./openssh.nix
    ./vaultwarden.nix    
    ./librechat.nix
  ];

  environment.systemPackages = [ pkgs.git ];
}
