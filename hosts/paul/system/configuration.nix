{ config, pkgs, inputs, ... }: {
  imports = [
    ./hardware.nix
    ./boot.nix
    ./networking.nix
    ./localization.nix
    ./programs/caddy.nix
    ./programs/cloudflared.nix
    ./programs/sshd.nix
    ./programs/gpg.nix
  ];

  users.users.cylenia = {
    isNormalUser = true;
    description = "Cylenia";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  environment.systemPackages = with pkgs; [
    cloudflared
    sops
  ];

  sops.defaultSopsFile = ../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.keyFile = "/home/cylenia/.config/sops/age/keys.txt";
  sops.secrets.tunnel_certificate = {};
  sops.secrets.tunnel_credentials = {};

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # don't change this!
  system.stateVersion = "25.11";
}
