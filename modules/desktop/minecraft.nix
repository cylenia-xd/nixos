{ pkgs, ... }: {
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
            "mods/e4mc.jar".source = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/qANg5Jrr/versions/jpS88LKC/e4mc_minecraft-fabric-5.5.4.jar";
              hash = "sha256-n55fWcbVpmC+qE/Kw3VTyskfwDQXKrvtQDk+/j1Ymho=";
            };
            "mods/dh.jar".source = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/uCdwusMi/versions/lC6CwqPp/DistantHorizons-2.4.5-b-1.20.1-fabric-forge.jar";
              hash = "sha256-4pxdakfOQOwXT5YQSsNjlgXeMOOBGzmQfecHD+sjDMI=";
            };
            "mods/ias.jar".source = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/cudtvDnd/versions/BEifi05w/IAS-Fabric-1.20.1-9.0.4.jar";
              hash = "sha256-IdTNOcTI9EejR014XbSvqIlrqrTG5JyvCkgvzpBT03s=";
            };
          };
        };
      };
    };
  };
}
