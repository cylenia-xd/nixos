{ config, pkgs, ... }: {
  services.caddy = {
    enable = true;
    virtualHosts."http://0.0.0.0:8068" = {
      root = "/srv/bio";
      extraConfig = ''
        @api path /api/update
        handle @api {
          uri strip_prefix /api
          reverse_proxy /update {
            to unix//run/git-update.sock
          }
        }
        handle {
          file_server
        }
      '';
    };
  };
}

