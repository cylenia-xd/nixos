{ config, pkgs, ... }: {
  services.caddy = {
    enable = true;
    virtualHosts."0.0.0.0:8068" = {
      extraConfig = ''
        root * /srv/bio
        file_server
      '';
    };
  };
}

