{ config, pkgs, ... }: {
  services.caddy = {
    enable = true;
    email = "me@cylenia.dev";
    virtualHosts = {
      "192.168.86.50".extraConfig = ''
        respond "Hello, world!"
      '';
    };
  };
}
