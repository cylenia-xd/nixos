{ config, pkgs, inputs, ... }: {
  imports = [
    ./hardware.nix
    ./boot.nix
    ./networking.nix
    ./localization.nix
    ./programs/newt.nix
    ./programs/sshd.nix
    ./programs/gpg.nix
    ./programs/searxng.nix
    ./programs/caddy.nix
    ./programs/vaultwarden.nix
    ./programs/ente.nix
  ];

  users.users.cylenia = {
    isNormalUser = true;
    description = "Cylenia";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  environment.systemPackages = with pkgs; [
    sops
  ];

  sops.defaultSopsFile = ../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.keyFile = "/home/cylenia/.config/sops/age/keys.txt";
  sops.secrets.pangolin_env = {};
  sops.secrets.vaultwarden_env = {};
  sops.secrets.searxng_secret = {};
  sops.secrets.ente_encryption = {};
  sops.secrets.ente_hash = {};
  sops.secrets.ente_jwt = {};

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # don't change this!
  system.stateVersion = "25.11";
}
