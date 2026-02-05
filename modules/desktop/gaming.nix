{ pkgs, ... }: {
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  hm.nixcraft = {
    enable = true;
    server.instances = {};
    client = {
      shared = {
        binEntry.enable = true;
        account = {
          username = "Placeholder";
          uuid = "00000000-0000-0000-0000-000000000000";
          offline = true;
        };
      };
      instances = {
        warpium = {
          enable = true;
          java.memory = 4000;
          mrpack = {
            enable = true;
            file = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/1KVo5zza/versions/yqCCvD11/Fabulously.Optimized-v12.0.0.mrpack";
              hash = "sha256-zantYaX/i3qYaTArMd9NYNYINON1IxMHJdFL5A5Y7NI=";
            };
          };
          files = {
            "mods/ias.jar".source = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/cudtvDnd/versions/oSzaukGT/IAS-9.0.6-alpha.2%2B1.21.11-fabric.jar";
              hash = "sha256-//1prgwr2wIdXFK448KF5iFl2cJWMwFuFyC1Bo058SI=";
            };
          };
        };
      };
    };
  };
}
