{ config, pkgs, ... }: {
  services.cloudflared = {
    enable = true;
    certificateFile = "${config.sops.secrets.tunnel_certificate.path}";
    tunnels = {
      "a47e5b10-67d7-44c0-a486-2c63b09bcd62" = {
        credentialsFile = "${config.sops.secrets.tunnel_credentials.path}";
        default = "http://localhost:80";
      };
    };
  };
}
