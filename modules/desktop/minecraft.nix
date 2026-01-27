{ pkgs, ... }: {
  hm.nixcraft = {
    enable = true;

    server.instances = {};
    client = {
      shared = {
        binEntry.enable = true;
        account = {
          username = "Cylenia";
          uuid = "10636299-87c3-4ae0-b9a1-9ecb00282433";
          offline = true;
        };
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
            "mods/chunky.jar".source = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/fALzjamp/versions/NHWYq9at/Chunky-1.3.146.jar";
              hash = "sha256-rn+501o6nZ1PIQSurnsxqQHF5YQokeLt2d3MQsJkajg=";
            };
            "mods/e4mc.jar".source = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/qANg5Jrr/versions/jpS88LKC/e4mc_minecraft-fabric-5.5.4.jar";
              hash = "sha256-n55fWcbVpmC+qE/Kw3VTyskfwDQXKrvtQDk+/j1Ymho=";
            };
            "mods/dh.jar".source = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/uCdwusMi/versions/lC6CwqPp/DistantHorizons-2.4.5-b-1.20.1-fabric-forge.jar";
              hash = "sha256-4pxdakfOQOwXT5YQSsNjlgXeMOOBGzmQfecHD+sjDMI=";
            };
          };
        };
      };
    };
  };
}
