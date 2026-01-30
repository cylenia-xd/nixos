{ ... }: {
  services.navidrome = {
    enable = true;
    group = "flix";
    settings = {
      MusicFolder = "/opt/media/music";
      BaseUrl = "https://music.cylenia.dev";
      Port = 8071;
    };
  };

  services.lidarr = {
    enable = true;
    group = "flix";
    settings = {
      server.urlbase = "";
      server.bindaddress = "*";
      server.port = 7073;
      server.enablessl = false;
    };
  };
}
