{ config, pkgs, ... }: {
  services.caddy = {
    enable = true;
    email = "me@cylenia.dev";
    virtualHosts = {
      "localhost".extraConfig = ''
        respond "Hello, world!"
      '';
    };
  };
}
