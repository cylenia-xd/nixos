{ pkgs, ... }: {
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
  ];

  users.users.cylenia = {
    isNormalUser = true;
    description = "Cylenia";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  environment.systemPackages = with pkgs; [
    sops
    git
  ];

  sops.defaultSopsFile = ../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.keyFile = "/home/cylenia/.config/sops/age/keys.txt";
  sops.secrets = {
    pangolin_env = {};
    vaultwarden_env = {};
    searxng_secret = {};
    email_password_hash = {};
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # don't change this!
  system.stateVersion = "25.11";
}
