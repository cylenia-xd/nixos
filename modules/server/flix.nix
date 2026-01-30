{ ... }: {
  users.groups.flix = {};
  
  services.jellyfin.enable = true;

  services.radarr = {
    enable = true;
    group = "flix";
    settings = {
      server.urlbase = "";
      server.bindaddress = "*";
      server.port = 7069;
      server.enablessl = false;
    };
  };

  services.sonarr = {
    enable = true;
    group = "flix";
    settings = {
      server.urlbase = "";
      server.bindaddress = "*";
      server.port = 7072;
      server.enablessl = false;
    };
  };

  services.jellyseerr = {
    enable = true;
    port = 7070;
  };
}
