{ config, lib, pkgs, ... }: {
  imports = [
    ./hardware.nix
    ./boot.nix
    ./networking.nix
    ./localization.nix
    ./audio.nix
    ./xdg.nix
    ./nix.nix
    ./environment.nix
    ./programs/greetd.nix
    ./programs/gpg.nix
  ];

  users.users.cylenia = {
    isNormalUser = true;
    description = "Cylenia";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  programs.niri.enable = true;
  programs.zsh.enable = true;

  # don't change this!
  system.stateVersion = "25.11";
}
