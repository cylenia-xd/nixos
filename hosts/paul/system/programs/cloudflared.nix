{ config, pkgs, ... }: {
  services.cloudflared = {
    enable = true;
    certificateFile = /opt/tunnelsecrets/cert.pem;
    tunnels = {
      "a47e5b10-67d7-44c0-a486-2c63b09bcd62" = {
        credentialsFile = /opt/tunnelsecrets/tunnel.json;
        default = "http://localhost:80";
      };
    };
  };
}
