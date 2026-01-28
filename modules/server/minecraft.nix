{ pkgs, ... }: {
  hm.nixcraft = {
    enable = true;

    client.instances = {};
    server = {
      shared = {
        agreeToEula = true;
        binEntry.enable = true;
      };
      instances = {
        create-plus = {
          enable = true;
          mrpack = {
            enable = true;
            file = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/HqonU57y/versions/rlTgMYB4/Create%2B%203.1.1.mrpack";
              hash = "sha256-ZuulZMd1enygNkSpyInQ2MdkBLvC63/mWe8GO1bc6cY=";
            };
          };
          files = {
            "mods/dh.jar".source = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/uCdwusMi/versions/lC6CwqPp/DistantHorizons-2.4.5-b-1.20.1-fabric-forge.jar";
              hash = "sha256-4pxdakfOQOwXT5YQSsNjlgXeMOOBGzmQfecHD+sjDMI=";
            };
          };
          java.memory = 2000;
          serverProperties = {
            bug-report-link = null;
            generate-structures = false;
            difficulty = "peaceful";
            gamemode = "creative";
            motd = "\\u00A7dCyltopia!";
            spawn-protection = 0;
            server-port = 25566;
          };
          service = {
            enable = true;
            autoStart = true;
          };
        };
      };
    };
  };
}

