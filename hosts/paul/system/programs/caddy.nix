{ config, pkgs, ... }: {
  services.caddy = {
    enable = true;
    virtualHosts.bio = {
      hostName = "127.0.0.1";
      extraConfig = ''
        :8068 {
          root * /srv/bio
          file_server
        }
      '';
    };
  };
}

