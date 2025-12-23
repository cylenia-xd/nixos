{ config, pkgs, ... }: {
  services.cloudflared = {
    enable = false;
  };
}
