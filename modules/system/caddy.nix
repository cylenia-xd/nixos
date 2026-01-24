{ pkgs, ... }: {
  services.caddy = {
    enable = true;
    package = pkgs.caddy;
    virtualHosts = {
      ":8068".extraConfig = ''
        root * /srv/bio/_site
        file_server
      '';
      ":8071".extraConfig = ''
        root * /srv/countdown
        file_server
      '';
    };
  };
}
