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
  ];

  users.users.cylenia = {
    isNormalUser = true;
    description = "Cylenia";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  systemd.services.git-update = {
    description = "Git pull updater";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.bash}/bin/bash -c 'cd /srv/bio && git pull'";
      Type = "oneshot";
    };
  };

  environment.systemPackages = with pkgs; [
    sops
  ];

  sops.defaultSopsFile = ../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.keyFile = "/home/cylenia/.config/sops/age/keys.txt";
  sops.secrets.pangolin_env = {};
  sops.secrets.searxng_secret = {};

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # don't change this!
  system.stateVersion = "25.11";
}
