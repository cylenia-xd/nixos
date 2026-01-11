{ ... }: {
  services.caddy = {
    enable = true;
    extraConfig = ''
      :8068 {
        root * /srv/bio/_site
        file_server
      }

      :8069 {
        root * /srv/dash
        file_server
      }
    '';
  };
}

