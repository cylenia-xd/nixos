{ ... }: {
  services.jellyfin.enable = true;

  services.prowlarr = {
    enable = true;
    settings = {
      server.urlbase = "";
      server.bindaddress = "*";
      server.port = 7067;
      server.enablessl = false;
    };
  };

  services.flaresolverr = {
    enable = true;
    port = 7068;
  };
}
