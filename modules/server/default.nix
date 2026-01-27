{ pkgs, ... }: {
  imports = [
    ./caddy.nix
    ./immich.nix
    ./newt.nix
    ./openssh.nix
    ./vaultwarden.nix    
    ./flix.nix
    ./minecraft.nix
  ];

  environment.systemPackages = [ pkgs.git ];
}
