{ config, pkgs, ... }: {
  networking.hostName = "trissa";
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;
}
