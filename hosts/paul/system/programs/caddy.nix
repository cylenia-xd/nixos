{ config, pkgs, ... }: {
  services.caddy = {
    enable = true;
    virtualHosts."http://0.0.0.0:8068" = {
      root = "/srv/bio";
      extraConfig = ''
        handle {
          file_server
        }
      '';
    };
  };
}

