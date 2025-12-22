{ config, pkgs, ... }: {
  imports = [
    ./hardware.nix
    ./boot.nix
    ./networking.nix
    ./localization.nix
    ./programs/caddy.nix
  ];

  users.users.cylenia = {
    isNormalUser = true;
    description = "Cylenia";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.openssh = {
    enable = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # don't change this!
  system.stateVersion = "25.11";
}
