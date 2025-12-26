{ config, pkgs, ... }: {
  services.nginx = {
    enable = true;
    virtualHosts.localhost = {
      locations."/" = {
        proxyPass = "http://127.0.0.1:8067";
        proxyWebsockets = true;
        extraConfig = "proxy_pass_header Authorization;";
      };
    };
  };
}
