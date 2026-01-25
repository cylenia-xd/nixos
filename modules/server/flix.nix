{ pkgs, ... }: {
  users.groups.flix = {};
  
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

  services.qbittorrent = {
    enable = true;
    group = "flix";
    webuiPort = 7071;
    serverConfig = {
      LegalNotice.Accepted = true;
      Preferences = {
        WebUI = {
          Username = "opsecgod";
          Password_PBKDF2 = "3w0Is1aJxe38as7F7JUUQg==:hEwwOmVelvk75lzicJG0CfrHDDG2pormQvHV5b0ZT602Wy/b3iiHvcqnzwyEnn/82/QnLa/fiWQAteMj1UhYUQ==";
          AlternativeUIEnabled = true;
          RootFolder = "${pkgs.vuetorrent}/share/vuetorrent";
        };
        General.Locale = "en";
      };
    };
  };
}
