{ config, pkgs, ... }: {
  networking.hostName = "paul";
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;
}
