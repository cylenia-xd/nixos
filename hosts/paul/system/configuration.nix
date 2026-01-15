{ pkgs, ... }: {
  imports = [
    ./hardware.nix
    ./modules/newt.nix
    ./modules/sshd.nix
    ./modules/gpg.nix
    ./modules/searxng.nix
    ./modules/caddy.nix
    ./modules/vaultwarden.nix
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

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.network.ssh.enable = true;

  networking.hostName = "paul";
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  time.timeZone = "Australia/Melbourne";
  console.keyMap = "uk";
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

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
