{ pkgs, ... }: {
  services.caddy = {
    enable = true;
    package = pkgs.caddy;
    };
    extraConfig = ''
      :8068 {
        root * /srv/bio/_site
        file_server
      }

      :8071 {
        root * /srv/countdown
        file_server
      }
    '';
  };
}
