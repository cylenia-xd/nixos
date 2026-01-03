{ config, pkgs, ... }: {
  services.caddy = {
    enable = true;
    extraConfig = ''
      :8068 {
        root * /srv/bio
        file_server
      }
    '';
  };
}

