{ config, pkgs, ... }: {
  services.cloudflared = {
    enable = true;
    certificateFile = /root/.cloudflared/cert.pem;
    tunnels = {
      "a47e5b10-67d7-44c0-a486-2c63b09bcd62" = {
        credentialsFile = /root/.cloudflared/a47e5b10-67d7-44c0-a486-2c63b09bcd62.json;
        default = "http://localhost:80";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    cloudflared
  ];
}
