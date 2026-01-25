{ ... }: {
  services.jellyfin.enable = true;
  services.prowlarr = {
    enable = true;
    settings = {
      server.urlbase = "http://192.168.86.50:7067";
      server.bindaddress = "*";
      server.port = 7067;
      server.enablessl = false;
    };
  };
}
