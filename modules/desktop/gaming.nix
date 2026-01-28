{ pkgs, ... }: {
  hm.home.packages = [ pkgs.space-space-station-14-launcher ];
  
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
          java.memory = 4000;
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
            "mods/mt.jar".source = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/aC3cM3Vq/versions/mjuG4AYd/MouseTweaks-fabric-mc1.20-2.26.jar";
              hash = "sha256-Hrnwx4eFmKOn37Us0OgVnr+LM7BObfIyU0/tL7tmFuQ=";
            };
            "mods/axiom.jar".source = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/N6n5dqoA/versions/KYfgWqQU/Axiom-5.2.1-for-MC1.20.1.jar";
              hash = "sha256-hKyqr4tPFyJJ42WIbrVvzEe5lBfkvxG8vg6XIq8fPQQ=";
            };
          };
        };
      };
    };
  };
}
